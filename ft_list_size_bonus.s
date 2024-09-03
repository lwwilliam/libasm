section .text 

global _ft_list_size

_ft_list_size:
    xor rcx, rcx            ; clear rcx for counter

_ft_list_size_loop:
    cmp rdi, 0x00           ; check if rdi/node is null
    je  _ft_list_size_end   ; if its null go to end

    inc rcx                 ; increment the counter
    mov rdi, [rdi + 8]      ; move to next node for x64 is 8 x32 is 4 
    jmp _ft_list_size_loop  ; continue the loop

_ft_list_size_end:
    mov rax, rcx            ; move the counter to the return registry
    ret                     ; return