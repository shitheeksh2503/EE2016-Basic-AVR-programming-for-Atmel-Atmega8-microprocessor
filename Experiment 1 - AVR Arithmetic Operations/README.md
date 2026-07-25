# Experiment 1: AVR Arithmetic Operations

Basic arithmetic and comparison routines implemented in AVR assembly on the
Atmel ATmega8, emulated in Microchip Studio.

## Problems

- **Problem 1 — 8-bit Addition**: Adds two 8-bit words stored in program
  memory (`NUM`), handles carry, and stores the carry + sum at data address
  `0x0060`.
- **Problem 2 — 16-bit Addition**: Adds two 16-bit words (each split into two
  8-bit bytes), propagating carry across both bytes and any final carry-out,
  storing the 3-byte result (carry, high byte, low byte) at `0x0060`.
- **Problem 3 — 8-bit Multiplication**: Multiplies two 8-bit words using the
  `MUL` instruction and stores the 16-bit product at `0x0060`.
- **Problem 4 — Largest of 5 Numbers**: Compares five 16-bit words (high byte
  first, then low byte on ties) in a loop and stores the running largest
  value at `0x0060`.

## Techniques Used
- `LPM` to read constants from program memory (`.db`) via the `Z` register
- `X`/`Y`/`Z` pointer registers for indirect data memory addressing
- `ADD`, `ADC`-style carry handling via `BRCC`, `MUL`, and `CP`/`BRCS`/`BREQ`
  based comparison logic

## Verification
Each problem was single-stepped in the Microchip Studio AVR emulator,
checking register and data-memory values against expected results (see
report for register/memory screenshots).
