section .text

global _ft_write

%ifdef __APPLE__
%define SYS_WRITE 0x2000004   ; syscall number for write in macOS
%else
%define SYS_WRITE 1           ; syscall number for write in Linux
%endif

_ft_write:
    mov rcx, rsi            ; rcx = str
    mov rdx, rdx            ; rdx = len

    mov rbx, rdi            ; rbx = fd
    mov rax, SYS_WRITE      ; syscall number for sys_write
    syscall                 ; call kernel

    mov rdx, rax            ; return value of sys_write
    ret