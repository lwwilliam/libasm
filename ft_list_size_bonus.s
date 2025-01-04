section .text 

global ft_list_size

ft_list_size:
    xor rcx, rcx            ; clear rcx for counter

ft_list_size_loop:
    cmp rdi, 0x00           ; check if rdi/node is null
    je  ft_list_size_end   ; if its null go to end

    inc rcx                 ; increment the counter
    mov rdi, [rdi + 8]      ; move to next node for x64 is 8 x32 is 4 
    jmp ft_list_size_loop  ; continue the loop

ft_list_size_end:
    mov rax, rcx            ; move the counter to the return registry
    ret                     ; return