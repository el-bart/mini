#pragma once

// units commonly used
#define KHz   1000L
#define MHz   (1000L*KHz)

// quarc frequency in [Hz]
#define F_CPU (1L*MHz)

// stepper motor settings
constexpr auto program_cycle_Hz = 10'000ul;
