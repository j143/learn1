; =============== SCENARIO 3: SIMPLE CALCULATOR ===============
; File: calculator.asm
section .data
    num1 dq 10
    num2 dq 5
    sum_msg db 'Sum: '
    sum_msg_len equ $ - sum_msg
    diff_msg db 'Difference: '
    diff_msg_len equ $ - diff_msg
    newline db 0xA

section .bss
    result resb 8

section .text
    global _start

_start:
    ; Addition
    mov rax, [num1]
    add rax, [num2]
    
    ; Print sum message
    mov rdi, 1
    mov rsi, sum_msg
    mov rdx, sum_msg_len
    push rax           ; Save sum
    mov rax, 1
    syscall
    pop rax            ; Restore sum
    
    ; Convert to ASCII and print
    add rax, 48
    mov [result], rax
    mov rax, 1
    mov rsi, result
    mov rdx, 1
    syscall
    
    ; Print newline
    mov rsi, newline
    syscall

    ; Subtraction
    mov rax, [num1]
    sub rax, [num2]
    
    ; Print difference message
    mov rsi, diff_msg
    mov rdx, diff_msg_len
    push rax
    mov rax, 1
    syscall
    pop rax
    
    ; Convert to ASCII and print
    add rax, 48
    mov [result], rax
    mov rax, 1
    mov rsi, result
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

; Output:
; Sum: 15
; Difference: 5

; actual output
; Sum: ?
; Difference: 5