/******************************************************************************

   Bare minimum test code to get four Piccadilly LED panels (based on MBI5034 LED drivers) showing all white on a ESP32.
   If you are using this code, consider that being all white means it needs all the power to work. 10 amps should do it.
   
   These panels have been donated via London Hackspace, and work has been done by Oliver Dewdney and Jon Russell
   to get them working on an Arduino. This example is kinda ported from their original code.

   Pin arrangement is specific to some printed circuit boards we made up, with a Lolin D32 pluged in.

   Norwich Hackspace

******************************************************************************/


#define NUM_OF_PANELS 2

//Set our MACROs to MACROs from http://esp32.info/docs/esp_idf/html/dd/d78/soc_8h_source.html
//Panel Serial Lines
#define BUS_D0    BIT14   
#define BUS_D1    BIT27   //Unused in this example
#define BUS_D2    BIT26   //Unused in this example
#define BUS_D3    BIT25   //Unused in this example
//Serial Clock
#define BUS_CLK   BIT13
#define BUS_LAT   BIT12
//Panel Select
#define PAN_A0    BIT15   //A0 on all Panels
#define PAN_A1    BIT2  //A1 on all Panels
//Panel Clock
#define PAN_CLK   BIT4   //CLK on all Panels
#define PAN_LAT   BIT18   //LAT on all Panels

hw_timer_t * timer = NULL;

void setup() {
 Serial.begin(115200);
 pinMode(LED_BUILTIN, OUTPUT);
 digitalWrite(LED_BUILTIN, LOW);
 

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
  timerAttachInterrupt(timer, &UpdateFrame, true); //TODO: Just point straight to UpdateFrame if we don't have anything else to add to onTimer.
  timerAlarmWrite(timer, 1250 , true); //Should be 1250 for 400hz operation
  timerAlarmEnable(timer);
  
}

uint8_t bank = 0;
int foo = 0, low = 0, high = 0; //Start blank
unsigned int dimmer = 0;
unsigned int panel_total = (NUM_OF_PANELS * 2), panel_current = 0, panel_requested = 0;

void UpdateFrame() {
  //Serial.println("Updating Frame...");
  
for (uint16_t n = 0; n < 384; n++) { //Keep D1 and D2 pins high, so that R,G,B bits are all set.
  
    REG_WRITE(GPIO_OUT_W1TC_REG, BUS_LAT + BUS_D0);

    for (int num_clocks = 0 ; num_clocks < panel_total ; num_clocks++) { //The number of panels that are set to do something...
      
     if (foo > low && foo < high && ( (num_clocks / 2) == panel_requested ) ) { //Decide if we want the pixel on or off based on low/high (which is decided by the 16 per row of color.) 
        REG_WRITE(GPIO_OUT_W1TS_REG, BUS_D0);
      } else {
        REG_WRITE(GPIO_OUT_W1TC_REG, BUS_D0 );
      }   
    
      REG_WRITE(GPIO_OUT_W1TS_REG, BUS_CLK );
      REG_WRITE(GPIO_OUT_W1TC_REG, BUS_CLK );
  }
  
    REG_WRITE(GPIO_OUT_W1TS_REG, BUS_LAT );
   
    if (++foo > 47) foo = 0;
    REG_WRITE(GPIO_OUT_W1TC_REG, PAN_CLK);
    REG_WRITE(GPIO_OUT_W1TS_REG, PAN_CLK);
  }
 
  if (bank & 0x01) { //This sets which line we are updating.
   REG_WRITE(GPIO_OUT_W1TS_REG, PAN_A0);  // + 1
  } else {
   REG_WRITE(GPIO_OUT_W1TC_REG, PAN_A0);
  }
  if (bank & 0x02) {
    REG_WRITE(GPIO_OUT_W1TS_REG, PAN_A1); // + 2
  } else {
    REG_WRITE(GPIO_OUT_W1TC_REG, PAN_A1);
  }

  REG_WRITE(GPIO_OUT_W1TS_REG, PAN_LAT);
  REG_WRITE(GPIO_OUT_W1TC_REG, PAN_LAT); 
  
  if (++bank > 3) { bank = 0; }
  
}

#define DELAY_TIME 150
void loop() {
 digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
 low = -1, high = 16; //Blue
  delay(DELAY_TIME);
  low = 15, high = 32; //Green
  delay(DELAY_TIME);
  low = 31, high = 48; //Red
  delay(DELAY_TIME); 
  low = -1, high = 48; //White
  delay(DELAY_TIME);
 /* low = -1, high = -1; //Black
  delay(5000); */
  for (int i = 0; i < 184 ; i++) {
    low = (i/ 3) , high = (i/2); //Moving pattern  
    delay(10);  
  } 

  if(panel_requested++ == (NUM_OF_PANELS - 1)) {panel_requested = 0; } //Cycle though each panel individually, in order.
  
}
