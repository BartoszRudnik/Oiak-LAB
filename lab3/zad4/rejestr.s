.section .text

.global rejestr
.type rejestr, @function
rejestr:

pushl %ebx
pushl %ebp
movl %esp, %ebp

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start

movl $1, %eax

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec

movl %ebp, %esp
popl %ebp
popl %ebx

ret
