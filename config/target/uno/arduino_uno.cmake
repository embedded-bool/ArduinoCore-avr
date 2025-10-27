
if(${BOARD_VARIANT} STREQUAL "UNO")

    set(ARDUINO_DEFINES
            "ARDUINO=10810"
            "ARDUINO_AVR_UNO"
            "ARDUINO_ARCH_AVR"
            CACHE INTERNAL "Arduino Uno compile defines"
    )

endif ()