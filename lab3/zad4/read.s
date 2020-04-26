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

movl %eax, start(,%edi,4)
incl %edi
movl %edx, start(,%edi,4)

movl $READ, %eax
movl $STDIN, %ebx
movl $bufor, %ecx
movl $wejscie_len, %edx
int $0x80

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec(,%esi,4)
incl %esi
movl %edx, koniec(,%esi,4)

movl %ebp, %esp
popl %ebp
popl %ebx
popl %esi
popl %edi

ret
