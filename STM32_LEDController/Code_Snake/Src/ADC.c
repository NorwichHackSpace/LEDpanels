void ADCEnable()
{
	NVIC_Disable_All();
	if ( (ADC1->CR & ADC_CR_ADEN) == 0 )
	{
		ADC1->ISR = ADC_ISR_ADRDY; // clear ready flag
		ADC1->CR |= ADC_CR_ADEN; // enable ADC
		while( (ADC1->ISR & ADC_ISR_ADRDY) == 0 ); // wait for ADC to start up
		ADC->CCR |= ADC_CCR_VREFEN;
	}
	NVIC_Enable_All();
}

void ADCDisable()
{
	NVIC_Disable_All();
	if ( ADC1->CR & ADC_CR_ADEN ) 
	{
		ADC1->CR |= ADC_CR_ADDIS; // disable ADC
		while( ADC1->CR & ADC_CR_ADEN ); // wait for ADC to power down
		ADC1->ISR = ADC_ISR_ADRDY; // clear ready flag
		ADC1->CR = 0; // disable ADC regulator
	}
	NVIC_Enable_All();
}

void SetupADC()
{
	RCC->APB2ENR |= RCC_APB2ENR_ADCEN; // enable ADC clock
	ADC1->CR = ADC_CR_ADCAL; // start calibration
	while( ADC1->CR & ADC_CR_ADCAL ); // wait for calibration to finish
	
	//ADC->CCR = ADC_CCR_LFMEN | ADC_CCR_PRESC_2; // div 8 = 2MHz
	
	ADC1->CFGR2 = 0; // no oversampling
	//ADC1->CFGR2 = ADC_CFGR2_OVSS_1 | ADC_CFGR2_OVSR_0 | ADC_CFGR2_OVSE; // sample 4x per read
	//ADC1->CFGR2 = (0x6 << ADC_CFGR2_OVSS_Pos) | (0x5 << ADC_CFGR2_OVSR_Pos) | ADC_CFGR2_OVSE; // sample 64x per read
	
	ADC1->CFGR1 = ADC_CFGR1_OVRMOD; // new data overwrites old data	
	ADC->CCR |= ADC_CCR_VREFEN; // turn on internal voltage reference
}

void ADCSetFreq( unsigned int kHz )
{
	if ( sysTimeScale == 2 ) kHz >>= 2;
	if ( sysTimeScale == 1 ) kHz >>= 1;
	
	// assume base clock is now 8MHz
	unsigned int flags = ADC->CCR;
	if ( kHz < 3500 ) flags |= ADC_CCR_LFMEN;
	else flags &= ~ADC_CCR_LFMEN;
	ADC->CCR = flags;
	
	flags &= ~ADC_CCR_PRESC_Msk;
	if ( kHz > 6000 ) flags |= 0;
	else if ( kHz > 3000 ) flags |= 1 << ADC_CCR_PRESC_Pos; // div 2
	else if ( kHz > 1667 ) flags |= 2 << ADC_CCR_PRESC_Pos; // div 4
	else if ( kHz > 1167 ) flags |= 3 << ADC_CCR_PRESC_Pos; // div 6
	else if ( kHz > 900 ) flags |= 4 << ADC_CCR_PRESC_Pos; // div 8
	else if ( kHz > 733 ) flags |= 5 << ADC_CCR_PRESC_Pos; // div 10
	else if ( kHz > 583 ) flags |= 6 << ADC_CCR_PRESC_Pos; // div 12
	else if ( kHz > 375 ) flags |= 7 << ADC_CCR_PRESC_Pos; // div 16
	else if ( kHz > 188 ) flags |= 8 << ADC_CCR_PRESC_Pos; // div 32
	else if ( kHz > 94 ) flags |= 9 << ADC_CCR_PRESC_Pos; // div 64
	else if ( kHz > 47 ) flags |= 10 << ADC_CCR_PRESC_Pos; // div 128
	else flags |= 11 << ADC_CCR_PRESC_Pos; // div 256		
	
	ADC->CCR = flags;
}

// samples: 0=1.5 up to 7=160.5
unsigned int ADCRead( int channel, int samples )
{
	if ( channel == 17 )
	{
		// if channel is internal VREF then wait for it to be ready
		while( (PWR->CSR & PWR_CSR_VREFINTRDYF) == 0 );
	}
	
	NVIC_Disable_All();
	ADC1->CFGR1 &= ~ADC_CFGR1_CONT;
	ADC1->SMPR = samples & 0x7;
	ADC1->CHSELR = 1 << channel;
	
	ADC1->CR |= ADC_CR_ADSTART;// start the conversion
	while( ADC1->CR & ADC_CR_ADSTART ); // wait for conversion to complete
	int result = ADC1->DR;
	NVIC_Enable_All();
	return result;
}

void ADCContinuous( int channel, int samples, int interrupt )
{
	if ( channel == 17 )
	{
		// if channel is internal VREF then wait for it to be ready
		while( (PWR->CSR & PWR_CSR_VREFINTRDYF) == 0 );
	}
	
	ADC1->ISR = ADC_ISR_EOC;
	ADC1->CFGR1 |= ADC_CFGR1_CONT;
	ADC1->SMPR = samples & 0x7;
	ADC1->CHSELR = 1 << channel;
	
	if ( interrupt ) ADC1->IER = ADC_IER_EOCIE;
	else ADC1->IER = 0;
	
	ADC1->CR |= ADC_CR_ADSTART;// start continuous conversion
}

