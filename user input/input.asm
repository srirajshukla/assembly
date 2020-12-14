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

    ; sys_exit(0)
    mov rax, 60
    mov rdi, 0
    syscall


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
