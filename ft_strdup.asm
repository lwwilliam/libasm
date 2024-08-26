section .text

global _ft_strdup
extern malloc
extern _ft_strcpy
extern _ft_strlen

_ft_strdup:
    mov rsi, rdi
    call _ft_strlen

    push rsi

    mov rdi, rax
    call malloc

    test rax, rax
    je   _strdup_fail

    pop rsi

    mov rdi, rax            ; rdi = destination pointer (return value from malloc)
    mov rsi, rsi            ; rsi = source string (unchanged from before)
    call _ft_strcpy         ; call _ft_strcpy(rdi, rsi)

    ret

_strdup_fail:
    xor rax, rax             ; return NULL if malloc failed
    ret
