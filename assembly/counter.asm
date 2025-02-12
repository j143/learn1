; =============== SCENARIO 2: NUMBER COUNTER ===============
; File: counter.asm
section .data
    count_msg db 'Count: '
    count_msg_len equ $ - count_msg
    newline db 0xA
    
section .bss
    num_str resb 2

section .text
    global _start

_start:
    mov r8, 0          ; Initialize counter

count_loop:
    ; Print "Count: "
    mov rax, 1
    mov rdi, 1
    mov rsi, count_msg
    mov rdx, count_msg_len
    syscall

    ; Convert number to ASCII
    add r8, 48         ; Convert to ASCII
    mov [num_str], r8
    
    ; Print number
    mov rax, 1
    mov rdi, 1
    mov rsi, num_str
    mov rdx, 1
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    sub r8, 48         ; Convert back from ASCII
    inc r8             ; Increment counter
    cmp r8, 5          ; Count up to 5
    jl count_loop

    mov rax, 60
    mov rdi, 0
    syscall

; Output:
; Count: 0
; Count: 1
; Count: 2
; Count: 3
; Count: 4