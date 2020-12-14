section .data
    text db "Hello World", 10, 0
    text2 db "hmm", 10, 0


section .text
    global _start


_start:
    mov rax, text
    call _print

    mov rax, 60
    mov rdi, 0
    syscall


;input: rax as pointer to string
;output: print string at rax
_print:
    push rax
    mov rbx, 0

_printerLoop:
    inc rax
    inc rbx
    mov cl, [rax] ; cl is 8bit equivalent of rcx
    cmp cl, 0
    jne _printerLoop

    mov rax, 1 
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret

