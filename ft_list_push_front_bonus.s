section .text 

global _ft_list_push_front

_ft_list_push_front:
    xor rcx, rcx                ; clear rcx for counter
    cmp rsi, 0x00               ; check if new node is empty
    je  _ft_list_push_front_end ; if its null go to end

    mov rax, [rdi]              ; put the head node into rax
    mov [rsi + 8], rax          ; move the old list head to rsi->next
    mov [rdi], rsi              ; update the head pointer the the new node

_ft_list_push_front_end:
    ret                         ; return