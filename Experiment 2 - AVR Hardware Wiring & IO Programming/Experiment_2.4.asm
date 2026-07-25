
.INCLUDE "M8DEF.INC"

LDI R16, 0x00
OUT DDRB, R16;  Make Port B input

COM R16
OUT DDRD, R16;  Make Port D output

LOOP:
	OUT PORTB, R16;  Enable pull-up
	
	IN R17, PINB
	MOV R18, R17

	ANDI R17, 0x0F
	ANDI R18, 0xF0

	SWAP R18

	ADD R17, R18;  Gives sum after splitting the 8 bits

	OUT PORTD, R17;  Output to the LED
	RJMP LOOP

