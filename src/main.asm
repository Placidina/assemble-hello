;Assembly Hello World

sys_exit    equ 60
sys_write   equ 1

stdin   equ 0
stdout  equ 1
stderr  equ 2

default rel
global _start


section .text

_start:                 ;tell linker entry point
    mov edx,len         ;message length
    mov esi,msg         ;message to write
    mov edi,stdout      ;file descriptor (stdout)
    mov eax,sys_write   ;system call number (sys_write)
    syscall             ;call kernel
    xor edi,edi         ;clean to exit code 0
    mov eax,sys_exit    ;system call number (sys_exit)
    syscall             ;call kernel


section .rodata

msg: db 'Hello, world!', 0  ;our dear string
len: equ $ - msg            ;length of our dear string