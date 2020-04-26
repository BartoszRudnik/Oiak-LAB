.section .text

.global tsc
.type tsc, @function
tsc:

pushl %ebx
pushl %ebp
movl %esp, %ebp

xorl %eax, %eax
cpuid
rdtsc

movl %ebp, %esp
popl %ebp
popl %ebx

ret
