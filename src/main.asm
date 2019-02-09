global _start

section .data
    align 2
    msg: db 'Hello World!',0x0a
    len: equ $-msg

section .bss

section .text
    _start:
        ; ssize_t write(int fd, const void *buf, size_t count)
        mov edx,len ; Set length of the message
        mov esi,msg ; Set address of the message
        mov edi,1   ; Set file descriptor number: 1 (stdout)
        mov eax,1   ; sys_write system number: 1
        syscall     ; Call it

        ; void exit(int status)
        xor edi,edi ; Set exit status to 0
        mov eax,60  ; sys_exit system number: 60
        syscall     ; Call it