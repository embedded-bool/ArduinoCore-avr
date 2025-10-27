
function(arduino_core_init BOARD)
    string(TOUPPER ${BOARD} VARIANT)
    set(BOARD_VARIANT ${VARIANT} CACHE STRING "Board variant name.")

    if(NOT VARIANT STREQUAL "UNO" OR
            NOT VARIANT STREQUAL "MICRO" OR
            NOT VARIANT STREQUAL "MEGA" OR
            NOT VARIANT STREQUAL "LEONARDO")
        message(FATAL_ERROR "Unknown or Unsupported ArduinoCoreAPI AVR board variant := ${VARIANT}")
    endif ()

    add_subdirectory(config)
    add_subdirectory(variants)
    add_subdirectory(libraries)
    add_subdirectory(cores)
endfunction()