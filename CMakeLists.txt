cmake_minimum_required(VERSION 4.0.0)

project("ArduinoCore API AVR"
        LANGUAGES ASM C CXX
        VERSION 1.0.0
)

if(PROJECT_IS_TOP_LEVEL)
    set(CMAKE_C_STANDARD 11)
    set(CMAKE_CXX_STANDARD 14)
endif ()

# Basic Paths
set(ARDUINO_CORE_API_DIR ${CMAKE_CURRENT_SOURCE_DIR} CACHE INTERNAL "")
set(ARDUINO_BOARD_VARIANT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/variants CACHE INTERNAL "")
set(ARDUINO_CORE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cores/arduino CACHE INTERNAL "")

if(NOT DEFINED BOARD_VARIANT)
    set(BOARD_VARIANT "UNO" CACHE STRING "Default board variant when BOARD_VARIANT variable not defined.")
    message(WARNING "ArduinoCoreAPI-avr board variant not set, defaulting to ${BOARD_VARIANT}")
endif ()

message(STATUS "ArduinoCoreAPI-avr board variant := Arduino ${BOARD_VARIANT}")

add_subdirectory(config)
add_subdirectory(bootloaders)
add_subdirectory(variants)
add_subdirectory(cores)
add_subdirectory(libraries)
