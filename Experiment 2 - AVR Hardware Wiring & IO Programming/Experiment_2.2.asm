

.INCLUDE "M8DEF.INC"

LDI R16, 0xFF;  Set Port B as output
OUT DDRB, R16

LOOP:
	CBI DDRD, 0
	SBI PORTD, 0;  Initiate an internal pull up and also have external pull up resistor
	           
	IN R16, PIND;  Read Port D value connected to push button
	OUT PORTB, R16;  Output to the LED
	RJMP LOOP

