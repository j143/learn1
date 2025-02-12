; Basic Assembly Structure (x86_64)
; This example uses NASM syntax for 64-bit systems

; =================== SECTION 1: BASICS ===================
; Data Section - Where we declare our variables
section .data
    message db 'Hello, World!', 0xA  ; Basic string with newline
    message_len equ $ - message      ; Calculate string length
    filename db 'test.txt', 0        ; Define filename
    float_num dd 3.14               ; Define float number
    float_num2 dd 2.71              ; Define second float
    result dd 0.0                   ; Space for result

; BSS Section - Uninitialized data
section .bss
    input_buffer resb 64             ; Reserve 64 bytes for input

; Text Section - Where our code goes
section .text
    global _start                    ; Entry point

; Basic Program Structure
_start:
    ; Basic Output Example
    mov rax, 1                      ; syscall: sys_write
    mov rdi, 1                      ; file descriptor: stdout
    mov rsi, message                ; message to write
    mov rdx, message_len            ; message length
    syscall                         ; make syscall

    ; Basic Exit
    mov rax, 60                     ; syscall: sys_exit
    mov rdi, 0                      ; exit code 0
    syscall                         ; make syscall

; =================== SECTION 2: INTERMEDIATE ===================
; Working with Numbers
numbers:
    ; Basic Arithmetic
    mov rax, 5                      ; Load 5 into rax
    add rax, 3                      ; Add 3 to rax
    sub rax, 2                      ; Subtract 2 from rax
    
    ; Basic multiplication and division
    mov rbx, 2                      ; Load multiplier
    mul rbx                         ; Multiply rax by rbx
    mov rcx, 2                      ; Load divisor
    div rcx                         ; Divide rax by rcx

; Basic Loop Structure
loop_example:
    mov rcx, 10                     ; Counter
loop_start:
    ; Loop body here
    dec rcx                         ; Decrement counter
    jnz loop_start                  ; Jump if not zero

; Basic Conditional Structure
conditional:
    cmp rax, rbx                    ; Compare rax and rbx
    je equal_label                  ; Jump if equal
    jg greater_label                ; Jump if greater
    jl lesser_label                 ; Jump if lesser

equal_label:
    ; Handle equal case
    nop
greater_label:
    ; Handle greater case
    nop
lesser_label:
    ; Handle lesser case
    nop

; =================== SECTION 3: ADVANCED ===================
; Function Definition
function_example:
    push rbp                        ; Save old base pointer
    mov rbp, rsp                    ; Set up stack frame
    
    ; Function body here
    
    mov rsp, rbp                    ; Restore stack
    pop rbp                         ; Restore old base pointer
    ret                            ; Return from function

; Working with Arrays
array_example:
    ; Array definition in data section
    section .data
        array dq 1, 2, 3, 4, 5      ; Define array of quadwords
    
    section .text
    ; Array traversal
    lea rsi, [array]               ; Load array address
    mov rcx, 5                     ; Array length
array_loop:
    lodsq                          ; Load qword into rax
    ; Process array element
    loop array_loop                ; Decrement rcx and loop

; =================== SECTION 4: ADVANCED TOPICS ===================
; System Calls
syscall_example:
    ; File Operations
    mov rax, 2                     ; sys_open
    mov rdi, filename
    mov rsi, 0                     ; O_RDONLY
    syscall

; Memory Management
memory_example:
    ; Allocate memory using mmap
    mov rax, 9                     ; sys_mmap
    mov rdi, 0                     ; let kernel choose address
    mov rsi, 4096                  ; page size
    mov rdx, 3                     ; PROT_READ | PROT_WRITE
    mov r10, 34                    ; MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1                     ; fd
    mov r9, 0                      ; offset
    syscall

; Floating Point Operations
floating_point:
    finit                          ; Initialize FPU
    fld dword [float_num]          ; Load float
    fadd dword [float_num2]        ; Add floats
    fstp dword [result]            ; Store result
