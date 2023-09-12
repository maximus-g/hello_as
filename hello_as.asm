; Linux_x64 Assembly
; NASM Assembler


global _start                           ; Entry point of the program

section .text                           ; Start of the code section

_start:
    mov rax, 0x01                       ; Load the value 1 (0x01) into the rax (accumulator) register (syscall for 'write')
    mov rdi, 0x01                       ; Load the value 1 (0x01) into the rdi (destination index) register (file descriptor for STDOUT)
    mov rsi, message                    ; Load the addr. of the 'message' variable into rsi (source index) register
    mov rdx, [message_len]              ; Load 'message_len' to the rdx (data) register
    syscall                             ; Invole OS to write to STDOUT

    mov rax, 60                         ; Load the value 60 (3C) into rax (syscall number for 'exit')
    xor rdi, rdi                        ; Set rdi to 0 (0x00) by xor'ing with itself
    syscall                             ; Invoke OS to exit the program

section .data
    message: db "Hello, World!!", 0xA   ; Define the string "Hello, World!!\n"
    message_len: dq $ - message         ; Evaluate the length (in bytes) of the 'message' and assign it to 'message_length'