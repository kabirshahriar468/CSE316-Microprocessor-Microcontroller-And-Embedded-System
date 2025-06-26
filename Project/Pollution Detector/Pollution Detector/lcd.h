#include <avr/io.h>
#include <util/delay.h>
#define E (1 << PA7)
#define RW (1 << PA6)
#define RS (1 << PA5)

void lcdinit()
{

	// initialize PORTs for LCD

	DDRB |= (1 << PB3) | (1 << PB2) | (1 << PB1) | (1 << PB0);
	DDRA |= (1 << PA7) | (1 << PA6) | (1 << PA5);

	// Send Pulse to Latch the data
	latch();
	_delay_ms(2); // delay for stable power
	// Command to set up the LCD
	lcdcmd(0x33);
	_delay_us(100);
	lcdcmd(0x32);
	_delay_us(100);
	lcdcmd(0x28); // 2 lines 5x7 matrix dot, 4 bit data
	_delay_us(100);
	// lcdcmd(0x0E);  // display ON, Cursor ON
	lcdcmd(0x0C); // display ON, Cursor ON
	_delay_us(100);
	lcdcmd(0x01);  // clear LCD
	_delay_ms(20); // wait
	lcdcmd(0x06);  // shift cursor to right
	_delay_ms(500);
}

void latch(void)
{
	PORTA |= E;		// send high
	_delay_us(500); // wait
	PORTA &= ~E;	// send low
	_delay_us(500); // wait
}

void lcdcmd(uint8_t cmd)
{

	PORTB = (PORTB & 0xF0) | (cmd >> 4);   // send low nibble
	PORTA &= ~RW;						   // send 0 for write operation
	PORTA &= ~RS;						   // send 0 to select command register
	latch();							   // latch the data
	PORTB = (PORTB & 0xF0) | (cmd & 0x0F); // send high nibble

	latch(); // latch the data
}

void lcdchar(uint8_t data)
{

	PORTB = (PORTB & 0xF0) | (data >> 4); // send high nibble
	PORTA &= ~RW;						  // send 0 for write operation
	PORTA |= RS;						  // send 1 to select data register
	latch();
	PORTB = (PORTB & 0xF0) | (data & 0x0F); // send high nibble

	latch();
}

void lcdstr(char *str)
{
	uint8_t k = 0;
	while (str[k] != 0)
	{
		lcdchar(str[k]);
		k++;
	}
}

void lcdgoto(uint8_t x, uint8_t y)
{
	uint8_t firstcharadr[] = {0x80, 0xC0, 0x94, 0xD4};
	lcdcmd(firstcharadr[y - 1] + x - 1);
	_delay_us(10);
}

void adcinit()
{
	// make PA0 an analog input
	DDRA &= ~(1 << PA0); /* Make ADC port as input */
	// enable ADC module, set prescalar of 128 which gives CLK/128
	ADCSRA |= (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
	// set the voltage reference using REFS1 and REFS0 bits and select the ADC channel using the MUX bits
	ADMUX = 0b01000000; // set REFS1 = 0 |REFS0 = 1 (Vref as AVCC pin) | ADLAR = 0(right adjusted) |  MUX4 to MUX0 is 0000 for ADC0
}

int adcread(char channel)
{
	/* set input channel to read */
	ADMUX = 0x40 | (channel & 0x07); // 0100 0000 | (channel & 0000 0100)
	/* Start ADC conversion */
	ADCSRA |= (1 << ADSC);
	/* Wait until end of conversion by polling ADC interrupt flag */
	while (!(ADCSRA & (1 << ADIF)))
		;
	/* Clear interrupt flag */
	ADCSRA |= (1 << ADIF);
	_delay_ms(1); /* Wait a little bit */
				  /* Return ADC word */
	return ADCW;
}