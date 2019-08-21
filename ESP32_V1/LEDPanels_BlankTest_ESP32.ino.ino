/******************************************************************************

   Bare minimum test code to get four Piccadilly LED panels (based on MBI5034 LED drivers) showing all white on a ESP32.
   If you are using this code, consider that being all white means it needs all the power to work. 10 amps should do it.
   
   These panels have been donated via London Hackspace, and work has been done by Oliver Dewdney and Jon Russell
   to get them working on an Arduino. This example is kinda ported from their original code.

   Pin arrangement is specific to some printed circuit boards we made up, with a Lolin D32 pluged in.

   Norwich Hackspace

******************************************************************************/

//Set our MACROs to MACROs from http://esp32.info/docs/esp_idf/html/dd/d78/soc_8h_source.html
#define PIN_D1    BIT13   //D1 on Panel 1
#define PIN_D2    BIT12   //D2 on Panel 1
#define PIN_D3    BIT14   //D1 on Panel 2
#define PIN_D4    BIT27   //D2 on Panel 2
/*
#define PIN_D5    BIT26   //D1 on Panel 3, Needs changing - shared with serial
#define PIN_D6    BIT25   //D2 on Panel 3, Needs changing - shared with serial
#define PIN_D7    BIT19  //D1 on Panel 4
#define PIN_D8    BIT23  //D2 on Panel 4
*/
//All the panels share these...
#define PIN_A0    BIT15   //A0 on all Panels
#define PIN_A1    BIT2  //A1 on all Panels
#define PIN_CLK   BIT4   //CLK on all Panels
#define PIN_LAT   BIT18   //LAT on all Panels
//#define PIN_OE    *GND*  //OE on all Panels
//#define PIN_READY *?*  //OE for data buffers
//#define D32_UP 32  //Turn on voltage buffers (not needed for breadboard)

hw_timer_t * timer = NULL;

void setup() {
  Serial.begin(115200);
 // digitalWrite(PIN_READY, HIGH);
  
  int outPins[] = { 2,3,4,12,13,14,15,16,17,18,19,21,22,23,27 }; 
  for (int i = 0; i < 15; i++) //Yes, I'm a lazy coder.
  {
    pinMode(outPins[i], OUTPUT); //Consider pinMon better form than the faster GPIO_ENABLE_REG. This is just a setup stage.
  }

  REG_WRITE(GPIO_OUT_W1TC_REG, PIN_D1 + PIN_D2 + PIN_D3 + PIN_D4 + PIN_A0 + PIN_A1 + PIN_LAT + PIN_CLK); //Pins that start low

  // initialize Timer ~400Hz
  timer = timerBegin(3, 80, true); // Divide 80Mhz clock by 80 using prescaler. Timer is then counting each microsecond.
  timerAttachInterrupt(timer, &onTimer, true); //TODO: Just point straight to UpdateFrame if we don't have anything else to add to onTimer.
  timerAlarmWrite(timer, (1250 / 10) , true); //Should be 1250 for 400hz operation
  timerAlarmEnable(timer);

}


void onTimer() {
  UpdateFrame();
}

uint8_t bank = 0;
int foo = 0, low = -1, high = 16;
unsigned int dimmer = 0;
void UpdateFrame() {
for (uint16_t n = 0; n < 384; n++) { //Keep D1 and D2 pins high, so that R,G,B bits are all set.
    if (/*dimmer == 1 && */ foo > low && foo < high ) {
      REG_WRITE(GPIO_OUT_W1TS_REG, PIN_D1 + PIN_D2 + PIN_D3 + PIN_D4);
    } else {
      REG_WRITE(GPIO_OUT_W1TC_REG, PIN_D1 + PIN_D2 + PIN_D3 + PIN_D4 );
    }
    if (++foo > 47) foo = 0;
    REG_WRITE(GPIO_OUT_W1TC_REG, PIN_CLK);
    REG_WRITE(GPIO_OUT_W1TS_REG, PIN_CLK);
  }
 
  if (bank & 0x01) { //This sets which line we are updating.
   REG_WRITE(GPIO_OUT_W1TS_REG, PIN_A0);  // + 1
  } else {
   REG_WRITE(GPIO_OUT_W1TC_REG, PIN_A0);
  }
  if (bank & 0x02) {
    REG_WRITE(GPIO_OUT_W1TS_REG, PIN_A1); // + 2
  } else {
  REG_WRITE(GPIO_OUT_W1TC_REG, PIN_A1);
  }

  REG_WRITE(GPIO_OUT_W1TS_REG, PIN_LAT);
  REG_WRITE(GPIO_OUT_W1TC_REG, PIN_LAT); //TODO: Wait, how fast is all this? Maybe too fast, perhaps?

  if (++bank > 3) bank = 0;
  if (++dimmer > 10) {dimmer = 0;} //Poor mans PWM brightness!
}

void loop() {
  low = -1, high = 16; //Blue
  delay(500);
  low = 15, high = 32; //Green
  delay(500);
  low = 31, high = 48; //Red
  delay(500);
  low = -1, high = 48; //White
  delay(500);
  low = -1, high = -1; //Black
  delay(500);
  for (int i = 0; i < 184 ; i++) {
    low = (i/ 3) , high = (i/2); //Moving pattern  
    delay(10);
  }
  
  } //Use a timer instead of loop
