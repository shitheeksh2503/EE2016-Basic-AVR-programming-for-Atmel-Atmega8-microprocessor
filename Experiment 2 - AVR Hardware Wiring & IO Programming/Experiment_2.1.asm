.INCLUDE "M8DEF.INC"

LDI R16, 0xFF;
OUT DDRB, R16;	Setting Port B as output

WRITE:
	OUT PORTB, R16;  Writing R16 values into Port B
	RJMP DELAY

SWITCH:
	COM R16;	Reverse the bits in R16
	RJMP WRITE

DELAY:
	LDI R25, 2;	  
	D1:
		LDI R26, 200
	D2:
		LDI R27, 250
	D3:
		NOP;  1 CPU cycle
		NOP;  1 CPU cycle
		DEC R27;  1 CPU cycle
		BRNE D3;  2 CPU cycles (1 cycle in last loop but mostly 2)
		DEC R26;  1 CPU cycle
		BRNE D2;  2 CPU cycles (1 cycle in last loop but mostly 2)
		DEC R25;  1 CPU cycle
		BRNE D1;  2 CPU cycles (1 cycle in last loop but mostly 2)
		RJMP SWITCH

;Loop calculation: (((5*250)+3)*200)+3)*2 = 501206 CPU cycle, each CPU cycle in 1 microsecond
;                  Time taken= 501206*0.000001 = 0.501206 seconds