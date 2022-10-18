.SECONDARY:

ifeq ($(VERBOSE),1)
SILENT:=
else
SILENT:=@
endif

PCB:=$(wildcard *.kicad_pcb) # expected to be 1 file
OUT_DIR:=build
GERBER_DIR:=$(OUT_DIR)/gerber


.PHONY: all
all: gerber
all: stl
all: bom


.PHONY: gerber
gerber: $(GERBER_DIR).tar.gz
gerber: $(GERBER_DIR).zip

$(GERBER_DIR).tar.gz: Makefile
$(GERBER_DIR).tar.gz: $(GERBER_DIR)/version.txt
	$(SILENT)echo "GERBER $(GERBER_DIR).tar.gz"
	$(SILENT)cd "$(dir $@)" && fakeroot tar czf "$(notdir $@)" "gerber/"

$(GERBER_DIR).zip: Makefile
$(GERBER_DIR).zip: $(GERBER_DIR)/version.txt
	$(SILENT)echo "GERBER $(GERBER_DIR).zip"
	$(SILENT)cd "$(dir $@)" && fakeroot zip -r -q "$(notdir $@)" "gerber/"

$(GERBER_DIR)/version.txt: Makefile
$(GERBER_DIR)/version.txt: /usr/local/bin/generate_gerber
$(GERBER_DIR)/version.txt: $(PCB)
	$(SILENT)echo "GERBER $(GERBER_DIR)"
	$(SILENT)mkdir -p "$(GERBER_DIR)"
	$(SILENT)generate_gerber "$<" "$(GERBER_DIR)"
	$(SILENT)md5sum "$<" > "$(GERBER_DIR)/version.txt"


.PHONY: stl
stl: $(OUT_DIR)/pcb.stl

$(OUT_DIR)/pcb.stl: Makefile
$(OUT_DIR)/pcb.stl: /usr/local/bin/generate_stl
$(OUT_DIR)/pcb.stl: /usr/local/bin/step2stl
$(OUT_DIR)/pcb.stl: $(PCB)
	$(SILENT)echo "STL $<"
	$(SILENT)mkdir -p "$(OUT_DIR)"
	$(SILENT)generate_stl "$<" "$@"


.PHONY: bom
bom: $(OUT_DIR)/bom.csv

$(OUT_DIR)/bom.csv: Makefile
$(OUT_DIR)/bom.csv: /usr/local/bin/generate_bom
$(OUT_DIR)/bom.csv: $(PCB)
	$(SILENT)echo "BOM $<"
	$(SILENT)mkdir -p "$(OUT_DIR)"
	$(SILENT)generate_bom "$<" "$@"


.PHONY: clean
clean:
	rm -rfv build/
