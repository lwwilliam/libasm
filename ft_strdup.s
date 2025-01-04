section .text

global ft_strdup
extern malloc
extern ft_strcpy
extern ft_strlen

ft_strdup:
    mov rsi, rdi            ; mov original sting to rsi for tmp storing
    call ft_strlen         ; call ft_strlen to get the rdi len

    push rsi                ; push rsi to memory because other oprator might modify rsi

    mov rdi, rax            ; mov rax(return value of strlen) to the input of malloc
    call malloc             ; malloc

    test rax, rax           ; test rax
    je   strdup_fail       ; jump if malloc return error

    pop rsi                 ; pop the pushed rsi 

    mov rdi, rax            ; rdi = destination pointer (return value from malloc)
    mov rsi, rsi            ; rsi = source string (unchanged from before)
    call ft_strcpy         ; call _ft_strcpy(rdi, rsi)

    ret

strdup_fail:
    xor rax, rax             ; return NULL if malloc failed
    ret
