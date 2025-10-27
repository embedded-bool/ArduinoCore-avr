if(${BOARD_VARIANT} STREQUAL "LEONARDO")

    set(ARDUINO_DEFINES
            "ARDUINO=10810"
            "ARDUINO_AVR_LEONARDO"
            "ARDUINO_ARCH_AVR"
            CACHE INTERNAL "Arduino Leonardo compile defines"
    )

endif ()