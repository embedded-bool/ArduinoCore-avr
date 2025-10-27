
function(arduino_core_init BOARD)
    string(TOUPPER ${BOARD} VARIANT)
    set(BOARD_VARIANT ${VARIANT} CACHE STRING "Board variant name.")

    if(BOARD STREQUAL "UNO" OR BOARD STREQUAL "MICRO" OR BOARD STREQUAL "MEGA" OR BOARD STREQUAL "LEONARDO")
        add_subdirectory(config)
        add_subdirectory(variants)
        add_subdirectory(libraries)
        add_subdirectory(cores)
    else ()
        message(FATAL_ERROR "Unknown or Unsupported Board variant := ${BOARD}")
    endif ()

endfunction()