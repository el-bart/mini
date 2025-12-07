# name of the application
export PROGRAM_NAME:=lemurs_bobik

# toolchain
export CC :=avr-gcc
export CXX:=avr-g++
export OBJCOPY:=avr-objcopy
export LD :=$(CC)

# tools settings
export MCU_TYPE:=attiny2313

# extra flags, if needed
export CFLAGS  +=-mmcu=$(MCU_TYPE)
export CXXFLAGS+=-mmcu=$(MCU_TYPE) -std=c++14
export LDFLAGS +=-mmcu=$(MCU_TYPE)
