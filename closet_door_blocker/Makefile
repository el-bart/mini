.SECONDARY:

SCADS  := $(wildcard *.scad)
STLS   := $(wildcard *.stl) $(SCADS:.scad=.stl)
GCODES := $(STLS:.stl=.gcode)
INI    := $(wildcard *.ini)

.PHONY: all
all: $(GCODES)

$(STLS) $(SCADS) $(GCODES): Makefile $(INI)

%.gcode: %.stl
	slic3r --load "$(INI)" "$<"

%.stl: %.scad
	openscad -o "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(GCODES) $(SCADS:.scad=.stl)
