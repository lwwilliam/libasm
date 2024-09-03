section .text

global _ft_read
extern __errno_location

%ifdef __APPLE__
%define SYS_READ 0x2000003  ; syscall number for write in macOS
%else
%define SYS_READ 0          ; syscall number for write in Linux
%endif

_ft_read:
    mov rax, SYS_READ       ; syscall number for sys_read
    mov rbx, rdi            ; rbx = fd
    mov rcx, rsi            ; rcx = buffer
    mov rdx, rdx            ; rdx = len

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
