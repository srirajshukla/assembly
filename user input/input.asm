section .data
    userName db "What is your name?"
    helloWord db "Hello, "

section .bss
    name resb 16

section .text
    global _start

_start:
    call _askForName
    call _getName
    call _printHello
    call _printName

    ; doing the same thing, but using one subroutine to do all those tasks
    mov r14, userName
    mov r15, 18
    call _genericPrint
    call _getName
    mov r14, helloWord
    mov r15, 7
    call _genericPrint
    mov r14, name
    mov r15, 16
    call _genericPrint

    ; sys_exit(0)
    mov rax, 60
    mov rdi, 0
    syscall

_genericPrint:
    ; assumes you've buffer in r14 register and length in r15 register
    mov rax, 1
    mov rdi, 1
    mov rsi, r14
    mov rdx, r15
    syscall
    ret


_askForName:
    mov rax, 1
    mov rdi, 1
    mov rsi, userName
    mov rdx, 18
    syscall
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_printHello:
    mov rax, 1
    mov rdi, 1
    mov rsi, helloWord
    mov rdx, 7
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret
