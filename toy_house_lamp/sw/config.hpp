#pragma once
#include <inttypes.h>

// units commonly used
#define KHz   1000L
#define MHz   (1000L*KHz)

// quarc frequency in [Hz]
#define F_CPU (1L*MHz)

static constexpr uint8_t  c_cycle_ms{10};
static constexpr uint8_t  c_gamma_steps{20};
static constexpr uint16_t c_fade_time_ms{1500};
