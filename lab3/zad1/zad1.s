.code32

EXIT = 0

.section .data
wejscie: .asciz "%c%s"

.section .bss

.comm znak, 1
.comm wskaznik, 4

.section .text

.global main

main:

pushl %ebp
movl %esp, %ebp

pushl $wskaznik
pushl $znak
pushl $wejscie
call scanf

addl $12, %ebp

pushl $wskaznik
pushl znak
pushl $wejscie
call printf

addl $12, %ebp

movl %ebp, %esp
popl %ebp

pushl $EXIT
call exit

