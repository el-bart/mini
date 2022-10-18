ifeq ($(VERBOSE),1)
SILENT:=
else
SILENT:=@
endif

.PHONY: all
all: sw hw


.PHONY: sw hw
sw hw: Makefile
	$(SILENT)cd "$@" && ./make "-j$$(nproc)"

.PHONY: clean
clean:
	$(SILENT)+$(MAKE) -C "sw" clean
	$(SILENT)+$(MAKE) -C "hw" clean
