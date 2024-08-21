section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global ft_write

ft_write:
    mov rcx, rsi
    mov rdx, rdx

    mov rbx, 1
    mov rax, 4
    int 0x80

    mov rax, rdx
    ret