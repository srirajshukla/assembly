section .data
    text db "hello, world", 10
    ; db stands for define bytes
    ; 10 is for new line , '\n'
    ; text is the name for the memory location where this db is stored


section .text
    global _start

_start:
    ; we store the syscall id in rax register and arguments in corresponding registers
    mov rax, 1
    ; syscall code for sys_write is 1
    mov rdi, 1
    ; for std_output the code is 1
    mov rsi, text
    ; the buffer location is text
    mov rdx, 14
    ; the length of buffer is 14
    syscall
    ; we call syscall with rax rdi rsi rdx i.e. 
    ; sys_write to std_output buffer at `text` of length 14

    mov rax, 60
    ; 60 is code for sys_exit
    mov rdi, 0
    ; 0 is the return code
    syscall
    ; sys_exit(0)

    ; registers are part of processor that temporarily holds memory