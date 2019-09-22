#include "stm32l011xx.h"

#define LSIFREQ 36000

#include "System.c"
#include "Time.c"
#include "RTC.c"
#include "EEPROM.c"
#include "ADC.c"

#include "Random.c"

void output_framebuffer_asm( volatile unsigned short *ptr )
{
  unsigned short* dummy;
  __asm volatile(
	".syntax unified\n"

	// GPIOB + GPIOC address
	"MOVS r1, #5\n"
	"LSLS r1, #18\n"
	"MOVS r2, r1\n"

	// GPIOB
	"ADDS r1, #1\n"
	"LSLS r1, #10\n"

	// GPIOC
	"ADDS r2, #2\n"
	"LSLS r2, #10\n"

	// CLK pin toggle mask
    "MOVS r3, #0x01\n"

	// ptr end value = ptr + 768
    "MOVS r6, %0\n"
	"MOVS r5, #3\n"
	"LSLS r5, #8\n"
    "ADDS r6, r5\n"

	// overlapping to get good timings, roughly 6.4MHz data rate
	"1: LDRH r5, [%0]\n"	// byte 1
	"STR r5, [r1, #0x14]\n" // byte 1 output D1 + D2
	"STR r3, [r2, #0x18]\n" // byte 1 CLK high

	// byte 2
	"LDRH r5, [%0, #2]\n"   // byte 2
	"STR r3, [r2, #0x28]\n" // byte 1 CLK low
	"STR r5, [r1, #0x14]\n" // byte 2 output D1 + D2
	"STR r3, [r2, #0x18]\n" // byte 2 CLK high

	// byte 3
	"LDRH r5, [%0, #4]\n"
	"STR r3, [r2, #0x28]\n" // byte 2 CLK low
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 4
	"LDRH r5, [%0, #6]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 5
	"LDRH r5, [%0, #8]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 6
	"LDRH r5, [%0, #10]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 7
	"LDRH r5, [%0, #12]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 8
	"LDRH r5, [%0, #14]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 9
	"LDRH r5, [%0, #16]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 10
	"LDRH r5, [%0, #18]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 11
	"LDRH r5, [%0, #20]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 12
	"LDRH r5, [%0, #22]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 13
	"LDRH r5, [%0, #24]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 14
	"LDRH r5, [%0, #26]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 15
	"LDRH r5, [%0, #28]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	// byte 16
	"LDRH r5, [%0, #30]\n"
	"STR r3, [r2, #0x28]\n"
	"STR r5, [r1, #0x14]\n"
	"STR r3, [r2, #0x18]\n"

	"ADDS %0, #32\n"
	"STR r3, [r2, #0x28]\n" // byte 16 CLK low

	"CMP %0, r6\n"
	"BLT 1b\n"

	: "=r" (dummy)
	: "0" (ptr)
	: "r1", "r2", "r3", "r4", "r5", "r6", "cc", "memory"
  );
}

#define ADDR0_PORT 	GPIOH
#define ADDR0_PIN	0
#define ADDR1_PORT 	GPIOH
#define ADDR1_PIN	1
#define LE_PORT 	GPIOC
#define LE_PIN 		13
#define OE_PORT 	GPIOA
#define OE_PIN 		11
#define CLK_PORT	GPIOC
#define CLK_PIN 	0

#define PWR_PORT	GPIOA
#define PWR_PIN 	1
#define SW_PORT		GPIOA
#define SW_PIN 		12

#define PLAYER1_LEFT_PORT	GPIOA
#define PLAYER1_LEFT_PIN	7
#define PLAYER1_RIGHT_PORT	GPIOA
#define PLAYER1_RIGHT_PIN	6

#define PLAYER2_LEFT_PORT	GPIOA
#define PLAYER2_LEFT_PIN	5
#define PLAYER2_RIGHT_PORT	GPIOA
#define PLAYER2_RIGHT_PIN	3

#define PLAYER3_LEFT_PORT	GPIOA
#define PLAYER3_LEFT_PIN	2
#define PLAYER3_RIGHT_PORT	GPIOC
#define PLAYER3_RIGHT_PIN	15

#define PLAYER4_LEFT_PORT	GPIOC
#define PLAYER4_LEFT_PIN	14
#define PLAYER4_RIGHT_PORT	GPIOA
#define PLAYER4_RIGHT_PIN	9

volatile unsigned short framebuffer[ 1536 ];
unsigned short outputBit[ 16 ];
char currRow;

#define MAX_LENGTH 64
#define NUM_PLAYERS 4

struct Player
{
	char prevX[ MAX_LENGTH ]; // can be negative
	char prevY[ MAX_LENGTH ]; // can be negative
	unsigned char length;
	unsigned char currIndex;
	char x; // can be negative
	char y; // can be negative
	char dir; // can be negative
	unsigned char color;

	// controls
	unsigned char prevPressed;
	unsigned int leftWait;
	unsigned int rightWait;
	GPIO_TypeDef* leftPort;
	GPIO_TypeDef* rightPort;
	unsigned char leftPin;
	unsigned char rightPin;
	unsigned char cmdQueue[2];
	unsigned char commands;
};

struct Player players[ NUM_PLAYERS ];

void ClearGameVariables();

void ClearScreen()
{
	for( int i = 0; i < 1536; i++ ) framebuffer[ i ] = 0;
}

// Panel to GPIOB mapping
// J1 D1 = B10
// J1 D2 = B1
// J2 D1 = B0
// J2 D2 = B2
// J3 D1 = B14
// J3 D2 = B12
// J4 D1 = B11
// J4 D2 = B13
   
// J5 D1 = B9
// J5 D2 = B7
// J6 D1 = B6
// J6 D2 = B8
// J7 D1 = B5
// J7 D2 = B3
// J8 D1 = B15
// J8 D2 = B4

void InitVariables()
{
	currRow = 0;

	// only using J5 to J8 for y=0 to 63 at the moment
	outputBit[ 0 ] = 0x0200;
	outputBit[ 1 ] = 0x0080;
	outputBit[ 2 ] = 0x0040;
	outputBit[ 3 ] = 0x0100;
	outputBit[ 4 ] = 0x0020;
	outputBit[ 5 ] = 0x0008;
	outputBit[ 6 ] = 0x8000;
	outputBit[ 7 ] = 0x0010;
	outputBit[ 8 ] = 0x0000;
	outputBit[ 9 ] = 0x0000;
	outputBit[ 10 ] = 0x0000;
	outputBit[ 11 ] = 0x0000;
	outputBit[ 12 ] = 0x0000;
	outputBit[ 13 ] = 0x0000;
	outputBit[ 14 ] = 0x0000;
	outputBit[ 15 ] = 0x0000;

	ClearGameVariables();
}

volatile unsigned char powerOn;

// power button interrupt
void EXTI4_15_IRQHandler()
{
	if ( EXTI->PR & EXTI_PR_PIF12 )
	{
		powerOn = 1 - powerOn;

		if ( powerOn )
		{
			// will trigger RTC_IRQHandler() 800 times per second
			RTCEnableAutoWakeUpHz( 800 );
			GPIO_MODE_ALT( OE_PORT, OE_PIN ); // PWM the output pin
			GPIO_MODE_OUTPUT( PWR_PORT, PWR_PIN ); // turn on power supply
		}
		else
		{
			RTCDisableWakeup();
			GPIO_SET( OE_PORT, OE_PIN );
			GPIO_MODE_OUTPUT( OE_PORT, OE_PIN ); // turn off output by setting it high
			delay(50);
			GPIO_MODE_ANALOG( PWR_PORT, PWR_PIN ); // turn off power supply
		}
	}

	EXTI->PR = 0xFFF0; // clear interrupt flags 4 to 15
}

void RTC_IRQHandler()
{
	RTC->ISR = 0; // clear interrupt flag
	EXTI->PR = EXTI_PR_PIF20; // clear wake up interrupt

	// move to the next row
	currRow++;

	if ( currRow > 3 ) currRow = 0;
	volatile unsigned short *ptr = framebuffer + (384*currRow);

	// disable output before clocking out data
	// must be disabled for at least 25us before changing latch and address
	// otherwise we get some bleeding of current data onto the prev row
	GPIO_SET( OE_PORT, OE_PIN );
	GPIO_MODE_OUTPUT( OE_PORT, OE_PIN );

	/*
	// clock out the data using C
	unsigned int currState = GPIOA->ODR & ~0x60;
	for( int i = 0; i < 384; i++ )
	{
		GPIOA->ODR = currState | ptr[i];
		GPIO_SET( CLK_PORT, CLK_PIN );
		GPIO_CLEAR( CLK_PORT, CLK_PIN );
	}
	*/

	// clock out the data using assembly, takes at least 85us at 32MHz CPU
	output_framebuffer_asm( ptr );

	// set the address, can take a shortcut if ADDR0 and ADDR1 are mapped to GPIOH0 and GPIOH1
	GPIOH->ODR = currRow;
	/*
	if ( currRow & 0x01 ) GPIO_SET( ADDR0_PORT, ADDR0_PIN );
	else GPIO_CLEAR( ADDR0_PORT, ADDR0_PIN );
	if ( currRow & 0x02 ) GPIO_SET( ADDR1_PORT, ADDR1_PIN );
	else GPIO_CLEAR( ADDR1_PORT, ADDR1_PIN );
	*/

	// toggle latch
	GPIO_SET( LE_PORT, LE_PIN );
	ASM_NOP;
	GPIO_CLEAR( LE_PORT, LE_PIN );

	ASM_NOP; ASM_NOP; ASM_NOP;

	// enable output
	if ( powerOn ) GPIO_MODE_ALT( OE_PORT, OE_PIN ); // PWM
	//GPIO_CLEAR( OE_PORT, OE_PIN ); // always on, full brightness
}

void SetPixel( unsigned int x, unsigned int y, unsigned int col )
{
	unsigned int bankMask = outputBit[ y >> 3 ];

	unsigned int row = y & 0x03;
	volatile unsigned short *ptr = framebuffer + (row*384); // pointer to row 0, 1, 2, or 3

	// offset to the blue pixel
	ptr += (x & 0x38) * 6; // equivalent to: ptr += ((x % 64) / 8) * 48
	ptr += (x & 7);
	ptr += (y & 4) * 2; // equivalent to: if ( y in the range 4->7 or 12->15, etc ) ptr += 8; else do nothing

	// blue
	if ( col & 0x01 ) *ptr |= bankMask;
	else *ptr &= ~bankMask;

	// green
	ptr += 16;
	if ( col & 0x02 ) *ptr |= bankMask;
	else *ptr &= ~bankMask;

	// red
	ptr += 16;
	if ( col & 0x04 ) *ptr |= bankMask;
	else *ptr &= ~bankMask;
}

unsigned int GetPixel( unsigned int x, unsigned int y )
{
	unsigned int bankMask = outputBit[ y >> 3 ];

	unsigned int row = y & 0x03;
	volatile unsigned short *ptr = framebuffer + ((row*128)*3); // pointer to row 0, 1, 2, or 3

	ptr += (x & 0x38) * 6;
	ptr += (x & 7);
	ptr += (y & 4) * 2;

	unsigned int result = 0;

	// blue
	if ( *ptr & bankMask ) result |= 0x01;

	// green
	ptr += 16;
	if ( *ptr & bankMask ) result |= 0x02;

	// red
	ptr += 16;
	if ( *ptr & bankMask ) result |= 0x04;

	return result;
}

void SetupTIM21PWM()
{
	RCC->APB2ENR |= RCC_APB2ENR_TIM21EN;

	// set PWM channel 2 to A11
	GPIO_ALT_FUNC( GPIOA, 11, 5 );
	GPIO_MODE_ALT( GPIOA, 11 );
	GPIO_SPEED_VERY_FAST( GPIOA, 11 );

	// frequency = 32MHz / ARR
	TIM21->ARR = 1024; // overflow value
	TIM21->CCR2 = 256; // compare match value
	TIM21->CCMR1 = TIM_CCMR1_OC2M_0 | TIM_CCMR1_OC2M_1 | TIM_CCMR1_OC2M_2 | TIM_CCMR1_OC2PE; // Channel 2 PWM mode 2, buffer the compare register
	TIM21->CCER = TIM_CCER_CC2E; // enable compare match on channel 2
	TIM21->CR1 = TIM_CR1_CEN; // enable timer
}

void CreateApple()
{
	unsigned int x, y;
	do
	{
		x = random2(63);
		y = random2(63);
	} while( GetPixel(x,y) != 0 );

	SetPixel( x, y, 7 );
}

void ClearGameVariables()
{
	for ( int i = 0; i < NUM_PLAYERS; i++)
	{
		for( int j = 0; j < MAX_LENGTH; j++ )
		{
			players[i].prevX[ j ] = -1;
			players[i].prevY[ i ] = -1;
		}
		players[i].length = 3;
		players[i].currIndex = 0;
		players[i].dir = 0;
		players[i].prevPressed = 0;
		players[i].leftWait = 0;
		players[i].rightWait = 0;
		players[i].commands = 0;
		players[i].cmdQueue[0] = 0;
		players[i].cmdQueue[1] = 0;
	}

	players[0].x = 10;
	players[0].y = 10;
	players[0].color = 1;
	players[0].leftPort  = PLAYER1_LEFT_PORT;
	players[0].leftPin   = PLAYER1_LEFT_PIN;
	players[0].rightPort = PLAYER1_RIGHT_PORT;
	players[0].rightPin  = PLAYER1_RIGHT_PIN;

	players[1].x = 50;
	players[1].y = 9;
	players[1].color = 2;
	players[1].leftPort  = PLAYER2_LEFT_PORT;
	players[1].leftPin   = PLAYER2_LEFT_PIN;
	players[1].rightPort = PLAYER2_RIGHT_PORT;
	players[1].rightPin  = PLAYER2_RIGHT_PIN;

	players[2].x = 49;
	players[2].y = 49;
	players[2].color = 4;
	players[2].leftPort  = PLAYER3_LEFT_PORT;
	players[2].leftPin   = PLAYER3_LEFT_PIN;
	players[2].rightPort = PLAYER3_RIGHT_PORT;
	players[2].rightPin  = PLAYER3_RIGHT_PIN;

	players[3].x = 11;
	players[3].y = 51;
	players[3].color = 6;
	players[3].leftPort  = PLAYER4_LEFT_PORT;
	players[3].leftPin   = PLAYER4_LEFT_PIN;
	players[3].rightPort = PLAYER4_RIGHT_PORT;
	players[3].rightPin  = PLAYER4_RIGHT_PIN;

	ClearScreen();
}

void ResetGame()
{
	ClearGameVariables();

	CreateApple();
	CreateApple();
	CreateApple();
	CreateApple();
	CreateApple();
	CreateApple();
	CreateApple();
}

void ResetPlayer( int i )
{
	for( int j = 0; j < MAX_LENGTH; j++ )
	{
		if ( players[i].prevX[ j ] >= 0 )
		{
			SetPixel( players[i].prevX[ j ], players[i].prevY[ j ], 0 );
			players[i].prevX[ j ] = -1;
			players[i].prevY[ j ] = -1;
		}
	}
	players[i].length = 3;
	players[i].currIndex = 0;
	players[i].dir = 0;

	unsigned int x, y;
	do
	{
		x = random2(63);
		y = random2(63);
	} while( GetPixel(x,y) != 0 );

	players[i].x = x;
	players[i].y = y;
}

#define MODE_WHITE 0
#define MODE_SNAKE 1
#define MODE_COLOR_SWEEP 2
#define MODE_SLOW_UPDATE 3

unsigned char mode;

void mymain()
{
	SystemInitHSI32(); // 32MHz using internal 16MHz RC clock + PLL
	SetupSysTimer();

	SetupGPIO(); // must be done before other peripherals
	SetupRTC();
	SetupADC();
	ADCEnable();

	delay(200); // wait in case we are about to be reprogrammed, otherwise display will flash after reset

	GPIO_MODE_INPUT( PLAYER1_LEFT_PORT, PLAYER1_LEFT_PIN );
	GPIO_MODE_INPUT( PLAYER1_RIGHT_PORT, PLAYER1_RIGHT_PIN );
	GPIO_MODE_INPUT( PLAYER2_LEFT_PORT, PLAYER2_LEFT_PIN );
	GPIO_MODE_INPUT( PLAYER2_RIGHT_PORT, PLAYER2_RIGHT_PIN );
	GPIO_MODE_INPUT( PLAYER3_LEFT_PORT, PLAYER3_LEFT_PIN );
	GPIO_MODE_INPUT( PLAYER3_RIGHT_PORT, PLAYER3_RIGHT_PIN );
	GPIO_MODE_INPUT( PLAYER4_LEFT_PORT, PLAYER4_LEFT_PIN );
	GPIO_MODE_INPUT( PLAYER4_RIGHT_PORT, PLAYER4_RIGHT_PIN );

	GPIO_PULL_UP( PLAYER1_LEFT_PORT, PLAYER1_LEFT_PIN );
	GPIO_PULL_UP( PLAYER1_RIGHT_PORT, PLAYER1_RIGHT_PIN );
	GPIO_PULL_UP( PLAYER2_LEFT_PORT, PLAYER2_LEFT_PIN );
	GPIO_PULL_UP( PLAYER2_RIGHT_PORT, PLAYER2_RIGHT_PIN );
	GPIO_PULL_UP( PLAYER3_LEFT_PORT, PLAYER3_LEFT_PIN );
	GPIO_PULL_UP( PLAYER3_RIGHT_PORT, PLAYER3_RIGHT_PIN );
	GPIO_PULL_UP( PLAYER4_LEFT_PORT, PLAYER4_LEFT_PIN );
	GPIO_PULL_UP( PLAYER4_RIGHT_PORT, PLAYER4_RIGHT_PIN );

	GPIO_SET( OE_PORT, OE_PIN ); // turn off

	GPIO_MODE_OUTPUT( ADDR0_PORT, ADDR0_PIN );
	GPIO_MODE_OUTPUT( ADDR1_PORT, ADDR1_PIN );
	GPIO_MODE_OUTPUT( LE_PORT, LE_PIN );
	GPIO_MODE_OUTPUT( OE_PORT, OE_PIN );
	GPIO_MODE_OUTPUT( CLK_PORT, CLK_PIN );

	GPIO_SPEED_VERY_FAST( ADDR0_PORT, ADDR0_PIN );
	GPIO_SPEED_VERY_FAST( ADDR1_PORT, ADDR1_PIN );
	GPIO_SPEED_VERY_FAST( LE_PORT, LE_PIN );
	GPIO_SPEED_VERY_FAST( OE_PORT, OE_PIN );
	GPIO_SPEED_VERY_FAST( CLK_PORT, CLK_PIN );

	// set entire GPIOB port as output and very fast
	GPIOB->MODER = 0x55555555;
	GPIOB->OSPEEDR = 0xFFFFFFFF;

	unsigned int seed = EEPROMReadInt( 0 );
	seed++;
	EEPROMWriteInt(0, seed);
	random_seed(seed);

	InitVariables();

	NVIC_SetPriority( RTC_IRQn, 1 ); // set RTC interrupt to high priority

	// enable power switch interrupt
	powerOn = 0;
	GPIO_PULL_DOWN( GPIOA, 0 ); // POT
	GPIO_PULL_UP( SW_PORT, SW_PIN ); // PWR switch
	GPIO_MODE_INPUT( SW_PORT, SW_PIN );
	EXTI->IMR |= EXTI_IMR_IM12;
	EXTI->FTSR |= EXTI_FTSR_FT12;
	SYSCFG->EXTICR[3] |= SYSCFG_EXTICR4_EXTI12_PA;
	NVIC_EnableIRQ( EXTI4_15_IRQn );
	NVIC_SetPriority( EXTI4_15_IRQn, 0 ); // set power button interrupt to highest priority

	mode = MODE_SNAKE;

	if ( mode == MODE_WHITE )
	{
		// set all white
		for( unsigned int x = 0; x < 64; x++ )
		{
			for( unsigned int y = 0; y < 64; y++ )
			{
				SetPixel( x, y, 7 );
			}
		}
	}

	if ( mode == MODE_SNAKE )
	{
		ResetGame();
	}

	// PWM the OE pin
	SetupTIM21PWM();
	GPIO_MODE_OUTPUT( OE_PORT, OE_PIN ); // but turn it off for now

	unsigned int color = 1;
	int value = 0;
	int dir = 1;

	unsigned int start = RTCGetSubSeconds();

	while(1)
	{
		if ( powerOn == 0 ) continue;

		if( mode == MODE_SNAKE )
		{
			// brightness control
			unsigned int pot = ADCRead(0, 0);
			if ( pot == 0 ) pot = 1024;
			TIM21->CCR2 = (pot*pot) >> 14;

			for( int i = 0; i < NUM_PLAYERS; i++ )
			{
				unsigned int leftPressed = GPIO_READ( players[i].leftPort, players[i].leftPin ) ? 0 : 1;
				if ( leftPressed != (players[i].prevPressed & 0x01) && RTCElapsedSub( players[i].leftWait, 50 ) )
				{
					players[i].leftWait = RTCGetSubSeconds();

					if ( leftPressed )
					{
						if ( players[i].commands < 2 )
						{
							players[i].cmdQueue[ players[i].commands ] = 0;
							players[i].commands++;
						}
					}
				}

				unsigned int rightPressed = GPIO_READ( players[i].rightPort, players[i].rightPin ) ? 0 : 1;
				if ( rightPressed != ((players[i].prevPressed >> 1) & 0x01) && RTCElapsedSub( players[i].rightWait, 50 ) )
				{
					players[i].rightWait = RTCGetSubSeconds();

					if ( rightPressed )
					{
						if ( players[i].commands < 2 )
						{
							players[i].cmdQueue[ players[i].commands ] = 1;
							players[i].commands++;
						}
					}
				}

				players[i].prevPressed = (rightPressed << 1) | leftPressed;
			}

			if ( RTCElapsedSub( start, 150 ) )
			{
				start = RTCGetSubSeconds();

				for( int i = 0; i < NUM_PLAYERS; i++ )
				{
					if ( players[i].commands > 0 )
					{
						if ( players[i].cmdQueue[ 0 ] == 0 )
						{
							players[i].dir++;
							if ( players[i].dir > 3 ) players[i].dir = 0;
						}
						else
						{
							players[i].dir--;
							if ( players[i].dir < 0 ) players[i].dir = 3;
						}

						players[i].cmdQueue[ 0 ] = players[i].cmdQueue[ 1 ];
						players[i].commands--;
					}

					switch( players[i].dir )
					{
						case 0: players[i].x++; break;
						case 1: players[i].y--; break;
						case 2: players[i].x--; break;
						case 3: players[i].y++; break;
					}

					if ( players[i].x < 0 ) players[i].x = 63;
					if ( players[i].y < 0 ) players[i].y = 63;
					if ( players[i].x > 63 ) players[i].x = 0;
					if ( players[i].y > 63 ) players[i].y = 0;

					unsigned int currColor = GetPixel( players[i].x, players[i].y );
					if ( currColor == 0x07 ) // white
					{
						if ( players[i].length < 62 ) players[i].length++;
						CreateApple();
					}
					else if ( currColor != 0 )
					{
						ResetPlayer( i );
					}

					if ( players[i].prevX[ players[i].currIndex ] >= 0 ) SetPixel( players[i].prevX[ players[i].currIndex ], players[i].prevY[ players[i].currIndex ], 0 );

					players[i].prevX[ players[i].currIndex ] = players[i].x;
					players[i].prevY[ players[i].currIndex ] = players[i].y;

					SetPixel( players[i].x, players[i].y, players[i].color );

					players[i].currIndex++;
					if( players[i].currIndex > players[i].length ) players[i].currIndex = 0;
				}
			}

		}

		if ( mode == MODE_COLOR_SWEEP )
		{
			for( unsigned int x = 0; x < 64; x++ )
			{
				for( unsigned int y = 0; y < 64; y++ )
				{
					SetPixel( x, y, color );
					delayMicros( 500 );
				}
			}

			color++;
			if ( color > 7 ) color = 0;
		}


		if ( mode == MODE_SLOW_UPDATE )
		{
			for( unsigned int i = 0; i < 1536; i++ )
			{
				framebuffer[ i ] = 0x0200;
				delay( 125 );
			}
		}
	}
}
