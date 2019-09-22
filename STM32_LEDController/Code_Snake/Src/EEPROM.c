
static inline void EEPROMUnlock()
{
	if ( FLASH->PECR & FLASH_PECR_PELOCK )
	{
		FLASH->PEKEYR = 0x89ABCDEF;
		FLASH->PEKEYR = 0x02030405;
	}
}

static inline void EEPROMLock()
{
	if ( FLASH->PECR & FLASH_PECR_PELOCK ) return;
	FLASH->PECR |= FLASH_PECR_PELOCK;
}

int EEPROMReadByte( unsigned int address )
{
	if ( address > 1023 ) return 0;
	return *((unsigned char*)(DATA_EEPROM_BASE + address));
}

void EEPROMWriteByte( unsigned int address, unsigned char value )
{
	if ( address > 1023 ) return;
	EEPROMUnlock();
	*((unsigned char*)(DATA_EEPROM_BASE + address)) = value;
	EEPROMLock();
}

unsigned int EEPROMReadInt( unsigned int address ) // address must be a multiple of 4
{
	if ( address > 1020 ) return 0;
	return *((unsigned int*)(DATA_EEPROM_BASE + address));
}

void EEPROMWriteInt( unsigned int address, unsigned int value ) // address must be a multiple of 4
{
	if ( address > 1020 ) return;
	EEPROMUnlock();
	*((unsigned int*)(DATA_EEPROM_BASE + address)) = value;
	EEPROMLock();
}

