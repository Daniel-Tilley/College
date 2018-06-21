/* This program uses UART to send data back to the host using
 * simple print statements.  UART transmission is not interrupt
 * driven.  Reception is not implemented in this example.
 * 
 * Operation:
 * 
 * Wiring.
 * A USB to serial converter is wired to the TX and RX pins of UART0
 */
#include "lpc111x.h"
#include "uart.h"
#include "dnd.h"
// declare a global millisecond counter for timing purposes
volatile unsigned msCounter=0; 
unsigned prbs(void);
void initSysTick()
{
	
	// The systick timer is driven by a 48MHz clock
	// Divide this down to achieve a 1ms timebase
	// Divisor = 48MHz/1000Hz
	// Reload value = 48000-1
	// enable systick and its interrupts
	SYST_CSR |=(BIT0+BIT1+BIT2); 
	SYST_RVR=48000-1; // generate 1 millisecond time base
	SYST_CVR=5;
	enable_interrupts();
}
unsigned prbs()
{
	// This is an unverified 31 bit PRBS generator
	// It should be maximum length but this has not been verified 
	static unsigned long shift_register=0xa5a5a5a5;
	unsigned long new_bit=0;
	static int busy=0; // need to prevent re-entrancy here
	if (!busy)
	{
		busy=1;
		new_bit= ((shift_register & (1<<27))>>27) ^ ((shift_register & (1<<30))>>30);
		new_bit= ~new_bit;
		new_bit = new_bit & 1;
		shift_register=shift_register << 1;
		shift_register=shift_register | (new_bit);
		busy=0;
	}
	return shift_register & 0x7ffffff; // return 31 LSB's 
}
void SysTick(void)
{
	msCounter++;
	prbs(); // cycle the random number generator
}
int main() 
{	
  initSysTick();
	initUART();	
	printString("LPC1114. Booting... \r\n");	
	while(1) 
	{		
		RunGame();
	}    
}



