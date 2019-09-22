
//********************************************
// SYSTICK used as a microsecond timer and microsecond delay
//********************************************

void SysTick_Handler() { while(1); }

// cannot be used in an interrupt if the main code is in delayMicros
void resetMicroTimer()
{
	SysTick->CTRL = 0x00; // stop systick timer
	SysTick->LOAD = 0x00FFFFFF; 
	SysTick->VAL = 0;
	SysTick->CTRL = 0x01; // start systick timer, no interrupt
}

void pauseSysTime()
{
	SysTick->CTRL = 0x00;
}

void resumeSysTime()
{
	SysTick->CTRL = 0x01;
}

void SetupSysTimer()
{
	resetMicroTimer();
}

unsigned int getMicroTimer()
{
	unsigned int ticks = 0xFFFFFF - SysTick->VAL; 
	unsigned int micros = ticks >> sysTimeScale; // sysTimeScale of 0=8MHz, 1=16MHz, 2=32MHz
	return micros;
}

// max micros=8,388,608 at 16MHz
// min micros=2
void delayMicros( unsigned int micros )
{
	unsigned int sysTime = SysTick->VAL;
	unsigned int ticks = (micros << sysTimeScale) - 2; // takes about 2 ticks to do the function
	unsigned int stopTime = sysTime - ticks;
	if ( stopTime > 0xFFFFFF ) // overflowed
	{
		// wait for overflow first
		stopTime = stopTime & 0xFFFFFF;
		while( SysTick->VAL <= sysTime );
		while( SysTick->VAL > stopTime );
	}
	else
	{
		while( SysTick->VAL > stopTime && SysTick->VAL <= sysTime );		
	}
}

void delay( int millis )
{
	millis *= 1000;
	while( millis > 0 )
	{
		int micros = millis;
		if ( micros > 2000000 ) micros -= 2000000;
		delayMicros( (unsigned int)micros );
		millis -= 2000000;
	}
}

void SetupLPTIM()
{
#ifdef USE_LSE
	RCC->CCIPR |= RCC_CCIPR_LPTIM1SEL_0 | RCC_CCIPR_LPTIM1SEL_1; // set clock to LSE
#else
	RCC->CCIPR |= RCC_CCIPR_LPTIM1SEL_0; // set clock to LSI
#endif
	RCC->APB1ENR |= RCC_APB1ENR_LPTIM1EN; // turn on LPTIM1 clock
}

void StopUntilInterrupt( int stopVref )
{
	// wait for UART to finish
	if ( USART2->CR1 & USART_CR1_TE )
	{
		while( (USART2->ISR & USART_ISR_TC) == 0 );
	}
	
	// PWR->CR = PWR_CR_ULP doesn't seem to turn off the internal VREF, so turn it off manually
	if ( stopVref ) ADC->CCR &= ~ADC_CCR_VREFEN;
	SCB->SCR = SCB_SCR_SLEEPDEEP;
	ASM_WFI; // wait for interrupt
	RTC->ISR &= ~RTC_ISR_RSF; // clear clock sync flag
	if ( stopVref ) ADC->CCR |= ADC_CCR_VREFEN;
}

