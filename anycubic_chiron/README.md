# anycubic chiron

configuration of the 3D printer in use.
parameters of the printer:

* print area size: 40x40x45[cm]
* nozzle diameter: 0.4[mm]
* print speed: 20-100[mm/s]
* travel speed: 60[mm/s]
* print accuracy: 0.05-0.3mm
* maximum bed temperature: 100[C]
* maximum nozzle temperature: 260[C]
* power: 600[W]
* weight: 20[kg]


## supported materials
* PLA
* ABS
* HIPS
* Wood
* TPU


## calibration & setup
a set of hints for calibration and fine-tuning of the printer.
this section is mostly dedicated for future-me, so i don't have to re-discover these things again.
you're free to disagree and/or ignore this section.


### head + hotend
a good tutorial on how to do this properly:
https://e3d-online.dozuki.com/Guide/V6+Assembly/6


### bed leveling and setup
check out manual and both manual (coarse-grained) and automated (fine-grained) procedures.
after SW configuration update, results are just great! :)

page of regular printer paper is almost exactly 0.1mm thick.
it's great tool for checking distance between nozzle and bed.

when leveling bed, keep in mind that nozzle after "auto homing" is at h=0.0mm
while print starts at 1st layer height (eg. 0.2mm).

bed must be leveled so that height of nozzle above it is equal throughout the table.
once this is done use "advanced" menu to mark points that are higher/lower than that, to compensate for bed imperfections.


### slicer configuration
use extrusion multiplier to ensure proper amount of filament is out.
choose amount, that is slightly above the point, where layer is not 100% full.

1st layer extrusion width should be done at 100%.
if more is needed, then either bed is not sticky enough or nozzle too far from bed.


### misc hints
* layer height max at 1/2 nozzle diameter... 3/4 tops.
* extrusion width roughly equal to nozzle diameter (can be a bit bigger)
* 1.75mm PLN is 1[g] per 41[cm] length (362.6[g] used 148.8[m] of filament)
* real print time is approximately 151% of g-code based time (measured with `gcoder`)
* keep constant temperature in the room when printing - and make it warm/hot:
  * close windows
  * consider turning up heating
  * turn off A/C unit
  * make sure there are no (especially cold!) air blows no the heatbed
