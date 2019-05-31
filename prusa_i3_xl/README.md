# prusa i3 xl

configuration of the 3D printer in use.
parameters of the printer:

* hotend: j-head E3D V6
* nozzle diameter: 0.4[mm]
* fine-quality travel speeds: 30-70[mm/s]
* maximum bed temperature: 90[C]
* maximum nozzle temperature: 285[C]


## calibration & setup
i've done reconfiguration of the printer at least 3 times, over a long period of time.
i often re-discovered certain practices and/or pitfalls.
this section is mostly dedicated for future-me, so i don't have to re-discover these again.
note that each RepRap is different.
you're free to disagree and/or ignore this section.


### head + hotend
a good tutorial on how to do this properly:
https://e3d-online.dozuki.com/Guide/V6+Assembly/6


### bed leveling and setup
page of regular printer paper is almost exactly 0.1mm thick.
it's great tool for checking distance between nozzle and bed.

when leveling bed, keep in mind that nozzle after "auto homing" is at h=0.0mm
while print starts at 1st layer height (eg. 0.2mm).

bad must be leveled so that height of nozzle above it is equal throughout the table.

glass on bed is probably not as flat as you might think.
in my case it has pits of up to 0.1mm.
good leveling for me was one with piece of paper almost perfectly (i.e. with minimal resistance)
fit between bed and nozzle at h=0.2mm, thus getting around 1.5mm spacing.
this is accounted for a better 1st layer stickiness.

when bed is not flat enough for a given print precision bed heating alone won't do.
this is where thermal adhesive spray comes into play.
DimaFix works like a charm.

keep the amount of DimaFix small.
it is easy to spray too much and then prints do not go off easily, even when bed is cold.
the right amount is around the point when bed's glass is half the way of looking like a fog glass.


### slicer configuration
use extrusion multiplier to ensure proper amount of filament is out.
choose amount, that is slightly above the point, where layer is not 100% full.

1st layer extrusion width should be done at 100%.
if more is needed, then either bed is not sticky enough or nozzle too far from bed.


### misc hints
* layer height at 1/2 nozzle diameter (tops)
* extrusion width roughly equal to nozzle diameter (can be a bit bigger)
