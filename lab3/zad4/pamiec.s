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
xorl %esi, %esi

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start(, %edi, 4)
incl %edi
movl %edx, start(, %edi, 4)

movl $1, bufor(,%esi,4)

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec(, %esi, 4)
incl %esi
movl %edx, koniec(, %esi, 4)

movl %ebp, %esp
popl %ebp
popl %ebx
popl %esi
popl %edi

ret

