WRITE = 4
STDOUT = 1

.section .data
wyjscie: .ascii "0"
wyjscie_len = . - wyjscie

.section .text

.global write
.type write, @function
write:

pushl %ebx
pushl %ebp
movl %esp, %ebp

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start

movl $WRITE, %eax
movl $STDOUT, %ebx
movl $wyjscie, %ecx
movl $wyjscie_len, %edx
int $0x80

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec

movl %ebp, %esp
popl %ebp
popl %ebx

ret
