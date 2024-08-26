section .text

global _ft_read

%ifdef __APPLE__
%define SYS_READ 0x2000003   ; syscall number for write in macOS
%else
%define SYS_READ 0           ; syscall number for write in Linux
%endif

_ft_read:
	mov rax, SYS_READ		; syscall number for sys_read
	mov rbx, rdi			; rbx = fd
	mov rcx, rsi			; rcx = buffer
	mov rdx, rdx			; rdx = len

    syscall         		; call kernel

	ret
