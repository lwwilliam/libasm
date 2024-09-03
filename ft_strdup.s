section .text

global _ft_strdup
extern malloc
extern _ft_strcpy
extern _ft_strlen

_ft_strdup:
    mov rsi, rdi            ; mov original sting to rsi for tmp storing
    call _ft_strlen         ; call ft_strlen to get the rdi len

    push rsi                ; push rsi to memory because other oprator might modify rsi

    mov rdi, rax            ; mov rax(return value of strlen) to the input of malloc
    call malloc             ; malloc

    test rax, rax           ; test rax
    je   _strdup_fail       ; jump if malloc return error

    pop rsi                 ; pop the pushed rsi 

    mov rdi, rax            ; rdi = destination pointer (return value from malloc)
    mov rsi, rsi            ; rsi = source string (unchanged from before)
    call _ft_strcpy         ; call _ft_strcpy(rdi, rsi)

    ret

_strdup_fail:
    xor rax, rax             ; return NULL if malloc failed
    ret
