
set(BL_OPTIBOOT "optiboot_bootloader")
add_library(${BL_OPTIBOOT})
target_sources(${BL_OPTIBOOT}
        PUBLIC optiboot.c
        PUBLIC FILE_SET optiboot_headers TYPE HEADERS
        FILE_SET
            boot.h
            pin_defs.h
            stk500.h
)

function(make_optiboot TARGET)

endfunction()
