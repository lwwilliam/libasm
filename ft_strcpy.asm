section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global ft_strcpy

ft_strcpy:
    xor     rcx, rcx        ; clear rcx used in byte count 

ft_strcpy_loop:
    mov     al, [rsi + rcx] ; copy rsi[x] into al
    mov     [rdi + rcx], al ; copy al into rdi[x]
    cmp     al, 0x00        ; compare byte to null
    je      ft_strcpy_end   ; jump if condition met

    inc     rcx             ; increment rcx for next byte
    jmp     ft_strcpy_loop  ; jmp back to the loop

ft_strcpy_end:
    mov rax, rdi            ; move rdi to rax
    ret