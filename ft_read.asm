section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global ft_read

ft_read:
	mov rax, 0		; syscall number for sys_read
	mov rbx, rdi	; rbx = fd
	mov rcx, rsi	; rcx = buffer
	mov rdx, rdx	; rdx = len

    syscall         ; call kernel

	ret
