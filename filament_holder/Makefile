.SECONDARY:

EXTERNAL_SRCS += center.stl
EXTERNAL_SRCS += fork.stl
EXTERNAL_SRCS += holder_bottom.stl
EXTERNAL_SRCS += holder_top.stl
EXTERNAL_GCODES := $(EXTERNAL_SRCS:.stl=.gcode)

SRCS   += fork_mk2.stl
GCODES := $(EXTERNAL_GCODES) $(SRCS:.stl=.gcode)

.PHONY: all
all: $(GCODES)

center.gcode: center.stl Makefile config-pla.ini
	slic3r --load config-pla.ini --scale 10 "$<"

holder_bottom.gcode: holder_bottom.stl Makefile config-pla.ini
	slic3r --load config-pla.ini --scale 10 "$<"

holder_top.gcode: holder_top.stl Makefile config-pla.ini
	slic3r --load config-pla.ini --scale 10 "$<"

fork.gcode: fork.stl Makefile config-pla.ini
	slic3r --load config-pla.ini --scale 10 "$<"


%.gcode: %.stl Makefile config-pla.ini
	slic3r --load config-pla.ini "$<"

%.stl: %.scad Makefile config-pla.ini
	openscad -o "$@" "$<"

.PHONY: clean
clean:
	rm -fv $(GCODES)
