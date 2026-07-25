.INCLUDE  "M8DEF.INC"

LDI R16, 0xFF;  Setting Port B as output
OUT DDRB, R16

LDI R17, 0x34;  Replace 0x34 with any desired number
MOV R18, R17;  R17 and R18 now has the required word which has to be split and added

ANDI R17, 0x0F  ;Bitwise AND with 0x0F gives the last 4 bits in R17
ANDI R18, 0xF0  ;Bitwise AND with 0xF0 gives the first 4 bits in R18
SWAP R18  ;Exchange the first four and last four bits

ADD R17, R18;  Add and store sum in R17

MOV R16, R17;  Shift value in R17 to R16

OUT PORTB, R16;  Writing R16 values into Port B