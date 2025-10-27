function(add_variant_lib NAME)
    string(TOLOWER ${NAME} DIR_NAME)
    set(PIN_HEADER "${DIR_NAME}_pin_header")

    set(VARIANT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${NAME}")
    message(DEBUG "variant directory := ${CMAKE_CURRENT_SOURCE_DIR}/${NAME}")

    add_library(${PIN_HEADER} INTERFACE)
    target_sources(${PIN_HEADER}
            INTERFACE FILE_SET pin_header TYPE HEADERS
                BASE_DIRS ${VARIANT_DIR}
#                FILES ${VARIANT_DIR}/pins_arduino.h
    )
    # Set Alias pin header.
    add_library(Core::PinHeader ALIAS ${PIN_HEADER})
endfunction()

string(TOLOWER ${BOARD_VARIANT} BOARD_VAR)

if(${BOARD_VAR} STREQUAL "uno")
    add_variant_lib("standard")
    set_target_properties(standard_pin_header PROPERTIES TARGET_BOARD "uno")
    set_target_properties(standard_pin_header PROPERTIES TARGET_MCU "atmega328p")
    set_target_properties(standard_pin_header PROPERTIES TARGET_FREQ "16000000UL")
elseif(${BOARD_VAR} STREQUAL "micro")
    add_variant_lib("micro")
    set_target_properties(micro_pin_header PROPERTIES TARGET_BOARD "micro")
    set_target_properties(micro_pin_header PROPERTIES TARGET_MCU "atmega32u4")
    set_target_properties(micro_pin_header PROPERTIES TARGET_FREQ "16000000UL")
elseif(${BOARD_VAR} STREQUAL "mega")
    add_variant_lib("mega")
    set_target_properties(mega_pin_header PROPERTIES TARGET_BOARD "mega")
    set_target_properties(mega_pin_header PROPERTIES TARGET_MCU "atmega2560")
    set_target_properties(mega_pin_header PROPERTIES TARGET_FREQ "16000000UL")
elseif(${BOARD_VAR} STREQUAL "leonardo")
    add_variant_lib("leonardo")
    set_target_properties(leonardo_pin_header PROPERTIES TARGET_BOARD "leonardo")
    set_target_properties(leonardo_pin_header PROPERTIES TARGET_MCU "atmega32u4")
    set_target_properties(leonardo_pin_header PROPERTIES TARGET_FREQ "16000000UL")
else ()
    message(FATAL_ERROR "Unknown Arduino Core AVR API board for this fork.")
endif ()
