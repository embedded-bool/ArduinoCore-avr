# Sets the compiler options for Arduino AVR Boards.
set(ARDUINO_ASM_COMPILER_OPTIONS
        -c
        -g
        -x assembler-with-cpp
        -flto
        -MMD
        CACHE INTERNAL "Default ASM compiler options."
)
set(ARDUINO_C_COMPILER_OPTIONS
        -c -g
        -ffunction-sections
        -fdata-sections
        -MMD
        -flto
        -fno-fat-lto-objects
        CACHE INTERNAL "Default C compiler options."
)
set(ARDUINO_CXX_COMPILER_OPTIONS
        -fpermissive
        -fno-exceptions
        -ffunction-sections
        -fdata-sections
        -fno-threadsafe-statics
        -Wno-error=narrowing -MMD -flto
        CACHE INTERNAL "Default C++ compiler options."
)
