# toy railway barrier

simple toy for controling toy railway barrier with a button (up / down).

based on arduino nano board.

## wiring

servo shall be connected to pin 2.
+5V can be taken directly from the board.

monostable button shall be connected to pin 3.
it does not matter if button is normally open or closed - sw will handle both.
remember to add ~10k Ohm resistor from pin 3 to power line, so that button's state is stable.
