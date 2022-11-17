#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

# Set the minimum MacOS version.
set(CMAKE_OSX_DEPLOYMENT_TARGET "12" CACHE STRING "Minimum OS X deployment version")

if(WIN32)
    # Workaround for CMake not setting 64-bit mode.
    set(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
elseif(APPLE)
    # Workaround for CMake not setting 64-bit mode.
    set(CMAKE_ASM_NASM_OBJECT_FORMAT macho64)

    # Workaround for OSX not prefixing underscores.
    string(APPEND CMAKE_ASM_NASM_FLAGS "--prefix _")	
else()
    # Workaround for CMake not setting 64-bit mode.
    set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
endif(WIN32)
