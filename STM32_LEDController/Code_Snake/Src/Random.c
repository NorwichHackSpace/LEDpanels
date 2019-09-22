static uint64_t       randState      = 0x4d595df4d0f33173;		// Or something seed-dependent
static uint64_t const randMultiplier = 6364136223846793005u;
static uint64_t const randIncrement  = 1442695040888963407u;	// Or an arbitrary odd constant
static uint32_t randMax = 0xFFFFFFFF;
static uint32_t randLimit = 0xFFFFFFFF;

uint32_t random(void)
{
	randState = randState * randMultiplier + randIncrement;
	unsigned char count = (unsigned)(randState >> 59);
	uint64_t x = randState ^ (randState >> 18);
	uint32_t x32 = x >> 27;
	return (x32 >> count) | (x32 << (32-count));
}

// range of 0 to max (inclusive)
uint32_t random2( uint32_t max )
{
	if ( max != randMax )
	{
		if ( max == 0xFFFFFFFF ) randLimit = 0xFFFFFFFF;
		else randLimit = 0xFFFFFFFF - (0xFFFFFFFF % (max+1));
		randMax = max;
	}
	
	uint32_t result;
	do
	{
		result = random();
	}
	while( result >= randLimit );
	return result % (max+1);
}

void random_seed(uint64_t seed)
{
	randState = seed + randIncrement;
}

