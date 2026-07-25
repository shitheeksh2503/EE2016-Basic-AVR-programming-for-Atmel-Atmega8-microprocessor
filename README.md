# EE2016 Microprocessor Lab — ATmega8 AVR Assembly

A collection of assembly-language experiments on the Atmel ATmega8
microcontroller, progressing from basic arithmetic emulation to hardware
GPIO/breadboard wiring and finally external interrupt handling.

## Contents

| Report | Title | Description |
|---|---|---|
| Experiment 1 | **AVR Arithmetic Operations** | 8-bit/16-bit addition, 8-bit multiplication, and largest-of-N comparison, run in the Microchip Studio emulator. |
| Experiment 2 | **AVR Hardware Wiring & I/O Programming** | Breadboard wiring of LEDs, push button, and DIP switch; timed LED blinking, button-controlled LED, and 4-bit nibble addition from switch input. |
| Experiment 3 | **AVR External Interrupts (INT0/INT1)** | Configuring and servicing external hardware interrupts to trigger a 10-count LED blink routine. |

Each experiment has its own README with problem descriptions, techniques
used, and verification notes.

## Tools
- **Microchip Studio** (AVR assembler + emulator/debugger)
- **Atmel ATmega8** microcontroller, breadboard, LEDs, push button, DIP switch

## Progression
The experiments build on each other: Experiment 1 establishes core assembly
skills (registers, memory addressing, arithmetic) purely in emulation;
Experiment 2 moves to real hardware I/O (GPIO direction, pull-ups, live
switch input); Experiment 3 adds interrupt-driven control on top of that
hardware I/O foundation.
