set(ARDUINO_EEPROM "arduino_eeprom")

add_library(${ARDUINO_EEPROM} INTERFACE)
target_sources(${ARDUINO_EEPROM} INTERFACE
        FILE_SET eeprom_header TYPE HEADERS
        BASE_DIRS inc
)
add_library(Arduino::EEPROM ALIAS ${ARDUINO_EEPROM})
