#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

# Include the required modules.
include("FetchContent")

# Catch2 unit-testing framework.
if(NOT TARGET Catch2::Catch2WithMain)
    FetchContent_Declare(Catch GIT_REPOSITORY "https://github.com/catchorg/Catch2.git" GIT_TAG "v3.1.1")
    FetchContent_MakeAvailable(Catch)
    list(APPEND CMAKE_MODULE_PATH "${catch_SOURCE_DIR}/extras")
endif(NOT TARGET Catch2::Catch2WithMain)
