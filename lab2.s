EXIT = 1
READ = 3
WRITE = 4
STDOUT = 1
STDIN = 0
OPEN = 5
CLOSE = 6

.section .data
wejscie_len = 256
wyjscie_len = 512
licznik_we = 64
licznik_wy = 128
text_len1: .long 0
text_len2: .long 0

.section .bss
.comm mnoznik, 512
.comm mnozna, 512
.comm iloczyn, 1024

.section .text

.global _start

_start:

wczytaj:

movl $READ, %eax
movl $STDIN, %ebx
movl $mnoznik, %ecx
movl $wejscie_len, %edx
int $0x80
movl %eax, text_len1

movl $READ, %eax
movl $STDIN, %ebx
movl $mnozna, %ecx
movl $wejscie_len, %edx
int $0x80
movl %eax, text_len2

cmpl $0, text_len1
je wyjdz
cmpl $0, text_len2
je wyjdz

movl $0, %edi

czysc:

cmpl $licznik_wy, %edi
je przygotuj
movl $0, iloczyn(, %edi, 4)
incl %edi
jmp czysc

przygotuj:

xorl %eax, %eax
xorl %ebx, %ebx
xorl %ecx, %ecx
xorl %edx, %edx
xorl %edi, %edi
xorl %esi, %esi
clc

loop1:

cmpl $licznik_we, %edi
je wypisz

movl mnozna(, %edi, 4), %ecx
xorl %esi, %esi
xorl %ebx, %ebx
clc

loop2:

cmpl $0, %esi
je dalej

popf

przeniesienie:

jnc dalej
incl %ebx
adcl $0, iloczyn(, %ebx, 4)

jmp przeniesienie

dalej:

cmpl $licznik_we, %esi
je przesun

xorl %eax, %eax
movl mnoznik(, %esi, 4), %eax
mull %ecx

xorl %ebx, %ebx
movl %edi, %ebx
addl %esi, %ebx
clc

addl %eax, iloczyn(, %ebx, 4)
incl %ebx
adcl %edx, iloczyn(, %ebx, 4)
incl %esi

pushf

jmp loop2

przesun:

incl %edi
jmp loop1

wypisz:

movl $WRITE, %eax
movl $STDOUT, %ebx
movl $iloczyn, %ecx
movl $wyjscie_len, %edx
int $0x80

jmp wczytaj

wyjdz:
movl $EXIT, %eax
movl $STDIN, %ebx
int $0x80

