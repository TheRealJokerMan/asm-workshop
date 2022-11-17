#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

if(NOT BUILD_TESTING)
    return()
endif(NOT BUILD_TESTING)

# Include the required modules.
include("Catch")
include("CTest")

# Define the target.
add_executable(asm-library-tests
    "factorial.cxx" 
    "sum.cxx"
)

# Set required properties.
set_target_properties(asm-library-tests
    PROPERTIES
        C_VISIBILITY_PRESET hidden
        CXX_VISIBILITY_PRESET hidden
        POSITION_INDEPENDENT_CODE ON
        VISIBILITY_INLINES_HIDDEN ON
)

# Set the C++ standard version.
target_compile_features(asm-library-tests PRIVATE cxx_std_20)

# Set warnings as errors.
target_compile_options(asm-library-tests
    PRIVATE
        $<$<COMPILE_LANGUAGE:CXX>:$<$<CXX_COMPILER_ID:AppleClang,Clang,GNU>:-Werror -Wall>>
        $<$<COMPILE_LANGUAGE:CXX>:$<$<CXX_COMPILER_ID:MSVC>:/WX /W4>>
)

# Set the target's dependencies.
target_link_libraries(asm-library-tests
    PRIVATE
        Asm::Library
        Catch2::Catch2WithMain
)

# Discover the tests.
catch_discover_tests(asm-library-tests)
