
unsigned char sysTimeScale; // 0=8MHz, 1=16MHz, 2=32MHz
void SystemInitHSI16()
{
	// enable PWR clock and DMA clock
	RCC->APB1ENR |= RCC_APB1ENR_PWREN;
	RCC->AHBENR |= RCC_AHBENR_DMAEN;
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
	
	// set voltage range 1 (high power), VINTREF disabled during sleep, and not waited for during wakeup
	PWR->CR = /*PWR_CR_LPDS |*/ PWR_CR_LPSDSR | PWR_CR_VOS_0 /*| PWR_CR_FWU | PWR_CR_ULP*/; // PWR_CR_ULP doesn't seem to turn off the VREF
		
	// turn on HSI
	RCC->CR |= RCC_CR_HSION;
	while( (RCC->CR & RCC_CR_HSIRDY) == 0 );
	RCC->CFGR |= RCC_CFGR_SW_HSI | RCC_CFGR_STOPWUCK; // switch system clock to HSI, use HSI when waking up from stop
	while( (RCC->CFGR & RCC_CFGR_SWS_Msk) != RCC_CFGR_SWS_HSI );
	RCC->ICSCR = (RCC->ICSCR & ~RCC_ICSCR_HSITRIM_Msk) | 0x0000F00; // set HSI calibration value
	
	sysTimeScale = 1; // 16MHz
	
	for( int i = 0; i < 32; i++ ) NVIC_SetPriority( i, 3 ); // set all interrupts to lowest priority
}

void SystemInitHSI32()
{
	SystemInitHSI16();
	
	// add wait state with prefetch for moving to 32MHz
	FLASH->ACR |= FLASH_ACR_LATENCY | FLASH_ACR_PRFTEN;// | FLASH_ACR_PRE_READ; // preread doesn't seem to offer any speed increase
	
	// turn on PLL and switch clock
	RCC->CFGR |= RCC_CFGR_PLLDIV_0 | RCC_CFGR_PLLMUL_0; // set PLL to div 2 mul 4
	RCC->CR |= RCC_CR_PLLON;
	while( (RCC->CR & RCC_CR_PLLRDY) == 0 );
	RCC->CFGR |= RCC_CFGR_SW_PLL; // switch system clock to PLL
	while( (RCC->CFGR & RCC_CFGR_SWS_Msk) != RCC_CFGR_SWS_PLL );
	
	sysTimeScale = 2; // 32MHz
}

void SetupGPIO()
{
	// turn on GPIO clocks
	RCC->IOPENR |= RCC_IOPENR_GPIOAEN | RCC_IOPENR_GPIOBEN | RCC_IOPENR_GPIOCEN | RCC_IOPENR_GPIOHEN;
	GPIO_MODE_ANALOG( GPIOA, 4 ); // A4 does not default to analog like the others
}

void OutputSystemClock()
{
	// output clock to pin A9
	//RCC->CFGR |= RCC_CFGR_MCOSEL_SYSCLK | RCC_CFGR_MCOPRE_DIV2;
	//RCC->CFGR |= RCC_CFGR_MCOSEL_LSE;
	//RCC->CFGR |= RCC_CFGR_MCOSEL_HSI | RCC_CFGR_MCOPRE_DIV2;
	RCC->CFGR |= RCC_CFGR_MCOSEL_LSI;
	
	// set pin A9 to alternate function 0 - clock output
	GPIO_ALT_FUNC( GPIOA, 9, 0 );
	GPIO_MODE_ALT( GPIOA, 9 );
	GPIO_SPEED_VERY_FAST( GPIOA, 9 );
}

void DisableDebug()
{
	// turn off debug pins
	GPIO_MODE_ANALOG( GPIOA, 13 );
	GPIO_MODE_ANALOG( GPIOA, 14 );
	GPIO_PULL_NONE( GPIOA, 13 );
	GPIO_PULL_NONE( GPIOA, 14 );
}

void EnableDebug()
{
	// turn on debug pins
	GPIO_MODE_ALT( GPIOA, 13 );
	GPIO_MODE_ALT( GPIOA, 14 );
	GPIO_PULL_UP( GPIOA, 13 );
	GPIO_PULL_DOWN( GPIOA, 14 );
}

// requires power loss to disable
void EnableDebugInSleep()
{
	//RCC->APB2ENR |= RCC_APB2ENR_DBGEN;
	//DBGMCU->CR = DBGMCU_CR_DBG_STOP | DBGMCU_CR_DBG_SLEEP; // enable debug in stop and sleep mode
}
