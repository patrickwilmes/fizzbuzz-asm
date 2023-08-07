default rel
extern printf

SYS_WRITE   equ     1
SYS_EXIT    equ     60
STDOUT      equ     1
SYS_READ    equ     0

section .bss
section .data
inputlen equ 10
prompt          db      "Target fizz buzz number is 20 ", 10
prompt_len      equ     $-prompt
fizz_buzz_str   db      "fizzbuzz$", 10
fizz_buzz_len   equ     $-fizz_buzz_str
fizz            db      "fizz", 10
fizz_len        equ     $-fizz
buzz            db      "buzz", 10
buzz_len        equ     $-buzz
fmtstr          db      "%d",10,0

section .text
    global main
main:
    mov     rax, SYS_WRITE      ; write syscall
    mov     rdi, STDOUT
    mov     rsi, prompt
    mov     rdx, prompt_len
    syscall
    mov r10, 0
    mov r12, 0                  ; register for our starting number
fizz_buzz:
    mov r13, 0
    mov r14, 0
    mov r15, 0
    inc r12
    cmp r12, 20
    je exit
    mov rax, r12
    mov rdx, 0                  ; prevent SIGFPE
    mov rcx, 3
    div rcx
    mov r13, rdx
    mov rax, r12
    mov rcx, 5
    mov rdx, 0
    div rcx
    mov r14, rdx
    mov r15, rdx
    add r14, r13
    cmp r14, 0
    je print_fizz_buzz
    cmp r13, 0
    je print_fizz
    cmp r15, 0
    je print_buzz
    jmp print_number
print_fizz_buzz:
    mov     rax, SYS_WRITE      ; write syscall
    mov     rdi, STDOUT
    mov     rsi, fizz_buzz_str
    mov     rdx, fizz_buzz_len
    syscall
    jmp fizz_buzz
print_buzz:
    mov     rax, SYS_WRITE      ; write syscall
    mov     rdi, STDOUT
    mov     rsi, buzz
    mov     rdx, buzz_len
    syscall
    jmp fizz_buzz
print_fizz:
    mov     rax, SYS_WRITE      ; write syscall
    mov     rdi, STDOUT
    mov     rsi, fizz
    mov     rdx, fizz_len
    syscall
    jmp fizz_buzz
print_number:
    push rbp
    mov rbp, rsp
    mov rdi, fmtstr
    mov rsi, r12
    mov rax, 0
    call printf
    jmp fizz_buzz
exit:
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall

