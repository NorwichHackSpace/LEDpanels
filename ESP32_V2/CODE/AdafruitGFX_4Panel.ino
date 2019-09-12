/******************************************************************************

   Example code to get four Piccadilly LED panels (based on MBI5034 LED drivers) working with Adafruit GFX library.
   
   If you are using this code, consider that being all white means it needs all the power to work. 
   At 3.3v, 10 amps should do it; at the full 5v you might need more.
   
   These panels have been donated via London Hackspace, and work has been done by Oliver Dewdney and Jon Russell
   to get them working on an Arduino. This example is kinda ported from their original code.

   Pin arrangement is specific to some printed circuit boards we made up, with a Lolin D32 pluged in.

   Paul Johnston, Alan Childs
   Norwich Hackspace

******************************************************************************/

//Set our MACROs to MACROs from http://esp32.info/docs/esp_idf/html/dd/d78/soc_8h_source.html
//Panel Serial Lines
#define BUS_D0    BIT14   
#define BUS_D1    BIT27   //Unused in this example
#define BUS_D2    BIT26   //Unused in this example
#define BUS_D3    BIT25   //Unused in this example
//Serial Clock
#define BUS_CLK   BIT13  //Clocks all four bus lines together
#define BUS_LAT   BIT12
//Panel Select
#define PAN_A0    BIT15   //A0 on all Panels
#define PAN_A1    BIT2  //A1 on all Panels
//Panel Clock
#define PAN_CLK   BIT4   //CLK on all Panels
#define PAN_LAT   BIT18   //LAT on all Panels

#define LED_BLACK 0     //For use with Adafruit GFX Library code
#define LED_BLUE 1
#define LED_GREEN 2
#define LED_CYAN 3
#define LED_RED 4
#define LED_MAGENTA 5
#define LED_YELLOW 6
#define LED_WHITE 7

////////////////////////////////////////////////////////////////////////////////////////////

#include <Adafruit_GFX.h>   //Depends on
#include <gfxfont.h>

class LedPanel : public Adafruit_GFX
{
  public:
    LedPanel() : Adafruit_GFX(256,16) {}; //TWO PANELS WIDE, ONE PANEL HEIGH
    
    //Overload specifics for these panels.
    void drawPixel(int16_t x, int16_t y, uint16_t color);
    uint16_t newColor(uint8_t red, uint8_t green, uint8_t blue);
    uint16_t getColor() { return textcolor; }
    void drawBitmapMem(int16_t x, int16_t y, const uint8_t *bitmap, int16_t w, int16_t h, uint16_t color);
};
LedPanel panel;

////////////////////////////////////////////////////////////////////////////////////

hw_timer_t * timer = NULL;

void setup() {
 Serial.begin(115200);
 pinMode(LED_BUILTIN, OUTPUT);
 digitalWrite(LED_BUILTIN, LOW); //LED_BUILTIN Doesn't need to be switched super fast, so use digitalWrite for it.
 
  Serial.println("***Setup Begins***");
  int outPins[] = { 2,4,12,13,14,15,18,25,26,27 }; //TODO: This seems repeatative, and should be linked to the defined above
  for (int i = 0;  i<sizeof outPins/sizeof outPins[0]; i++) 
  {
    Serial.println("Set Pin Out - " + String(outPins[i]));
    pinMode(outPins[i], OUTPUT); //Consider pinMode better form than the faster GPIO_ENABLE_REG. This is just a setup stage so speed is no issue here.
    digitalWrite(outPins[i], LOW);
  } 
 
  //Initialize Timer
  timer = timerBegin(3, 80, true); // Divide 80Mhz clock by 80 using prescaler. Timer is then counting each microsecond. The ESP32 has 4 timers.
  timerAttachInterrupt(timer, &UpdateFrame, true);
  timerAlarmWrite(timer, 1250 , true); //Should be 1250 for 400hz operation
  timerAlarmEnable(timer);

  delay(100);
  panel.fillScreen(LED_BLACK);
  
}

////////////////////////////////////////////////////////////////////////////////

unsigned char framebuffer[ 1536 ]; 
/* 
 *  
 * unsigned char will give us 8 bits which we can use for 4 panels
 * 
 * 
 * Pan0_D1 in bit 0
 * Pan0_D2 in bit 1
 * Pan1_D1 on bit 2
 * Pan1_D2 on bit 3
 * Pan2_D1 on bit 4
 * Pan2_D2 on bit 5
 * Pan3_D1 on bit 6
 * Pan3_D2 on bit 7
 * laid out like this:
 *    PAN0_D1    PAN1_D1    PAN2_D1    PAN3_D1
 *    PAN0_D2    PAN1_D2    PAN2_D2    PAN3_D2
 * 
 * for more panels can either use short or int, or larger char array
 * 
 */
void SetPixel( unsigned int x, unsigned int y, unsigned int col )
{
  // use the X and Y values to select the right bit
  unsigned int panel = x >> 6; // x / 64 
  unsigned int bitMask = 1 << (panel * 2);
  if ( y > 7 ) bitMask <<= 1; // shift over to D2 bit
  unsigned int row = y & 0x03;
  unsigned char *ptr = framebuffer + ((row*128)*3); // pointer to row 0, 1, 2, or 3

  // offset to the blue pixel
  ptr += (x & 0x38) * 6; // equivalent to: ptr += (x / 8) * 48, choosing the correct panel in the bitMask code
  ptr += (x & 7);  //choose the X offset within that panel,
  /* 
   * Within the panel the X offset should never be greater than 63, 
   * so we AND it with 0x38 to only use the low part of its value.
   * However the bitMask section above it can still only handle X values in the range 0-255. 
   * Values above that range would start choosing panels 5, 6, etc, 
   * which would set bits outside the range of a char and get lost when down cast into the 
   * famebuffer char.
   */
  ptr += (y & 4) * 2; // equivalent to: if ( y in the range 4->7 or 12->15 ) ptr += 8; else do nothing

  // blue
  if ( col & 0x01 ) *ptr |= bitMask;
  else *ptr &= ~bitMask;
  // green
  ptr += 16;
  if ( col & 0x02 ) *ptr |= bitMask;
  else *ptr &= ~bitMask;
  // red
  ptr += 16;
  if ( col & 0x04 ) *ptr |= bitMask;
  else *ptr &= ~bitMask;
}

////////////////////////////////////////////////////////////////////////////////

uint8_t currRow = 0;
int foo = 0, low = 0, high = 0; //Start blank
unsigned int dimmer = 0;

void UpdateFrame() {
  unsigned char *ptr = framebuffer + (384*currRow);
  for (uint16_t led = 0; led < 384; led++) 
  {
    
    REG_WRITE(GPIO_OUT_W1TC_REG, BUS_LAT + BUS_D0);
    
    unsigned int value = ptr[ led ];

    // 8 is the number of panels used. Remember that each physical panel is really two stacked together.
      for (int b = 0; b < 8; b++ ) 
      { 
        //Decide if we want the pixel on or off based on low/high
  
        if ( value & 0x80 ) {  //Start at the least siginicant bit and work backwards though the 8-bit/char
          REG_WRITE(GPIO_OUT_W1TS_REG, BUS_D0);
        } else {
          REG_WRITE(GPIO_OUT_W1TC_REG, BUS_D0 );
        }   
  
        REG_WRITE(GPIO_OUT_W1TS_REG, BUS_CLK );
        REG_WRITE(GPIO_OUT_W1TC_REG, BUS_CLK );

        value <<= 1; // move on to the next bit
      }
    
    REG_WRITE(GPIO_OUT_W1TS_REG, BUS_LAT );
     
    REG_WRITE(GPIO_OUT_W1TC_REG, PAN_CLK);
    REG_WRITE(GPIO_OUT_W1TS_REG, PAN_CLK);
  }

  if (currRow & 0x01) { //This sets which line we are updating.
    REG_WRITE(GPIO_OUT_W1TS_REG, PAN_A0);  // + 1 to the line count
  } else {
    REG_WRITE(GPIO_OUT_W1TC_REG, PAN_A0);
  }
  if (currRow & 0x02) {
    REG_WRITE(GPIO_OUT_W1TS_REG, PAN_A1); // + 2
  } else {
    REG_WRITE(GPIO_OUT_W1TC_REG, PAN_A1);
  }

  REG_WRITE(GPIO_OUT_W1TS_REG, PAN_LAT);
  REG_WRITE(GPIO_OUT_W1TC_REG, PAN_LAT); 

  if (++currRow > 3) { currRow = 0; }
}

////////////////////////////////////////////////////////////////////////////////

void LedPanel::drawPixel(int16_t x, int16_t y, uint16_t color) {
  SetPixel(x,y,color);
}

uint16_t LedPanel::newColor(uint8_t red, uint8_t green, uint8_t blue) {
  return (blue>>7) | ((green&0x80)>>6) | ((red&0x80)>>5);
}

void LedPanel::drawBitmapMem(int16_t x, int16_t y, const uint8_t *bitmap, int16_t w, int16_t h, uint16_t color) {
  int16_t i, j, byteWidth = (w + 7) / 8;

  for(j=0; j<h; j++) { //?Handle overflowing chars?
    for(i=0; i<w; i++ ) {
      if(bitmap[j * byteWidth + i / 8] & (128 >> (i & 7))) {
        panel.drawPixel(x+i, y+j, color);
      }
    }
  }
}

////////////////////////////////////////////////////////////////////////////////

unsigned countingthing = 0;
void loop() { 
   digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN)); //Just useful for debugging.
   
/*
      // color sweep
      for( unsigned int x = 0; x < 64; x++ )
      {
        for( unsigned int y = 0; y < 16; y++ )
        {
          SetPixel( 0, 0, color ); //color 7 is white
        }
      }
*/

  //Use Adafruit GFX to scroll some text
  int change = 1;
  for ( int width = 0 ; width > -1 ; width += change ) 
  {  
    Serial.println(change);
    panel.setCursor(width, 0);
    panel.setTextColor(LED_YELLOW);
    panel.println("NORWICH HACKSPACE");
    panel.setCursor(26 - width, 8);
    panel.setTextColor(LED_YELLOW);
    panel.println("HELLO, WORLD!");
    delay(50);
    panel.fillScreen(LED_BLACK);    
    if (width > 25) change = -1;
  }
  
}
