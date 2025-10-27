if(${BOARD_VARIANT} STREQUAL "LEONARDO")

    set(ARDUINO_DEFINES
            "ARDUINO=10810"
            "ARDUINO_AVR_LEONARDO"
            "ARDUINO_ARCH_AVR"
            "USB_VID=0x2341"
            "USB_PID=0x8036"
            CACHE INTERNAL "Arduino Leonardo compile defines"
    )

endif ()