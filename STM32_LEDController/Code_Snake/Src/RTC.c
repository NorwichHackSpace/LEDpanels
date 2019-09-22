#ifdef USE_LSE_CRYSTAL
	#define USE_LSE
#endif

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

	#ifdef USE_LSE_CRYSTAL
		RCC->CSR |= RCC_CSR_LSEON; // turn on LSE
	#else
		RCC->CSR |= RCC_CSR_LSEBYP | RCC_CSR_LSEON; // turn on LSE
	#endif

	while( (RCC->CSR & RCC_CSR_LSERDY) == 0 );
	RCC->CSR |= RCC_CSR_RTCEN | RCC_CSR_RTCSEL_0; // turn on RTC using LSE
	subticks = 256;
#else
	RCC->CSR |= RCC_CSR_LSION; // turn on LSI
	while( (RCC->CSR & RCC_CSR_LSIRDY) == 0 );
	PWR->CR |= PWR_CR_DBP; // enable RTC writes
	RCC->CSR |= RCC_CSR_RTCEN | RCC_CSR_RTCSEL_1; // turn on RTC using LSI
	subticks = LSIFREQ / 128;
#endif

	RTCEnableWrite();
	RTC->ISR |= RTC_ISR_INIT;
	while( (RTC->ISR & RTC_ISR_INITF) == 0 );
	RTC->PRER = ((127) << 16) | (subticks-1); // ASync=128, subticks=CLK/ASync
	RTC->ISR &= ~RTC_ISR_INIT;
	RTC->CR = RTC_CR_BYPSHAD; // bypass shadow registers for improved performance
	RTCDisableWrite();

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


static inline unsigned int GetDayU( unsigned int date ) { return date & 0xF; }
static inline unsigned int GetDayT( unsigned int date ) { return (date >> 4) & 0x3; }
static inline unsigned int GetMonthU( unsigned int date ) { return (date >> 8) & 0xF; }
static inline unsigned int GetMonthT( unsigned int date ) { return (date >> 12) & 0x1; }
static inline unsigned int GetYearU( unsigned int date ) { return (date >> 16) & 0xF; }
static inline unsigned int GetYearT( unsigned int date ) { return (date >> 20) & 0xF; }
static inline unsigned int GetWeekday( unsigned int date ) { return (date >> 13) & 0x7; } // Mon = 1, Tue = 2, etc

static inline unsigned int GetHoursU( unsigned int time ) { return (time >> 16) & 0xF; }
static inline unsigned int GetHoursT( unsigned int time ) { return (time >> 20) & 0x3; }
static inline unsigned int GetMinutesU( unsigned int time ) { return (time >> 8) & 0xF; }
static inline unsigned int GetMinutesT( unsigned int time ) { return (time >> 12) & 0x7; }
static inline unsigned int GetSecondsU( unsigned int time ) { return time & 0xF; }
static inline unsigned int GetSecondsT( unsigned int time ) { return (time >> 4) & 0x7; }

static inline unsigned int SetDayU( unsigned int date, unsigned int dayU ) { return (date & ~0xF) | dayU; }
static inline unsigned int SetDayT( unsigned int date, unsigned int dayT ) { return (date & ~(0x3 << 4)) | (dayT << 4); }
static inline unsigned int SetMonthU( unsigned int date, unsigned int monthU ) { return (date & ~(0xF << 8)) | (monthU << 8); }
static inline unsigned int SetMonthT( unsigned int date, unsigned int monthT ) { return (date & ~(1 << 12)) | (monthT << 12); }
static inline unsigned int SetYearU( unsigned int date, unsigned int yearU ) { return (date & ~(0xF << 16)) | (yearU << 16); }
static inline unsigned int SetYearT( unsigned int date, unsigned int yearT ) { return (date & ~(0xF << 20)) | (yearT << 20); }
static inline unsigned int SetWeekday( unsigned int date, unsigned int weekday ) { return (date & ~(0x7 << 13)) | (weekday << 13); } // Mon = 1, Tue = 2, etc

static inline unsigned int SetHoursU( unsigned int time, unsigned int hourU ) { return (time & ~(0xF << 16)) | (hourU << 16); }
static inline unsigned int SetHoursT( unsigned int time, unsigned int hourT ) { return (time & ~(0x3 << 20)) | (hourT << 20); }
static inline unsigned int SetMinutesU( unsigned int time, unsigned int minuteU ) { return (time & ~(0xF << 8)) | (minuteU << 8); }
static inline unsigned int SetMinutesT( unsigned int time, unsigned int minuteT ) { return (time & ~(0x7 << 12)) | (minuteT << 12); }
static inline unsigned int SetSecondsU( unsigned int time, unsigned int secondsU ) { return (time & ~0xF) | secondsU; }
static inline unsigned int SetSecondsT( unsigned int time, unsigned int secondsT ) { return (time & ~(0x7 << 4)) | (secondsT << 4); }

static inline void RTCGetSubTimeDate( unsigned int *subTime, unsigned int *time, unsigned int *date )
{
	unsigned int date1;
	unsigned int date2;
	unsigned int time2;
	unsigned int subTime2;
	do
	{
		*subTime = RTC->SSR;
		*time = RTC->TR;
		date1 = RTC->DR;
		subTime2 = RTC->SSR;
		time2 = RTC->TR;
		date2 = RTC->DR;

	} while ( *subTime != subTime2 || *time != time2 || date1 != date2 );
	if ( date ) *date = date1;
}

static inline void RTCGetTimeDate( unsigned int *time, unsigned int *date )
{
	unsigned int date1;
	unsigned int date2;
	unsigned int time2;
	do
	{
		*time = RTC->TR;
		date1 = RTC->DR;
		time2 = RTC->TR;
		date2 = RTC->DR;
	} while ( *time != time2 || date1 != date2 );
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

