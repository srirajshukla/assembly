section .data
    databit db "4"
    digit db 0, 10

section .text
    global _start

_start:
    ; mov rax, 1
    ; mov rdi, 1
    ; mov rsi, databit
    ; mov rdx, 1
    ; syscall

    mov rax, 7
    mov rbx, 3
    div rbx
    call _printRAXDigit

    mov rax, 7
    mov rbx, 3
    mul rbx
    call _printRAXDigit

    mov rax, 7
    mov rbx, 1
    add rax, rbx
    add rax, -2
    call _printRAXDigit


    mov rax, 60
    mov rdi, 0
    syscall

_printRAXDigit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret