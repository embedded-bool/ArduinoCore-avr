if(${BOARD_VARIANT} STREQUAL "MICRO")

    set(ARDUINO_DEFINES
            "ARDUINO=10810"
            "ARDUINO_AVR_MICRO"
            "ARDUINO_ARCH_AVR"
            "USB_VID=0x2341"
            "USB_PID=0x8037"
            CACHE INTERNAL "Arduino Micro compile defines"
    )

endif ()