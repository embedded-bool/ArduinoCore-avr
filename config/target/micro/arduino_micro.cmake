if(${BOARD_VARIANT} STREQUAL "MICRO")

    set(ARDUINO_DEFINES
            "ARDUINO=10810"
            "ARDUINO_AVR_MICRO"
            "ARDUINO_ARCH_AVR"
            CACHE INTERNAL "Arduino Micro compile defines"
    )

endif ()