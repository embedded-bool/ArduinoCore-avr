set(ARDUINO_WIRE "arduino_wire")

add_library(${ARDUINO_WIRE} INTERFACE)
target_sources(${ARDUINO_WIRE} INTERFACE
        src/Wire.cpp
        src/utility/twi.c
        INTERFACE FILE_SET wire_headers TYPE HEADERS
        BASE_DIRS inc
)
add_library(Arduino::Wire ALIAS ${ARDUINO_WIRE})
