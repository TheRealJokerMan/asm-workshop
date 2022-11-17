;
; This is based on https://cs.lmu.edu/~ray/notes/nasmtutorial/.
;

bits 64                                                         ; 64-bit mode.

global al_factorial                                             ; Export the function.

section .text                                                   ; This is the code section.
    %ifdef _WIN32
        %define ARG rcx                                         ; On the Win32 platform, the first argument to a function is passed in rcx.
    %else
        %define ARG rdi                                         ; On posix platforms, the first argument to a function is passed in rdi.
    %endif

    ; Obtain the product of all positive integers less than
    ; or equal to a value.
    al_factorial:
        cmp     ARG, 1                                          ; Is n <= 1?
        jnbe    inner                                           ; If it is not, perform a recursive call.
        mov     rax, 1                                          ; Otherwise, return 1.
        ret
    inner:
        push    ARG                                             ; Save n on stack.
        dec     ARG                                             ; Subtrace one from n.
        call    al_factorial                                    ; Call factorial(n - 1), storing the result in %rax.
        pop     ARG                                             ; Restore n.
        imul    rax, ARG                                        ; Multiply n by factorial(n - 1), storing the result in %rax.
        ret
