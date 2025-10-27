set(ARDUINO_HID "arduino_hid")

add_library(${ARDUINO_HID} INTERFACE)
target_sources(${ARDUINO_HID} INTERFACE
        src/HID.cpp
        INTERFACE hid_header TYPE HEADERS
        BASE_DIRS inc
)
add_library(Arduino::HID ALIAS ${ARDUINO_HID})
