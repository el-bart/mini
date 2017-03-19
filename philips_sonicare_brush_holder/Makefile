.SECONDARY:

SCADS  := brush_holder.scad
STLS   := $(wildcard *.stl) $(SCADS:.scad=.stl)
GCODES := $(STLS:.stl=.gcode)

.PHONY: all
all: $(GCODES)

$(STLS) $(SCADS) $(GCODES): Makefile config-pla-coarse.ini

%.gcode: %.stl
	slic3r --load config-pla-coarse.ini "$<"

%.stl: %.scad
	openscad -o "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(GCODES) $(SCADS:.scad=.stl)
