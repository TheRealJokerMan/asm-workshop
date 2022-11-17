#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

# Add the platform-specific sources.
if(WIN32)
    add_subdirectory("message_box")
endif(WIN32)
