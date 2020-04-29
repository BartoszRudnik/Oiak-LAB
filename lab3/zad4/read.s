READ = 3
STDIN = 0

.section .data
wejscie_len = 1

.section .bss
.comm bufor, 256

.section .text

.global read
.type read, @function
read:

pushl %ebx
pushl %ebp
movl %esp, %ebp

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start

movl $READ, %eax
movl $STDIN, %ebx
movl $bufor, %ecx
movl $wejscie_len, %edx
int $0x80

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec

movl %ebp, %esp
popl %ebp
popl %ebx

ret
