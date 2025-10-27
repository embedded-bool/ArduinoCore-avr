cmake_minimum_required(VERSION 4.0.0)

project("ArduinoCore API AVR"
        LANGUAGES ASM C CXX
        VERSION 1.0.0
)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 14)

add_subdirectory(config)
add_subdirectory(bootloaders)
add_subdirectory(variants)
add_subdirectory(cores)
add_subdirectory(libraries)
