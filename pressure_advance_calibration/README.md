# pressure advance test print

good explanation of [calibrating pressure advance](https://www.obico.io/blog/klipper-pressure-advance/).
some more notes on [pressure advance smooth time and troubleshooting](https://clevercreations.org/klipper-pressure-advance-tuning/).


## prodecude (klipper)

* download [square tower](https://www.klipper3d.org/prints/square_tower.stl) test print from [klipper3d](https://www.klipper3d.org)
* adjust profile as per [calibrating pressure advance](https://www.obico.io/blog/klipper-pressure-advance/) (already done here)
* slice calirbation cube
* `SET_VELOCITY_LIMIT SQUARE_CORNER_VELOCITY=1 ACCEL=500`
* `TUNING_TOWER COMMAND=SET_PRESSURE_ADVANCE PARAMETER=ADVANCE START=0 FACTOR=.005`
* print it
* check at which height it's the best
* `pressure_advance = <start> + <measured_height> * <factor>`
* edit `[extruder]` section and set `pressure_advance = <value_calculated_above>`
