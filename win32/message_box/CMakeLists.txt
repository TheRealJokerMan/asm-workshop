#
# Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
#
# SPDX-License-Identifier: MIT.
#

# Override the NASM link flags.
set(CMAKE_NASM_LINK_EXECUTABLE "link <OBJECTS> <LINK_FLAGS> /ENTRY:WinMain /SUBSYSTEM:WINDOWS /LARGEADDRESSAWARE:NO /DYNAMICBASE:NO /OUT:<TARGET> <LINK_LIBRARIES>")

# Define the target.
add_executable(win32-message-box
    "main.asm"
)

# Set the linker language.
set_target_properties(win32-message-box
    PROPERTIES
        LINKER_LANGUAGE NASM
)

# Set the target's dependencies.
target_link_libraries(win32-message-box
    PRIVATE
        Kernel32
        User32
)
