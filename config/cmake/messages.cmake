set(SDK_DEBUG_LEVEL 0)
set(SDK_DEBUG_NONE 10)

function(sdk_message MODE MESSAGE LEVEL)
    set(SINGLE_ARGS TABS)
    cmake_parse_arguments(PARSE_ARGV 3 ARG "" "${SINGLE_ARGS}" "")

    if(${LEVEL} LESS_EQUAL ${SDK_DEBUG_LEVEL})
        if(NOT DEFINED ARG_TABS)
            set(ARG_TABS 0)
        endif ()

        string(REPEAT "\t" ${ARG_TABS} INDENT)

        message(${MODE} "${INDENT}${MESSAGE}")
    endif ()
endfunction()

function(message_list MODE LIST)
    set(SINGLE_ARGS TABS)
    cmake_parse_arguments(PARSE_ARGV 2 ARG "" "${SINGLE_ARGS}" "")

    if(NOT DEFINED ARG_TABS)
        set(ARG_TABS 0)
    endif ()

    string(REPEAT "\t" ${ARG_TABS} INDENT)

    sdk_message(STATUS "${CMAKE_CURRENT_FUNCTION}() : Property List length := ${LIST}" ${SDK_DEBUG_NONE})

    foreach (ITEM IN LISTS LIST)
        message(${MODE} "${INDENT}${ITEM}")
    endforeach ()
endfunction()

function(message_property MODE PREFIX TARGET PROPERTY)
    set(OPTIONS NO_SHOW DEBUG HEADER_SET)
    set(SINGLE_ARGS TABS LIST_TABS SET_PROPERTY)
    cmake_parse_arguments(PARSE_ARGV 4 ARG "${OPTIONS}" "${SINGLE_ARGS}" "")

    get_target_property(TARGET_PROPERTY ${TARGET} ${PROPERTY})              # GET TARGET PROPERTIES

    if(NOT DEFINED ARG_TABS)                                                # IF TABS ARGUMENTS NOT DEFINED SET TO ZERO.
        set(ARG_TABS 0)
    endif ()

    string(REPEAT "\t" 1 DEFAULT_INDENT)
    string(REPEAT "\t" ${ARG_TABS} INDENT)                                  # GENERATE NUMBER OF TABS REQUESTED.

    if(NOT "${TARGET_PROPERTY}" STREQUAL "TARGET_PROPERTY-NOTFOUND")        # ONLY DISPLAY PROPERTY INFORMATION IF AVAILABLE
        list(LENGTH TARGET_PROPERTY PROPERTY_LENGTH)

        if(${PROPERTY_LENGTH} GREATER 1)                                    # DISPLAY LIST IF THERE IS MORE THAN ONE ENTRY
            if(NOT DEFINED ARG_LIST_TABS)
                set(ARG_LIST_TABS 2)
            endif ()

            math(EXPR LIST_TABS "${ARG_TABS} + ${ARG_LIST_TABS}")           # LIST INDENT CALCULATIONS
            message(${MODE} "${INDENT}${PREFIX}[${PROPERTY_LENGTH}] :")

            if(${ARG_HEADER_SET})
                foreach (PROPERTY IN LISTS ${TARGET_PROPERTY})
                    get_target_property(SET_FILES ${TARGET} "HEADER_SET_${PROPERTY}")
                    message_list(${MODE} "${SET_FILES}" TABS ${LIST_TABS})
                endforeach ()
            else ()
                message_list(${MODE} "${TARGET_PROPERTY}" TABS ${LIST_TABS})    # DISPLAY LIST
            endif ()
        else ()
            message(${MODE} "${INDENT}${PREFIX} : ${TARGET_PROPERTY}")      # DISPLAY IF THERE IS ONLY ONE PROPERTY VALUE.
            if(${ARG_HEADER_SET})
                get_target_property(SET_FILE ${TARGET} "HEADER_SET_${TARGET_PROPERTY}")
                message(STATUS "${INDENT}${DEFAULT_INDENT}${SET_FILE}")
            endif ()
        endif ()
    else ()
        if(NOT ARG_NO_SHOW)
            message(${MODE} "${INDENT}${PREFIX} : None")                    # ONLY DISPLAY THIS IF OPTION NO_SHOW IS NOT USED.
        endif ()
    endif ()

    if (ARG_DEBUG)
        message(STATUS "${CMAKE_CURRENT_FUNCTION}() : TARGET NAME := ${TARGET}")
        message(STATUS "${CMAKE_CURRENT_FUNCTION}() : PROPERTY NAME := ${PROPERTY}")
        message(STATUS "${CMAKE_CURRENT_FUNCTION}() : PROPERTY VALUE := ${TARGET_PROPERTY}")
        message(STATUS "${CMAKE_CURRENT_FUNCTION}() : HEADER_SET := ${ARG_HEADER_SET}")
        message(STATUS "${CMAKE_CURRENT_FUNCTION}() : NO_SHOW := ${ARG_NO_SHOW}")
    endif ()

endfunction()

function(target_summary TARGET)
    set(OPTIONS NO_OPTIONS)
    cmake_parse_arguments(PARSE_ARGV 1 ARG "${OPTIONS}" "" "")

    sdk_message(STATUS "${CMAKE_CURRENT_FUNCTION}() : Target Name := ${TARGET}" "${SDK_DEBUG_NONE}")

    get_target_property(TARGET_TYPE ${TARGET} TYPE)

    message(STATUS "")

    if(TARGET_TYPE STREQUAL "EXECUTABLE")
        message(STATUS "Executable name := ${TARGET}")
    elseif (TARGET_TYPE STREQUAL "INTERFACE_LIBRARY")
        message(STATUS "Interface library name := ${TARGET}")
        set(LIB_INTERFACE "INTERFACE_")
    else ()
        message(STATUS "Library name := ${TARGET}")
    endif ()

    message_property(STATUS "Include directories" ${TARGET} ${LIB_INTERFACE}INCLUDE_DIRECTORIES TABS 2 NO_SHOW)
    message_property(STATUS "Header sets" ${TARGET} ${LIB_INTERFACE}HEADER_SETS TABS 2 NO_SHOW SHOW_SUB HEADER_SET)
    #    message_property(STATUS "C++ Modules" ${TARGET} ${LIB_INTERFACE}CXX_MODULE_SET TABS 2 NO_SHOW)
    message_property(STATUS "Compiler definitions" ${TARGET} ${LIB_INTERFACE}COMPILE_DEFINITIONS TABS 2 NO_SHOW)
    message_property(STATUS "Source files" ${TARGET} ${LIB_INTERFACE}SOURCES TABS 2 NO_SHOW)
    message_property(STATUS "Linked libraries" ${TARGET} ${LIB_INTERFACE}LINK_LIBRARIES TABS 2 NO_SHOW)

    if(NOT ARG_NO_OPTIONS)
        message_property(STATUS "Compiler options" ${TARGET} ${LIB_INTERFACE}COMPILE_OPTIONS TABS 2 NO_SHOW)
        message_property(STATUS "Linker options" ${TARGET} ${LIB_INTERFACE}LINK_OPTIONS TABS 2 NO_SHOW)
    endif ()

    message(STATUS "")
endfunction()

function(show_compiler_flags)
    set(OPTIONS CXX C ASM)
    set(SINGLE_ARGS TABS)
    cmake_parse_arguments(PARSE_ARGV 0 ARG "${OPTIONS}" "${SINGLE_ARGS}" "")

    if(NOT DEFINED ARG_TABS)
        set(ARG_TABS 2)
    endif ()

    string(REPEAT "\t" ${ARG_TABS} INDENT)

    message(STATUS "Global Compiler flags:")
    if(ARG_CXX)
        message(STATUS "${INDENT}CXX:=${CMAKE_CXX_FLAGS}")
    endif ()

    if(ARG_C)
        message(STATUS "${INDENT}C:=${CMAKE_C_FLAGS}")
    endif ()

    if(ARG_ASM)
        message(STATUS "${INDENT}ASM:=${CMAKE_ASM_FLAGS}")
    endif ()

endfunction()