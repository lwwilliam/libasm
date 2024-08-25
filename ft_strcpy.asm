;section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global _ft_strcpy

_ft_strcpy:
    xor     rcx, rcx        ; clear rcx used in byte count 

_ft_strcpy_loop:
    mov     al, [rsi + rcx] ; copy rsi[x] into al
    mov     [rdi + rcx], al ; copy al into rdi[x]
    cmp     al, 0x00        ; compare byte to null
    je      _ft_strcpy_end   ; jump if condition met

    inc     rcx             ; increment rcx for next byte
    jmp     _ft_strcpy_loop  ; jmp back to the loop

_ft_strcpy_end:
    mov rax, rdi            ; move rdi to rax
    ret