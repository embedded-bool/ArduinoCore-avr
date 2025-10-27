set(ARDUINO_SPI "arduino_spi")

add_library(${ARDUINO_SPI} INTERFACE)
target_sources(${ARDUINO_SPI} INTERFACE
        src/SPI.cpp
        INTERFACE FILE_SET spi_headers TYPE HEADERS
        BASE_DIRS inc
)
add_library(Arduino::SPI ALIAS ${ARDUINO_SPI})
