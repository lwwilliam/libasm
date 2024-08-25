section .text

global _ft_strlen

_ft_strlen:
    xor     rcx, rcx        ; clear rcx that is used in length count

_ft_strlen_loop:
    mov     al, [rdi]       ; assign byte into al
    cmp     al, 0x00        ; compare byte to null
    je      _ft_strlen_end   ; jump if condition is met

    inc     rdi             ; increment the byte
    inc     rcx             ; inc the count
    jmp     _ft_strlen_loop  ; jump back to the loop becuase null byte not found

_ft_strlen_end:
    mov rax, rcx            ; move the rcx to rax
    ret
