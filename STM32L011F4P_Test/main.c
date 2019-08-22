// Tested with the STM32CubeIDE

#include "stm32l011xx.h"

#define LSIFREQ 37820

#include "System.c"
#include "Time.c"
#include "RTC.c"

void output_framebuffer_asm( unsigned char *ptr )
{
  unsigned char* dummy;
  __asm volatile(
	".syntax unified\n"

	// GPIOA address
	"MOVS r1, #5\n"
	"LSLS r1, #28\n"

	// retrieve GPIOA current output
    "LDR r2, [r1, #0x14]\n"

	// CLK pin toggle mask
    "MOVS r3, #0x10\n"

	// D1 + D2 mask
    "MOVS r4, #0x60\n"

	// ptr end value
    "MOVS r6, %0\n"
    "ADDS r6, #255\n"
    "ADDS r6, #129\n"

	// overlapping to get good timings, roughly 4.5MHz data rate
	"1: LDRB r5, [%0]\n"	// byte 0
	"BICS r2, r2, r4\n"		// byte 0
	"ORRS r2, r2, r5\n"		// byte 0
	"STR r2, [r1, #0x14]\n" // byte 0 output D1 + D2

	"LDRB r5, [%0, #1]\n"   // byte 1
	"STR r3, [r1, #0x18]\n" // byte 0 CLK high
	"BICS r2, r2, r4\n"     // byte 1
	"STR r3, [r1, #0x28]\n" // byte 0 CLK low
	"ORRS r2, r2, r5\n"     // byte 1
	"STR r2, [r1, #0x14]\n" // byte 1 output D1 + D2

	// byte 3
	"LDRB r5, [%0, #2]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 4
	"LDRB r5, [%0, #3]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 5
	"LDRB r5, [%0, #4]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 6
	"LDRB r5, [%0, #5]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 7
	"LDRB r5, [%0, #6]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 8
	"LDRB r5, [%0, #7]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 9
	"LDRB r5, [%0, #8]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 10
	"LDRB r5, [%0, #9]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 11
	"LDRB r5, [%0, #10]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 12
	"LDRB r5, [%0, #11]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 13
	"LDRB r5, [%0, #12]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 14
	"LDRB r5, [%0, #13]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 15
	"LDRB r5, [%0, #14]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	// byte 16
	"LDRB r5, [%0, #15]\n"
	"STR r3, [r1, #0x18]\n"
	"BICS r2, r2, r4\n"
	"STR r3, [r1, #0x28]\n"
	"ORRS r2, r2, r5\n"
	"STR r2, [r1, #0x14]\n"

	"STR r3, [r1, #0x18]\n" // byte 16 CLK high
	"ADDS %0, #16\n"
	"STR r3, [r1, #0x28]\n" // byte 16 CLK low

	"CMP %0, r6\n"
	"BLT 1b\n"

	: "=r" (dummy)
	: "0" (ptr)
	: "r1", "r2", "r3", "r4", "r5", "r6", "cc", "memory"
  );
}

#define A0_PORT 	GPIOA
#define A0_PIN 		0
#define A1_PORT 	GPIOA
#define A1_PIN 		1
#define LE_PORT 	GPIOA
#define LE_PIN 		9
#define OE_PORT 	GPIOA
#define OE_PIN 		10
#define D1_PORT 	GPIOA
#define D1_PIN 		5
#define D2_PORT 	GPIOA
#define D2_PIN 		6
#define CLK_PORT	GPIOA
#define CLK_PIN 	4

unsigned char framebuffer[ 1536 ];
char currRow;

void RTC_IRQHandler()
{
	RTC->ISR = 0; // clear interrupt flag
	EXTI->PR = EXTI_PR_PIF20; // clear wake up interrupt

	// move to the next row
	currRow++;

	if ( currRow > 3 ) currRow = 0;
	unsigned char *ptr = framebuffer + (384*currRow);

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

	// clock out the data using assembly
	output_framebuffer_asm( ptr );

	// disable output
	GPIO_SET( OE_PORT, OE_PIN );
	GPIO_MODE_OUTPUT( OE_PORT, OE_PIN );

	ASM_NOP;
	ASM_NOP;
	ASM_NOP;

	// set the address
	if ( currRow & 0x01 ) GPIO_SET( A0_PORT, A0_PIN );
	else GPIO_CLEAR( A0_PORT, A0_PIN );
	if ( currRow & 0x02 ) GPIO_SET( A1_PORT, A1_PIN );
	else GPIO_CLEAR( A1_PORT, A1_PIN );

	// toggle latch
	GPIO_SET( LE_PORT, LE_PIN );
	ASM_NOP;
	GPIO_CLEAR( LE_PORT, LE_PIN );

	ASM_NOP;
	ASM_NOP;
	ASM_NOP;

	// enable output
	GPIO_MODE_ALT( OE_PORT, OE_PIN ); // PWM
	//GPIO_CLEAR( OE_PORT, OE_PIN ); // always on, full brightness
}

void SetPixel( unsigned int x, unsigned int y, unsigned int col )
{
	unsigned int bankMask;
	if ( y >> 3 ) bankMask = 0x40; // bit 6 for GPIOA 6, bottom half of panel
	else bankMask = 0x20; // bit 5 for GPIOA 5, top half of panel

	unsigned int row = y & 0x03;
	unsigned char *ptr = framebuffer + ((row*128)*3); // pointer to row 0, 1, 2, or 3

	// offset to the blue pixel
	ptr += (x & 0xf8) * 6; // equivalent to: ptr += (x / 8) * 48
	ptr += (x & 7);
	ptr += (y & 4) * 2; // equivalent to: if ( y in the range 4->7 or 12->15 ) ptr += 8; else do nothing

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
	unsigned int bankMask;
	if ( y >> 3 ) bankMask = 0x40; // bit 6 for GPIOA 6, bottom half of panel
	else bankMask = 0x20; // bit 5 for GPIOA 5, top half of panel

	unsigned int row = y & 0x03;
	unsigned char *ptr = framebuffer + ((row*128)*3); // pointer to row 0, 1, 2, or 3

	ptr += (x & 0xf8) * 6;
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

	// set PWM channel 1 to A10
	GPIO_ALT_FUNC( GPIOA, 10, 0 );
	GPIO_MODE_ALT( GPIOA, 10 );
	GPIO_SPEED_VERY_FAST( GPIOA, 10 );

	// frequency = 32MHz / AAR
	TIM21->ARR = 1024; // overflow value
	TIM21->CCR1 = 128; // compare match value
	TIM21->CCMR1 = TIM_CCMR1_OC1M_0 | TIM_CCMR1_OC1M_1 | TIM_CCMR1_OC1M_2 | TIM_CCMR1_OC1PE; // Channel 1 PWM mode 1, buffer the compare register
	TIM21->CCER = TIM_CCER_CC1E; // enable compare match
	TIM21->CR1 = TIM_CR1_CEN; // enable timer
}

void InitVariables()
{
	currRow = 0;
	for( int i = 0; i < 1536; i++ ) framebuffer[ i ] = 0;
}

void mymain()
{
	SystemInitHSI32(); // 32MHz using internal 16MHz RC clock + PLL
	SetupSysTimer();

	SetupGPIO(); // must be done before other peripherals
	SetupRTC();

	GPIO_MODE_OUTPUT( A0_PORT, A0_PIN );
	GPIO_MODE_OUTPUT( A1_PORT, A1_PIN );
	GPIO_MODE_OUTPUT( LE_PORT, LE_PIN );
	GPIO_MODE_OUTPUT( OE_PORT, OE_PIN );
	GPIO_MODE_OUTPUT( D1_PORT, D1_PIN );
	GPIO_MODE_OUTPUT( D1_PORT, D2_PIN );
	GPIO_MODE_OUTPUT( CLK_PORT, CLK_PIN );

	GPIO_SET( OE_PORT, OE_PIN ); // turn off

	GPIO_SPEED_VERY_FAST( A0_PORT, A0_PIN );
	GPIO_SPEED_VERY_FAST( A1_PORT, A1_PIN );
	GPIO_SPEED_VERY_FAST( LE_PORT, LE_PIN );
	GPIO_SPEED_VERY_FAST( OE_PORT, OE_PIN );
	GPIO_SPEED_VERY_FAST( D1_PORT, D1_PIN );
	GPIO_SPEED_VERY_FAST( D1_PORT, D2_PIN );
	GPIO_SPEED_VERY_FAST( CLK_PORT, CLK_PIN );

	InitVariables();

	delay(200); // allow external devices to start up

	// will trigger RTC_IRQHandler() 400 times per second
	RTCEnableAutoWakeUpHz( 400 );

	if ( 0 )
	{
		// set all white
		for( unsigned int x = 0; x < 64; x++ )
		{
			for( unsigned int y = 0; y < 16; y++ )
			{
				SetPixel( x, y, 7 );
			}
		}
	}

	// PWM the OE pin
	SetupTIM21PWM();

	unsigned int color = 1;
	int value = 0;
	int dir = 1;

	while(1)
	{

		if ( 0 )
		{
			// brightness sweep
			value = value + dir;
			if ( value > 1023 ) dir = -1;
			if ( value < 1 ) dir = 1;

			TIM21->CCR1 = (value*value) >> 10;
			delayMicros( 2000 );
		}


		if ( 1 )
		{
			// color sweep
			for( unsigned int x = 0; x < 64; x++ )
			{
				for( unsigned int y = 0; y < 16; y++ )
				{
					SetPixel( x, y, color );
					delayMicros( 2000 );
				}
			}

			color++;
			if ( color > 7 ) color = 0;
		}


		if ( 0 )
		{
			// Slow update
			for( unsigned int i = 0; i < 1536; i++ )
			{
				framebuffer[ i ] = 0x20;
				delay( 125 );
			}
		}
	}
}
