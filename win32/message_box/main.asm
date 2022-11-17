;
; Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
;
; SPDX-License-Identifier: MIT.
;

bits 64	                                                        ; 64-bit mode.

global WinMain                                                  ; Export the entry point symbol.
extern ExitProcess                                              ; Declare an import external Windows API symbol.
extern MessageBoxA                                              ; Declare an import external Windows API symbol.

%define IDNO          7                                         ; Define symbol from winuser.h.
%define MB_DEFBUTTON1 0                                         ; Define symbol from winuser.h.
%define MB_DEFBUTTON2 100h                                      ; Define symbol from winuser.h.
%define MB_YESNO      4                                         ; Define symbol from winuser.h.


section .data                                                   ; This is the data section.
    TEXT    db "Press YES to terminate.", 0                     ; The message to be displayed.
    CAPTION db "Demo: Call Win32 API from asm!", 0              ; The dialog box title.


section .text                                                   ; This is the code section.
    WinMain:
        sub rsp, 8                                              ; Align the stack to a multiple of 16 bytes.
        sub rsp, 32                                             ; 32 bytes of shadow space.

        .DisplayMessageBox:                                     ; Sub-function to display the message box.
            xor   ecx, ecx                                      ; 1st parameter
            lea   rdx, [rel TEXT]                               ; 2nd parameter
            lea   r8, [rel CAPTION]                             ; 3rd parameter
            mov   r9d, MB_YESNO | MB_DEFBUTTON1                 ; 4th parameter. 2 constants, logically or'd together.
            call  MessageBoxA

        cmp rax, IDNO                                           ; Check the return value for "No"
        je .DisplayMessageBox                                   ; Call the sub-function.

        add rsp, 32                                             ; Remove the 32 bytes

        xor ecx, ecx                                            ; Clear the return code.
        call ExitProcess                                        ; Terminate the process.
