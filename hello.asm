; Basic Assembly Structure (x86)
; This example uses NASM syntax for x86

; =================== SECTION 1: BASICS ===================
; Data Section - Where we declare our variables
section .data
    message db 'Hello, World!', 0xA  ; Basic string with newline
    message_len equ $ - message      ; Calculate string length

; BSS Section - Uninitialized data
section .bss
    input_buffer resb 64             ; Reserve 64 bytes for input

; Text Section - Where our code goes
section .text
    global _start                    ; Entry point

; Basic Program Structure
_start:
    ; Basic Output Example
    mov eax, 4                      ; syscall: sys_write
    mov ebx, 1                      ; file descriptor: stdout
    mov ecx, message                ; message to write
    mov edx, message_len            ; message length
    int 0x80                        ; make syscall

    ; Basic Exit
    mov eax, 1                      ; syscall: sys_exit
    mov ebx, 0                      ; exit code 0
    int 0x80                        ; make syscall

; =================== SECTION 2: INTERMEDIATE ===================
; Working with Numbers
numbers:
    ; Basic Arithmetic
    mov eax, 5                      ; Load 5 into eax
    add eax, 3                      ; Add 3 to eax
    sub eax, 2                      ; Subtract 2 from eax
    mul ebx                         ; Multiply eax by ebx
    div ecx                         ; Divide eax by ecx

; Basic Loop Structure
loop_example:
    mov ecx, 10                     ; Counter
loop_start:
    ; Loop body here
    dec ecx                         ; Decrement counter
    jnz loop_start                  ; Jump if not zero

; Basic Conditional Structure
conditional:
    cmp eax, ebx                    ; Compare eax and ebx
    je equal                        ; Jump if equal
    jg greater                      ; Jump if greater
    jl lesser                       ; Jump if lesser

; =================== SECTION 3: ADVANCED ===================
; Function Definition
function_example:
    push ebp                        ; Save old base pointer
    mov ebp, esp                    ; Set up stack frame
    
    ; Function body here
    
    mov esp, ebp                    ; Restore stack
    pop ebp                         ; Restore old base pointer
    ret                            ; Return from function

; Working with Arrays
array_example:
    ; Array definition in data section
    array dd 1, 2, 3, 4, 5         ; Define array of doublewords
    
    ; Array traversal
    mov esi, array                 ; Load array address
    mov ecx, 5                     ; Array length
array_loop:
    lodsd                          ; Load dword into eax
    ; Process array element
    loop array_loop                ; Decrement ecx and loop

; =================== SECTION 4: ADVANCED TOPICS ===================
; System Calls
syscall_example:
    ; File Operations
    mov eax, 5                     ; sys_open
    mov ebx, filename
    mov ecx, 0                     ; O_RDONLY
    int 0x80

; Memory Management
memory_example:
    ; Allocate memory
    mov eax, 45                    ; sys_brk
    xor ebx, ebx                   ; Get current break
    int 0x80
    
    ; Use allocated memory
    mov ebx, eax                   ; Save break location
    add ebx, 4096                  ; Add one page
    mov eax, 45                    ; sys_brk again
    int 0x80

; Floating Point Operations
floating_point:
    finit                          ; Initialize FPU
    fld dword [float_num]          ; Load float
    fadd dword [float_num2]        ; Add floats
    fstp dword [result]            ; Store result
