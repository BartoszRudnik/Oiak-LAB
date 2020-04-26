WRITE = 4
STDOUT = 1

.section .data
wyjscie: .ascii "0"
wyjscie_len = . - wyjscie

.section .text

.global write
.type write, @function
write:

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

movl $WRITE, %eax
movl $STDOUT, %ebx
movl $wyjscie, %ecx
movl $wyjscie_len, %edx
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
