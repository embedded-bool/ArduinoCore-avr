set(DEFAULT_COMPILER_WARNINGS
        -Wall
        -Wextra                                             # Reasonable and standard
        -Wshadow                                            # Warns the user if a variable declaration shadows one from a parent context
        $<$<COMPILE_LANGUAGE:CXX>:-Wnon-virtual-dtor>       # Warns the user if a class with virtual functions has a non-virtual destructor. This helps catch hard to track down memory errors
        $<$<COMPILE_LANGUAGE:CXX>:-Wold-style-cast>         # Warns for c-style casts
        -Wcast-align                                        # Warns for potential performance problem casts
        -Wunused                                            # Warns on anything being unused
        $<$<COMPILE_LANGUAGE:CXX>:-Woverloaded-virtual>     # Warns if you overload (not override) a virtual function
        -Wpedantic                                          # Warns if non-standard C++ is used
        -Wconversion                                        # Warns on type conversions that may lose data
        -Wsign-conversion                                   # Warns on sign conversions
        -Wnull-dereference                                  # Warns if a null dereference is detected
        -Wdouble-promotion                                  # Warns if float is implicit promoted to double
        -Wformat=2                                          # Warns on security issues around functions that format output (ie printf)
        -Wimplicit-fallthrough                              # Warns on statements that fallthrough without an explicit annotation
        CACHE INTERNAL "Default compiler warnings"
)