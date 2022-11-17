#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

# Define the target.
add_library(asm-library
    "factorial.asm"
    "sum.asm"
)

# Set required properties.
set_target_properties(asm-library
    PROPERTIES
        C_VISIBILITY_PRESET hidden
        CXX_VISIBILITY_PRESET hidden
        POSITION_INDEPENDENT_CODE ON
        VISIBILITY_INLINES_HIDDEN ON
)

 # Set the compile definitions.
target_compile_definitions(asm-library
    PRIVATE
        $<$<PLATFORM_ID:Windows>:_WIN32>
)

# Set the C++ standard version.
target_compile_features(asm-library PRIVATE cxx_std_20)

# Set warnings as errors.
target_compile_options(asm-library
    PRIVATE
        $<$<COMPILE_LANGUAGE:CXX>:$<$<CXX_COMPILER_ID:AppleClang,Clang,GNU>:-Werror -Wall>>
        $<$<COMPILE_LANGUAGE:CXX>:$<$<CXX_COMPILER_ID:MSVC>:/WX /W4>>
)

# Set the target's include directories.
target_include_directories(asm-library
    PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}/.."
)

# Add a convenience alias.
add_library(Asm::Library ALIAS asm-library)
