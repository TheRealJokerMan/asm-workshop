;
; This is based on https://cs.lmu.edu/~ray/notes/nasmtutorial/.
;

bits 64                                                         ; 64-bit mode.

global al_sumd                                                  ; Export the function.

section .text                                                   ; This is the code section.
    %ifdef _WIN32
        %define ARG_1 rcx                                       ; On the Win32 platform, the first argument to a function is passed in rcx.
        %define ARG_2 rdx                                       ; On the Win32 platform, the second argument to a function is passed in rdx.
    %else
        %define ARG_1 rdi                                       ; On posix platforms, the first argument to a function is passed in rdi.
        %define ARG_2 rsi                                       ; On posix platforms, the first argument to a function is passed in rsi.
    %endif

    ; Sum a list of numbers.
    al_sumd:
        xorpd   xmm0, xmm0                                      ; Initialise the sum to 0.
        cmp     ARG_2, 0                                        ; Special case for length of 0.
        je      done
    
    next:
        addsd   xmm0, [ARG_1]                                   ; Add in the current array element.
        add     ARG_1, 8                                        ; Move to next array element.
        dec     ARG_2                                           ; Count down.
        jnz     next                                            ; Continue, if not done counting.
    
    done:
        ret
