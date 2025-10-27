if(${BOARD_VARIANT} STREQUAL "MEGA")

    set(ARDUINO_DEFINES
            "ARDUINO=10810"
            "ARDUINO_AVR_MEGA2560"
            "ARDUINO_ARCH_AVR"
            CACHE INTERNAL "Arduino Mega compile defines"
    )

endif ()