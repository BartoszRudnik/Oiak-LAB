EXIT = 1
STDIN = 0
WRITE = 4
READ = 3
STDOUT = 1
OPEN = 5
CLOSE = 6

.section .data
file_name1: .asciz "rand1M"
file_name2: .asciz "out.hex"
buf_len = 2500000
text_len: .long 0
hex: .ascii "0123456789ABCDEF"
in: .long 0
out: .long 0

.section .bss
.comm bufor, 3000000
.comm bufor_out, 3000000

.section .text

.global _start

_start:

OTWORZ_WEJSCIE:
movl $OPEN, %eax
movl $file_name1, %ebx
movl $0, %ecx
movl $0644, %edx
int $0x80
movl %eax, in

WCZYTAJ:
movl $READ, %eax
movl in, %ebx
movl $bufor, %ecx
movl $buf_len, %edx
int $0x80
movl %eax, text_len

ZAMKNIJ_WEJSCIE:
movl $CLOSE, %eax
movl in, %ebx
int $0x80


movl $0, %eax
movl $0, %esi
movl $0, %edi

LOOP:
movb bufor(, %edi, 1), %al
movl $0, %edx
movl $0, %ebx
movl $16, %ecx
divl %ecx
movl %edx, %ebx
cmpl $16, %eax
jl DODAJ
movl $0, %edx
movl $16, %ecx
divl %ecx
movb hex(,%eax,1),%cl
movb %cl, bufor_out(, %esi, 1)
inc %esi
movb hex(, %edx,1),%cl
movb %cl, bufor_out(,%esi,1)
inc %esi
movb hex(,%ebx,1), %cl
movb %cl, bufor_out(, %esi, 1)
inc %esi
movb $32, %dl
movb %dl, bufor_out(, %esi,1)
inc %esi
inc %edi
cmpl %edi, text_len
jg LOOP

DODAJ:
movb hex(,%eax,1),%cl
movb %cl, bufor_out(,%esi,1)
inc %esi
movb hex(,%edx,1), %cl
movb %cl, bufor_out(,%esi,1)
inc %esi
movb $32, %dl
movb %dl, bufor_out(,%esi,1)
inc %esi
inc %edi
cmpl %edi, text_len
jg LOOP

OTWORZ_WYJSCIE:
movl $OPEN, %eax
movl $file_name2, %ebx
movl $0101, %ecx
movl $0644, %edx
int $0x80
movl %eax, out

WYPISZ:
mov $WRITE, %eax
mov out, %ebx
mov $bufor_out, %ecx
mov %esi, %edx
int $0x80

ZAMKNIJ_WYJSCIE:
movl $CLOSE, %eax
movl out, %ebx
int $0x80

WYJDZ:
mov $EXIT, %eax
mov $STDIN, %ebx
int $0x80

    
