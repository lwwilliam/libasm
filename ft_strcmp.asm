section .note.GNU-stack noalloc noexec nowrite progbits

section .text

global ft_strcmp

ft_strcmp:
    mov     al, [rdi]       ; assign s1 byte into al
    sub     al, [rsi]       ; subtract s1 with s2

    ; Check if both rdi and rsi are null
    cmp     byte [rdi], 0x00; Compare the byte pointed to by rdi with 0
    jne     ft_strcmp_loop  ; if not null continue
    cmp     byte [rsi], 0x00; Compare the byte pointed to by rsi with 0
    jne     ft_strcmp_loop  ; if not null continue
    jmp     ft_strcmp_end   ; if both is null it will end

ft_strcmp_loop:
    cmp     al, 0x00        ; cmp res with 0
    jne     ft_strcmp_end   ; jump when not equal to 0

    inc     rdi             ; increment s1
    inc     rsi             ; increment s2
    jmp     ft_strcmp       ; jump back to the loop

ft_strcmp_end:
    movsx     rax, al       ; mov al res to rax
    ret