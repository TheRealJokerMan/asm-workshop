#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

# Default to C++ 20. NB: This isn't strictly required as its set per target.
set(CMAKE_CXX_STANDARD 20)

if(WIN32)
    # Workaround for a bug in CMake, where a static library of ASM sources expects an "cr" input file,
    # under MSVC, see https://discourse.cmake.org/t/building-lib-file-from-asm-cmake-bug/1959.
    if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(CMAKE_ASM_NASM_CREATE_STATIC_LIBRARY "<CMAKE_AR> /OUT:<TARGET> <LINK_FLAGS> <OBJECTS>")
    endif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
endif(WIN32)
