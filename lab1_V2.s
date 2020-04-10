EXIT = 1
STDIN = 0
WRITE = 4
READ = 3
STDOUT = 1
OPEN = 5
CLOSE = 6

.section .data

hex: .ascii "0123456789ABCDEF"
wejscie_len = 1
wyjscie_len = 3
spacja = 32
dzielnik = 16

.section .bss

.comm wejscie, 1024
.comm wyjscie, 1024

.section .text

.global _start

_start:

WCZYTAJ:
movl $READ, %eax
movl $STDIN, %ebx
movl $wejscie, %ecx
movl $wejscie_len, %edx
int $0x80

cmp $0, %eax
je WYJSCIE

movl $0, %eax
movl $0, %edi
movl $0, %esi
movl $0, %edx
movl $0, %ebx

movb wejscie(, %edi, 1), %al
movl $dzielnik, %ecx

divl %ecx
movl %edx, %ebx

cmpl $dzielnik, %eax
jl CASE2

movl $0, %edx
movl $dzielnik, %ecx

divl %ecx

movb hex(, %eax, 1), %cl
movb %cl, wyjscie(, %esi, 1)
incl %esi

movb hex(, %edx, 1), %cl
movb %cl, wyjscie(, %esi, 1)
incl %esi

movb hex(, %ebx, 1), %cl
movb %cl, wyjscie(, %esi, 1)
incl %esi

movb $spacja, %dl
movb %dl, wyjscie(, %esi, 1)
incl %esi

jmp WYPISZ

CASE2:

movb hex(, %eax, 1), %cl
movb %cl, wyjscie(, %esi, 1)
incl %esi

movb hex(, %edx, 1), %cl
movb %cl, wyjscie(, %esi, 1)
incl %esi

movb $spacja, %dl
movb %dl, wyjscie(, %esi, 1)
incl %esi

WYPISZ:

movl $WRITE, %eax
movl $STDOUT, %ebx
movl $wyjscie, %ecx
movl %esi, %edx
int $0x80

jmp WCZYTAJ

WYJSCIE:

movl $EXIT, %eax
movl $STDIN, %ebx
int $0x80
