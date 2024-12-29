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
