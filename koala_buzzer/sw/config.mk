# name of the application
export PROGRAM_NAME:=buzzer

# default toolchain - can be changed with 'make TC=xxx'
export TC:=avr

# toolchain
ifeq ($(TC),gcc)
export CC :=gcc
export CXX:=g++
export LD :=$(CXX)
else
ifeq ($(TC),avr)
# tools
export CC :=avr-gcc
export CXX:=avr-g++
export OBJCOPY:=avr-objcopy
export LD :=$(CC)
# tools settings (see http://www.engbedded.com/fusecalc) - empty means do not program fuse bits
# be careful here - ISP must run _slower_ than uC... and that's not true for small kHz...
# https://www.logikdev.com/2011/02/15/reset-clock-fuse-bits-on-avr/
#export LFUSE:=
#export HFUSE:=
export LFUSE:=0x6A
export HFUSE:=0xFF
# type of MCU for the avrdude programmer
export MCU_PROG_TYPE:=attiny13
# mype of MCU for the compiler
export MCU_TYPE:=attiny13
export CFLAGS  +=-mmcu=$(MCU_TYPE)
export CXXFLAGS+=-mmcu=$(MCU_TYPE)
export LDFLAGS +=-mmcu=$(MCU_TYPE)
else
$(error UNKNWON TOOLCHAIN '$(TC)'; USE 'gcc' (i.e. local) or 'avr')
endif # TC=avr
endif # TC=gcc

# extra flags, if needed
export CFLAGS  +=-std=c11
export CXXFLAGS+=-std=c++11
export LDFLAGS +=

# default target
export DEFAULT_TARGET:=release
