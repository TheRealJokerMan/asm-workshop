#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

# Set the minimum CMake version.
cmake_minimum_required(VERSION 3.22.1 FATAL_ERROR)

# Include the dependent packages.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
include("toolchain-defaults")

# Define the project.
project(AsmWorkshop
    VERSION       0.0.1.0
    DESCRIPTION   "Assembly Workshop"
    HOMEPAGE_URL  "https://jamiekenyon.io"
    LANGUAGES     ASM_NASM CXX
)

# Include helper modules.
include("defaults")
include("options")
include("packages")

# Add the library sources.
add_subdirectory("asm-lib")

# Add the tests.
add_subdirectory("tests")

# Add the platform-specific sources.
add_subdirectory("win32")

# Enable testing.
if(BUILD_TESTING)
    enable_testing()
endif(BUILD_TESTING)
