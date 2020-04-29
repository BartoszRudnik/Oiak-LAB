.section .bss
.comm bufor, 16

.section .text

.global pamiec
.type pamiec, @function
pamiec:

pushl %edi
pushl %esi
pushl %ebx
pushl %ebp
movl %esp, %ebp

xorl %edi, %edi

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start 

movl $1, bufor(,%edi,4)

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec

movl %ebp, %esp
popl %ebp
popl %ebx
popl %esi
popl %edi

ret

