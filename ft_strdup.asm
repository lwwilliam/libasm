;section .note.GNU-stack

section .text

global _ft_strdup
extern _malloc

_ft_strdup:
    mov rdi, rsi
    xor rcx, rcx

_strlen_loop:
    mov     al, [rdi + rcx]  ; assign byte into al
    cmp     al, 0x00         ; compare byte to null
    je      _strlen_end       ; jump if condition is met

    inc     rcx              ; increment the count
    jmp     _strlen_loop     ; jump back to the loop because null byte not found

_strlen_end:
    inc rcx                  ; +1 for null terminator
    mov rdx, rcx             ; length + 1 for null
    mov rdi, rdx             ; set the length as the argument for malloc
    call _malloc              ; call malloc (returns pointer in rax)

    test rax, rax            ; check if malloc succeeded
    je   _strdup_fail         ; if malloc failed, return NULL

    mov rdi, rdi
    ret
    ; Copy the string from RSI to the newly allocated memory at RAX
    mov rdi, rax             ; destination pointer (return value)
    mov rsi, rsi             ; source pointer (original string)
    xor rcx, rcx             ; reset index

_strcpy_loop:
    mov al, [rsi + rcx]
    mov [rdi + rcx], al
    inc rcx
    cmp al, 0x00
    jne _strcpy_loop

_strdup_fail:
    xor rax, rax             ; return NULL if malloc failed
    ret
