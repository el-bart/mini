# locomotive 742

from [printables](https://www.printables.com/model/5478-locomotive-742-h0/files).

rework to facilitate 5x 0.5V photovoltanic panels and a DC/DC to keep the LEDs on.
also added some model simplifications for easier FDM 3D printing.


## power budget

while thing is meant to be running from 1S LiPo cell.

5x0.5V@0.16W PV panels will deliver top current of 64mA.
taking into consideration imperfect lightning conditions, will assume 30mA from now on.
assuming 50% of that time is night, that gives 15mA continuous power that can be used.

DC/DC will typically get 2-2.5V on input.
is to be set to 4.1V on output - i.e. 1S at 90% charge.
taking into consideration low power-output (64mA peak input; half od that output) no additional circuitry
for charge control is needed.


## LEDs

* 4x 5mm red LEDs (rear)
 * 2x 2 LED in sequence, with 2.4k resistor
 * params:
   * 1mA @ 4.1V
   * 0.9mA @ 3.7V
   * LED voltage: 1.78V
* 2x 5mm blue LEDs (interior)
  * 2 LEDs in parallel, sharing 5.6k resistor
  * params:
    * 0.3mA @ 4.1V
    * 0.2mA @ 3.7V
    * LED voltage: 2.5V
* 1x 5mm white LED (front)
  * in sequence with 820 resistor
  * params:
    * 1.9mA @ 4.1V
    * 1.4mA @ 3.7V
    * LED voltage: 2.65V

total current drawage at 4.1V: 4.5mA.
