#pragma once

// units commonly used
#define KHz   1000L
#define MHz   (1000L*KHz)

// quarc frequency in [Hz]
#define F_CPU (1L*MHz)

// stepper motor settings
constexpr auto steps_per_turn = 227ul;
constexpr auto steps_per_drive_len = 500ul;
