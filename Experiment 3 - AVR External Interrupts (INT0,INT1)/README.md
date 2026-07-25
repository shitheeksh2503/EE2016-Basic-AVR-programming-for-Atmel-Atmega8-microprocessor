# Experiment 3: AVR External Interrupts (INT0/INT1)

Hardware interrupt handling on the ATmega8, implemented entirely in AVR
assembly, using external interrupts to trigger a timed LED blink sequence.

## Tasks

- **Task 1 — INT1-Triggered LED Blink**: Configures `INT1` (falling edge, via
  `MCUCR`/`GICR`), with the interrupt vector at `0x0002` jumping to an ISR
  that blinks an LED on Port B 10 times using nested delay loops, then
  returns via `RETI`.
- **Task 2 — INT0-Triggered LED Blink**: Same behavior as Task 1, but
  reconfigured to use `INT0` (vector at `0x0001`, different `MCUCR`/`GICR`
  bit settings) instead of `INT1`.

## Techniques Used
- Stack pointer initialization (`SPL`/`SPH`) required before using interrupts
- `.org` directives to place the reset vector and interrupt vectors at their
  correct fixed addresses
- `MCUCR` to configure edge/level sensing and `GICR` to enable the specific
  external interrupt
- `SEI` to enable global interrupts, with the main loop simply idling
  (`rjmp` to itself) while waiting for the interrupt
- ISR structure: save `SREG`/working registers on entry (`PUSH`), blink LED
  10 times via a counted delay loop, restore registers, and `RETI`

## Verification
Both tasks were tested by triggering the external interrupt pin (emulating a
push-button press) and confirming the LED blinks 10 times with a ~50% duty
cycle before returning to idle (see report for demo video links).
