
static inline void RTCEnableWrite()
{
	RTC->WPR = 0xCA; RTC->WPR = 0x53; // disable write protection
}

static inline void RTCDisableWrite()
{
	RTC->WPR = 0x00; // enable write protection
}

int subticks;
int subtickToMillis64;
void SetupRTC()
{
#ifdef USE_LSE	
	PWR->CR |= PWR_CR_DBP; // enable RTC writes
	RCC->CSR |= RCC_CSR_LSEBYP | RCC_CSR_LSEON; // turn on LSE
	while( (RCC->CSR & RCC_CSR_LSERDY) == 0 );
	RCC->CSR |= RCC_CSR_RTCEN | RCC_CSR_RTCSEL_0; // turn on RTC using LSE
	subticks = 256;
#else
	RCC->CSR |= RCC_CSR_LSION; // turn on LSI
	while( (RCC->CSR & RCC_CSR_LSIRDY) == 0 );
	PWR->CR |= PWR_CR_DBP; // enable RTC writes
	RCC->CSR |= RCC_CSR_RTCEN | RCC_CSR_RTCSEL_1; // turn on RTC using LSI
	RTCEnableWrite();
	RTC->ISR |= RTC_ISR_INIT;
	while( (RTC->ISR & RTC_ISR_INITF) == 0 );
	subticks = LSIFREQ / 128;
	RTC->PRER = ((127) << 16) | (subticks-1); // ASync=128, subticks=CLK/ASync
	RTC->ISR &= ~RTC_ISR_INIT;
	RTCDisableWrite();
#endif
	RTC->CR |= RTC_CR_BYPSHAD; // bypass shadow registers for improved performance
	subtickToMillis64 = (1000*64) / subticks;
}

void RTCSetTime( int hourT, int hourU, int minuteT, int minuteU, int secondsT, int secondsU )
{
	RTCEnableWrite();
	RTC->ISR |= RTC_ISR_INIT;
	while( (RTC->ISR & RTC_ISR_INITF) == 0 );
	RTC->TR = (hourT << 20) | (hourU << 16) | (minuteT << 12) | (minuteU << 8) | (secondsT << 4) | secondsU;
	RTC->ISR &= ~RTC_ISR_INIT;
	RTCDisableWrite();
}

void RTCSetDate( int yearT, int yearU, int monthT, int monthU, int dayT, int dayU, int dow )
{
	RTCEnableWrite();
	RTC->ISR |= RTC_ISR_INIT;
	while( (RTC->ISR & RTC_ISR_INITF) == 0 );
	RTC->DR = (yearT << 20) | (yearU << 16) | (monthT << 12) | (monthU << 8) | (dayT << 4) | dayU | (dow << 13);
	RTC->ISR &= ~RTC_ISR_INIT;
	RTCDisableWrite();
}

void RTCSetTimeTR( int tr )
{
	RTCEnableWrite();
	RTC->ISR |= RTC_ISR_INIT;
	while( (RTC->ISR & RTC_ISR_INITF) == 0 );
	RTC->TR = tr;
	RTC->ISR &= ~RTC_ISR_INIT;
	RTCDisableWrite();
}

void RTCSetDateDR( int dr )
{
	RTCEnableWrite();
	RTC->ISR |= RTC_ISR_INIT;
	while( (RTC->ISR & RTC_ISR_INITF) == 0 );
	RTC->DR = dr;
	RTC->ISR &= ~RTC_ISR_INIT;
	RTCDisableWrite();
}

void RTCDisableWakeup()
{
	RTCEnableWrite();
	
	EXTI->IMR &= ~EXTI_EMR_EM20;
	EXTI->RTSR &= ~EXTI_RTSR_RT20;
	NVIC_DisableIRQ( RTC_IRQn );
	
	RTC->CR &= ~RTC_CR_WUTE;
	
	RTCDisableWrite();
}

void RTCEnableAutoWakeUpSeconds( int seconds )
{
	RTCEnableWrite();
	
	// set up wake up timer interrupt
	EXTI->IMR |= EXTI_EMR_EM20;
	EXTI->RTSR |= EXTI_RTSR_RT20;
	NVIC_EnableIRQ( RTC_IRQn );
	
	RTC->CR &= ~RTC_CR_WUTE;
	while( (RTC->ISR & RTC_ISR_WUTWF) == 0 );
	RTC->WUTR = seconds-1;
	RTC->CR = (RTC->CR & ~RTC_CR_WUCKSEL_Msk) | RTC_CR_WUCKSEL_2; // set wake up clock to 1Hz
	RTC->CR |= RTC_CR_WUTIE | RTC_CR_WUTE; // enable wake up timer
	RTCDisableWrite();
	RTC->ISR = 0;
}

void RTCEnableAutoWakeUp1Hz()
{
	RTCEnableAutoWakeUpSeconds( 1 );
}

void RTCEnableAutoWakeUpHz( unsigned int Hz )
{
	RTCEnableWrite();
	
	// set up wake up timer interrupt
	EXTI->IMR |= EXTI_EMR_EM20;
	EXTI->RTSR |= EXTI_RTSR_RT20;
	NVIC_EnableIRQ( RTC_IRQn );
	
	RTC->CR &= ~RTC_CR_WUTE;
	while( (RTC->ISR & RTC_ISR_WUTWF) == 0 );
	
#ifdef USE_LSE
	unsigned int freq = 32768;
#else
	unsigned int freq = LSIFREQ;
#endif
	
	unsigned int ticks = freq << 15; // << 16 then / 2
	ticks /= Hz;
	if ( (ticks & 0xFFFF) > 32767 ) ticks >>= 16;
	else 
	{
		ticks >>= 16;
		if ( ticks > 1 ) ticks--;
	}
	RTC->WUTR = ticks;
	
	RTC->CR = (RTC->CR & ~RTC_CR_WUCKSEL_Msk) | RTC_CR_WUCKSEL_0 | RTC_CR_WUCKSEL_1; // set wake up clock to RTCCLK/2
	RTC->CR |= RTC_CR_WUTIE | RTC_CR_WUTE; // enable wake up timer
	RTCDisableWrite();
	RTC->ISR = 0;
}

void RTCEnableAutoWakeUp10Hz() { RTCEnableAutoWakeUpHz( 10 ); }
void RTCEnableAutoWakeUp30Hz() { RTCEnableAutoWakeUpHz( 30 ); }


static inline int GetDayU( int date ) { return date & 0xF; }
static inline int GetDayT( int date ) { return (date >> 4) & 0x3; }
static inline int GetMonthU( int date ) { return (date >> 8) & 0xF; }
static inline int GetMonthT( int date ) { return (date >> 12) & 0x1; }
static inline int GetYearU( int date ) { return (date >> 16) & 0xF; }
static inline int GetYearT( int date ) { return (date >> 20) & 0xF; }
static inline int GetWeekday( int date ) { return (date >> 13) & 0x7; } // Mon = 1, Tue = 2, etc

static inline int GetHoursU( int time ) { return (time >> 16) & 0xF; }
static inline int GetHoursT( int time ) { return (time >> 20) & 0x3; }
static inline int GetMinutesU( int time ) { return (time >> 8) & 0xF; }
static inline int GetMinutesT( int time ) { return (time >> 12) & 0x7; }
static inline int GetSecondsU( int time ) { return time & 0xF; }
static inline int GetSecondsT( int time ) { return (time >> 4) & 0x7; }

static inline int SetDayU( int date, int dayU ) { return (date & ~0xF) | dayU; }
static inline int SetDayT( int date, int dayT ) { return (date & ~(0x3 << 4)) | (dayT << 4); }
static inline int SetMonthU( int date, int monthU ) { return (date & ~(0xF << 8)) | (monthU << 8); }
static inline int SetMonthT( int date, int monthT ) { return (date & ~(1 << 12)) | (monthT << 12); }
static inline int SetYearU( int date, int yearU ) { return (date & ~(0xF << 16)) | (yearU << 16); }
static inline int SetYearT( int date, int yearT ) { return (date & ~(0xF << 20)) | (yearT << 20); }
static inline int SetWeekday( int date, int weekday ) { return (date & ~(0x7 << 13)) | (weekday << 13); } // Mon = 1, Tue = 2, etc

static inline int SetHoursU( int time, int hourU ) { return (time & ~(0xF << 16)) | (hourU << 16); }
static inline int SetHoursT( int time, int hourT ) { return (time & ~(0x3 << 20)) | (hourT << 20); }
static inline int SetMinutesU( int time, int minuteU ) { return (time & ~(0xF << 8)) | (minuteU << 8); }
static inline int SetMinutesT( int time, int minuteT ) { return (time & ~(0x7 << 12)) | (minuteT << 12); }
static inline int SetSecondsU( int time, int secondsU ) { return (time & ~0xF) | secondsU; }
static inline int SetSecondsT( int time, int secondsT ) { return (time & ~(0x7 << 4)) | (secondsT << 4); }

static inline void RTCGetSubTimeDate( unsigned int *subTime, unsigned int *time, unsigned int *date )
{
	unsigned int date1;
	do
	{
		*subTime = RTC->SSR;
		*time = RTC->TR;
		date1 = RTC->DR;
	} while ( *subTime != RTC->SSR || *time != RTC->TR || date1 != RTC->DR );
	if ( date ) *date = date1;
}

static inline void RTCGetTimeDate( unsigned int *time, unsigned int *date )
{
	unsigned int date1;
	do
	{
		*time = RTC->TR;
		date1 = RTC->DR;
	} while ( *time != RTC->TR || date1 != RTC->DR );
	if ( date ) *date = date1;
}

static inline unsigned int RTCGetDate()
{
	unsigned int date;
	do
	{
		date = RTC->DR;
	} while( date != RTC->DR );
	return date;
}

// overflows after 24 hours
unsigned int RTCGetSeconds()
{
	unsigned int time;
	RTCGetTimeDate( &time, 0 );
	unsigned int seconds = GetSecondsU(time) + GetSecondsT(time)*10 
										  + (GetMinutesU(time) + GetMinutesT(time)*10)*60 
										  + (GetHoursU(time) + GetHoursT(time)*10)*3600;
	return seconds;
}

// max check is 24 hours
int RTCElapsed( unsigned int start, int seconds )
{
	unsigned int time;
	RTCGetTimeDate( &time, 0 );
	unsigned int curr = GetSecondsU(time) + GetSecondsT(time)*10 
									 + (GetMinutesU(time) + GetMinutesT(time)*10)*60 
									 + (GetHoursU(time) + GetHoursT(time)*10)*3600;
	if ( curr < start ) curr += 86400;
	if ( curr - start > seconds ) return 1;
	else return 0;
}

unsigned int RTCGetSubSeconds()
{
	unsigned int subtime, time;
	RTCGetSubTimeDate( &subtime, &time, 0 );
	unsigned int seconds = GetSecondsU(time) + GetSecondsT(time)*10 
										  + (GetMinutesU(time) + GetMinutesT(time)*10)*60 
										  + (GetHoursU(time) + GetHoursT(time)*10)*3600;
	return seconds*subticks + ((subticks-1) - subtime);
}

int RTCElapsedSub( unsigned int start, int milliseconds )
{
	unsigned int subtime, time;
	RTCGetSubTimeDate( &subtime, &time, 0 );
	unsigned int curr = GetSecondsU(time) + GetSecondsT(time)*10 
									 + (GetMinutesU(time) + GetMinutesT(time)*10)*60 
									 + (GetHoursU(time) + GetHoursT(time)*10)*3600;
	curr = curr*subticks + ((subticks-1) - subtime);
	if ( curr < start ) curr += (86400*subticks);
	unsigned int diff = (curr - start) * subtickToMillis64;
	diff /= 64;
	if ( diff > milliseconds ) return 1;
	else return 0;
}

