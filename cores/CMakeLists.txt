set(API_CORE "arduino-core-api-avr")

# Get target board from Core::PinHeader library.
get_target_property(TARGET_BOARD Core::PinHeader TARGET_BOARD)

set(BASE_CORE_SOURCE_FILES
        arduino/Arduino.h
        arduino/wiring.c
        arduino/wiring_analog.c
        arduino/wiring_digital.c
        arduino/wiring_pulse.c
        arduino/wiring_shift.c
        arduino/WInterrupts.c
        arduino/WMath.cpp
        arduino/WString.cpp
        arduino/abi.cpp
        arduino/new.cpp
)

set(SERIAL_IO_SOURCE_FILES
        arduino/HardwareSerial.cpp
        arduino/HardwareSerial0.cpp
        arduino/Stream.cpp
        arduino/Stream.cpp
        arduino/Print.cpp
)

message(DEBUG "TARGET_BOARD := ${TARGET_BOARD}")

if(${TARGET_BOARD} STREQUAL "mega")
    list(APPEND SERIAL_IO_SOURCE_FILES
            arduino/HardwareSerial1.cpp
            arduino/HardwareSerial2.cpp
            arduino/HardwareSerial3.cpp
    )
elseif (${TARGET_BOARD} STREQUAL "micro" OR ${TARGET_BOARD} STREQUAL "leonardo")
    list(APPEND SERIAL_IO_SOURCE_FILES
            arduino/USBCore.cpp
            arduino/CDC.cpp
            arduino/PluggableUSB.cpp
    )
endif ()

add_library(${API_CORE})
target_sources(${API_CORE}
        PUBLIC # Source Files
            ${BASE_CORE_SOURCE_FILES}
            ${SERIAL_IO_SOURCE_FILES}
        PUBLIC FILE_SET arduino_api_headers TYPE HEADERS
            BASE_DIRS arduino
)

# Compiler Definitions
get_target_property(F_CPU Core::PinHeader TARGET_FREQ)
target_compile_definitions(${API_CORE} PUBLIC
        "F_CPU=${F_CPU}"
        ${ARDUINO_DEFINES}
)

target_link_libraries(${API_CORE} PUBLIC
        Core::PinHeader
)

# Compiler Options
get_target_property(MMCU Core::PinHeader TARGET_MCU)    # Property holds MCU type string for compiler.
target_compile_options(${API_CORE} PUBLIC
        "-mmcu=${MMCU}"
        $<$<COMPILE_LANGUAGE:ASM>:${ARDUINO_ASM_COMPILER_OPTIONS}>
        $<$<COMPILE_LANGUAGE:C>:${ARDUINO_C_COMPILER_OPTIONS}>
        $<$<COMPILE_LANGUAGE:CXX>:${ARDUINO_CXX_COMPILER_OPTIONS}>
)

# This library was build for C++ 11 and no greater.
set_target_properties(${API_CORE} PROPERTIES CXX_STANDARD 11)
set_target_properties(${API_CORE} PROPERTIES CXX_STANDARD_REQUIRED ON)

add_library(Arduino::CoreAPI ALIAS ${API_CORE})
