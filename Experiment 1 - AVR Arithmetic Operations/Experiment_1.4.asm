.CSEG
LDI ZL, LOW(NUM<<1)  
LDI ZH, HIGH(NUM<<1)  
  
LDI R20, 0x04
LPM R0,Z+
LPM R1,Z+
LPM R2,Z+
LPM R3,Z+

loop_start:
LDI XL, 0x60
LDI XH, 0x00

CP R0, R2
BREQ equal
BRCS lesser
rjmp greater

equal:
CP R1, R3
BREQ inner_equal
BRCS inner_lesser
rjmp inner_greater

inner_equal:
LPM R0, Z+
LPM R1, Z+
ST X+, R2
ST X, R3
rjmp done

inner_lesser:
LPM R0, Z+
LPM R1, Z+
ST X+, R2
ST X, R3
rjmp done

inner_greater:
LPM R2, Z+
LPM R3, Z+
ST X+, R0
ST X, R1

lesser:
LPM R0, Z+
LPM R1, Z+
ST X+, R2
ST X, R3
rjmp done

greater:
LPM R2, Z+
LPM R3, Z+
ST X+, R0
ST X, R1

done:
DEC R20
BRNE loop_start

NOP
NUM: .db 0x00, 0x01, 0x00, 0x34, 0x7F, 0xFF, 0xAB, 0xCD, 0xFF, 0xFF, 0x00, 0x00
; 1, 52, 32767, 43981, 65535, 0
