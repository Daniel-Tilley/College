/* This program presents a counter on a 4 digit seven segment display.
 * The display is refreshed in the main program loop so if program
 * becomes more complex the display will be refreshed less frequently
 * leading to a flickering display.  A better solution will be shown
 * later that uses a periodic interrupt to update the display
 * 
 * Operation:
 * A global array represents the 'video' memory for the display.  
 * In order to display a number, the DisplayNumber function must be 
 * called which breaks the number into its component digits and then
 * translates these to the bit patterns that cause the appropriate
 * display segments to turn on. These patterns are stored in the 
 * global DisplayMemory array.
 * The RefreshDisplay function takes the contents of the DisplayMemory
 * array and copies them out to the port pins driving the display 
 * segments.  Each display digit is activated in turn, its are 
 * turned on (or not) and there is a slight pause which fools our
 * eyes into thinking that all display digits are on all of the time.
 * 
 * Wiring.
 * The display is wired to Port 0.  Segments are wired to bits 5-11
 * and digits are wired to bits 1-4.  The display in question is a 
 * 4 digit common cathode device.  In order to place a number on a 
 * digit the segments must be driven high (through a resistor to limit
 * current) and the common cathode for that display must be driven
 * low.  
 * 
 */

#include "lpc111x.h"

#define DIGIT_PAUSE_TIME 10000

// Digit segment definitions
const short digits[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};

int DisplayMemory[4];
void delay(int dly)
{
  while (dly--);
}

void DisplayNumber(int Number)
{
// This function separates out each of digits in the number and
// places them in the "video" or display memory
// The RefreshDisplay function renders these digits on the display

	DisplayMemory[0]=digits[Number % 10]; // Units
	Number = Number / 10;
	DisplayMemory[1]=digits[Number % 10]; // Tens
	Number = Number / 10;
	DisplayMemory[2]=digits[Number % 10]; // Hundreds
	Number = Number / 10;
	DisplayMemory[3]=digits[Number % 10]; // Thousands
}
void RefreshDisplay(void)
{ 
	// Turn on (make low) the desired digit and blank all segments
	GPIO0DATA = BIT1 | BIT2 | BIT3;
	// Set the relevant segment bits
	GPIO0DATA = GPIO0DATA |  (DisplayMemory[0] << 5); // Turn on segments
	// Wait for display to light up
	delay(DIGIT_PAUSE_TIME);
	
	// repeat for next digit
	GPIO0DATA = BIT1 | BIT2 | BIT4;
	GPIO0DATA = GPIO0DATA | (DisplayMemory[1] << 5); // Turn on segments
	delay(DIGIT_PAUSE_TIME);
	
	// repeat for next digit
	GPIO0DATA = BIT1 | BIT3 | BIT4;
	GPIO0DATA = GPIO0DATA | (DisplayMemory[2] << 5); // Turn on segments
	delay(DIGIT_PAUSE_TIME);

	// repeat for next digit
	GPIO0DATA = BIT2 | BIT3 | BIT4;
	GPIO0DATA = GPIO0DATA | (DisplayMemory[3] << 5); // Turn on segments
	delay(DIGIT_PAUSE_TIME);
}
void ConfigPins()
{
// For further information about what's going on here please refer to the LPC1114 reference manual
// Document UM10398, chapters 7 and 12
	SYSAHBCLKCTRL |= BIT6 + BIT16; // Turn on clock for GPIO and IOCON 
	// Make all of the segment and digit bits outputs
	GPIO0DIR = (0x7f << 5) | BIT1 | BIT2 | BIT3 | BIT4;
	// Turn off (make high) all display digits
	GPIO0DATA = BIT1 | BIT2 | BIT3  | BIT4;
	// Make Port 0 bit 5 behave as a generic output port (open drain)
	IOCON_PIO0_5 |= BIT8;
	// Make Port 0 bit 10 behave as a generic I/O port
	IOCON_SWCLK_PIO0_10  = 1; 
	// Make Port 0 bit 11 behave as a generic I/O port
	IOCON_R_PIO0_11  = 1; 	
}

int main()
{	
	
	ConfigPins();
	int i=0;	
	while(1) 
	{
	
		DisplayNumber(i++);
		RefreshDisplay();
		if (i > 9999)
			i=0;
		
	}    
}



