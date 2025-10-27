set(ARDUINO_SFT_SERIAL "arduino_sft_serial")

add_library(${ARDUINO_SFT_SERIAL} INTERFACE)
target_sources(${ARDUINO_SFT_SERIAL} INTERFACE
        src/SoftwareSerial.cpp
        INTERFACE FILE_SET soft_serial_header TYPE HEADERS
        BASE_DIRS inc
)
add_library(Arduino::SoftSerial ALIAS ${ARDUINO_SFT_SERIAL})
