.section .text

.global rejestr
.type rejestr, @function
rejestr:


pushl %ebx
pushl %edi
pushl %esi
pushl %ebp
movl %esp, %ebp

xorl %edi, %edi
xorl %esi, %esi

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start(,%edi,4)
incl %edi
movl %edx, start(,%edi,4)

movl $1, %eax

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec(,%esi,4)
incl %esi
movl %edx, koniec(,%esi,4)

movl %ebp, %esp
popl %ebp
popl %esi
popl %edi
popl %ebx

ret
