section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global ft_write

ft_write:
    mov rcx, rsi    ; rcx = str
    mov rdx, rdx    ; rdx = len

    mov rbx, rdi    ; rbx = fd
    mov rax, 1      ; syscall number for sys_write
    syscall         ; call kernel

    mov rax, rdx
    ret