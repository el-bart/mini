cmake_minimum_required(VERSION 3.20)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

if (DEFINED ENV{PICO_SDK_PATH})
  set(PICO_SDK_PATH "$ENV{PICO_SDK_PATH}")
else()
  set(PICO_SDK_PATH "/opt/pico/pico-sdk")
endif()

set(PICO_BOARD pico_w CACHE STRING "Board type")

include("${PICO_SDK_PATH}/external/pico_sdk_import.cmake")

if (PICO_SDK_VERSION_STRING VERSION_LESS "2.1.1")
  message(FATAL_ERROR "Raspberry Pi Pico SDK version 2.1.1 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

project(main C CXX ASM)

pico_sdk_init()

add_executable(main main.cpp)
target_link_libraries(main pico_stdlib)
# create map/bin/hex/uf2 file etc.
pico_add_extra_outputs(main)

pico_enable_stdio_uart(main 1)
pico_enable_stdio_usb (main 0)
