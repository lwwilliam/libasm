section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global ft_strlen

ft_strlen:
    xor     rcx, rcx        ; clear rcx that is used in length count

ft_strlen_loop:
    mov     al, [rdi]       ; assign byte into al
    cmp     al, 0x00        ; compare byte to null
    je      ft_strlen_end   ; jump if condition is met

    inc     rdi             ; increment the byte
    inc     rcx             ; inc the count
    jmp     ft_strlen_loop  ; jump back to the loop becuase null byte not found

ft_strlen_end:
    mov rax, rcx            ; move the rcx to rax
    ret
