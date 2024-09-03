section .text

global _ft_write
extern __errno_location

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

    test rax, rax           ; test rax 
    js _return              ; jump if rax is negative number

    ret

_return:
    neg rax                 ; make negative number to positive 
    mov rdi, rax            ; for errno assign
    call __errno_location   ; get the address of errno
    mov [rax], rdi          ; store rdi (rax) into errno

    mov rax, -1             ; return -1
    ret