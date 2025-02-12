; =============== SCENARIO 4: ARRAY PROCESSOR ===============
; File: array.asm
section .data
    array dq 1, 2, 3, 4, 5
    array_len equ 5
    sum_msg db 'Array sum: '
    sum_msg_len equ $ - sum_msg
    newline db 0xA

section .bss
    sum_str resb 8

section .text
    global _start

_start:
    mov rax, 0          ; Initialize sum
    mov rcx, array_len  ; Counter
    mov rsi, array      ; Array pointer

sum_loop:
    add rax, [rsi]      ; Add current element
    add rsi, 8          ; Move to next element
    dec rcx             ; Decrement counter
    jnz sum_loop        ; Continue if not zero

    ; Print sum message
    mov rdi, 1
    mov rsi, sum_msg
    mov rdx, sum_msg_len
    push rax
    mov rax, 1
    syscall
    pop rax

    ; Convert to ASCII and print
    add rax, 48
    mov [sum_str], rax
    mov rax, 1
    mov rsi, sum_str
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

; Output:
; Array sum: 15

; now there's an issue
; Array sum: ?