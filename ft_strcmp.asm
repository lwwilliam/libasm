;section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global _ft_strcmp

_ft_strcmp:
    mov     al, [rdi]       ; assign s1 byte into al
    sub     al, [rsi]       ; subtract s1 with s2

    ; Check if both rdi and rsi are null
    cmp     byte [rdi], 0x00; Compare the byte pointed to by rdi with 0
    jne     _ft_strcmp_loop  ; if not null continue
    cmp     byte [rsi], 0x00; Compare the byte pointed to by rsi with 0
    jne     _ft_strcmp_loop  ; if not null continue
    jmp     _ft_strcmp_end   ; if both is null it will end

_ft_strcmp_loop:
    cmp     al, 0x00        ; cmp res with 0
    jne     _ft_strcmp_end   ; jump when not equal to 0

    inc     rdi             ; increment s1
    inc     rsi             ; increment s2
    jmp     _ft_strcmp       ; jump back to the loop

_ft_strcmp_end:
    movsx     rax, al       ; mov al res to rax
    ret