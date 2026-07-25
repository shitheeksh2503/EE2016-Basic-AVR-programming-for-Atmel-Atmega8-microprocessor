# Experiment 2: AVR Hardware Wiring & I/O Programming

Hardware bring-up of the ATmega8 on a breadboard, interfacing LEDs, a push
button, and a DIP switch through GPIO, programmed in AVR assembly.

## Problems

- **Problem 1 — LED Blink (Timed)**: Blinks an LED on Port B with a 0.5 s ON
  pulse and 1 Hz repetition rate, using nested `DEC`/`BRNE` software delay
  loops (cycle-counted for timing accuracy) and `COM` to toggle all bits.
- **Problem 2 — Push-Button Controlled LED**: Reads a push button on Port D
  (internal pull-up enabled via `PORTD`) and mirrors its state directly onto
  an LED on Port B — LED stays ON only while the button is pressed.
- **Problem 3 — 4-bit Addition (Register Split)**: Takes a hardcoded 8-bit
  value, splits it into two nibbles using `ANDI` masks (`0x0F`/`0xF0`) and
  `SWAP`, adds the nibbles, and outputs the result to Port B.
- **Problem 4 — 4-bit Addition (DIP Switch Input)**: Same nibble-split/add
  operation as Problem 3, but the 8-bit input comes live from a DIP switch
  wired to Port B (input, pull-ups enabled), with the result displayed on
  LEDs via Port D.

## Techniques Used
- `DDRB`/`DDRD` for port direction configuration
- Internal pull-up resistors (`PORTx` bit set while `DDRx` bit cleared)
- Nibble splitting/swapping with `ANDI` and `SWAP` for 4-bit arithmetic
- Cycle-counted software delay loops for precise timing

## Verification
Problems 1–3 were verified in the Microchip Studio emulator (register/memory
watch) and Problem 4 was demonstrated live on a breadboard with LEDs and a
DIP switch (see report for photos and emulator screenshots).
