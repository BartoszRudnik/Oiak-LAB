rozmiar = 10
index = 0

.section .data

znaki: .ascii "0123456789"


.section .text

.globl funkcja
.type funkcja, @function
funkcja:

pushl %eax
pushl %ebp
movl %esp, %ebp

movl znak, %eax
movl $'a', %eax
movl %eax, znak

movl %ebp, %esp
popl %ebp
popl %eax

ret


.globl funkcja1
.type funkcja1, @function
funkcja1:

pushl %ebx
pushl %eax
pushl %ebp
movl %esp, %ebp

movl $rozmiar, %edi
movl $index, %esi

loop:
movl tablica(, %esi,1), %eax
movl znaki(,%esi,1), %eax
movl %eax ,tablica(, %esi,1)
incl %esi
cmpl %edi, %esi
jne loop

movl %ebp, %esp
popl %ebp
popl %eax
popl %ebx
ret
