.SECONDARY:

SCADS  := multi_junction_box.scad
STLS   := $(SCADS:.scad=.stl)
GCODES := $(STLS:.stl=.gcode)
CONFIG := $(wildcard *.ini)

.PHONY: all
all: $(GCODES)

$(STLS) $(SCADS) $(GCODES): Makefile $(CONFIG)

%.gcode: %.stl
	slic3r --load "$(CONFIG)" "$<"

%.stl: %.scad
	openscad -o "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(GCODES) $(SCADS:.scad=.stl)
