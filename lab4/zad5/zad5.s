.section .data
a: .tfloat 2.05
b: .tfloat 1.5
c: .tfloat 0.89
d: .tfloat 1.45
e: .tfloat 2.56
f: .tfloat 2.0 
g: .tfloat 0.34
h: .tfloat 1.0

.section .text

.global zalezne
zalezne:

pushl %ebx
pushl %ebp
movl %esp, %ebp

finit

fld a
fld b
fld c
fld d
fld e
fld f
fld g
fld h

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start

fadd %st(2), %st(0)
fmul %st(0), %st(7)
fadd %st(7), %st(0)
fmul %st(0), %st(5)
fadd %st(5), %st(0)
fmul %st(0), %st(3)
fadd %st(3), %st(0)
fmul %st(0), %st(4)
fadd %st(1), %st(0)
fmul %st(0), %st(4)
fadd %st(4), %st(0)
fmul %st(0), %st(5)
fadd %st(5), %st(0)
fmul %st(0), %st(6)
fadd %st(6), %st(0)
fmul %st(0), %st(7)
fadd %st(7), %st(0)
fmul %st(0), %st(6)
fadd %st(6), %st(0)
fmul %st(0), %st(5)
fadd %st(5), %st(0)
fmul %st(0), %st(3)
fadd %st(3), %st(0)
fmul %st(0), %st(5)
fadd %st(5), %st(0)
fmul %st(0), %st(4)
fadd %st(4), %st(0)
fmul %st(0), %st(3)
fadd %st(3), %st(0)
fmul %st(0), %st(4)
fadd %st(4), %st(0)
fmul %st(0), %st(2)
fadd %st(2), %st(0)
fmul %st(0), %st(1)
fadd %st(1), %st(0)
fmul %st(0), %st(2)
fadd %st(2), %st(0)
fmul %st(0), %st(3)
fmul %st(3), %st(0)
fadd %st(0), %st(4)
fmul %st(4), %st(0)
fadd %st(0), %st(5)
fmul %st(5), %st(0)
fadd %st(0), %st(6)
fmul %st(6), %st(0)
fadd %st(0), %st(7)
fmul %st(7), %st(0) 
fadd %st(0), %st(5)
fmul %st(7), %st(0)
fadd %st(0), %st(7)
fmul %st(7), %st(0)
fadd %st(0), %st(1)
fmul %st(1), %st(0)
fadd %st(0), %st(2)
fmul %st(2), %st(0)
fadd %st(0), %st(4)
fmul %st(4), %st(0)
fadd %st(0), %st(2) 
fmul %st(2), %st(0)
fadd %st(0), %st(5)
fmul %st(5), %st(0)
fadd %st(0), %st(6)
fmul %st(6), %st(0)
fadd %st(0), %st(7)
fmul %st(7), %st(0)
fadd %st(0), %st(1)
fmul %st(1), %st(0)
fadd %st(0), %st(2)
fmul %st(2), %st(0)
fadd %st(0), %st(3)

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec

movl %ebp, %esp
popl %ebp
popl %ebx

ret

.global niezalezne
niezalezne:

pushl %ebx
pushl %ebp
movl %esp, %ebp

finit

fld a
fld b
fld c
fld d
fld e
fld f
fld g
fld h

xorl %eax, %eax
cpuid
rdtsc

movl %eax, start

fadd %st(0), %st(1)
fmul %st(0), %st(2)
fadd %st(0), %st(3)
fmul %st(0), %st(4)
fadd %st(0), %st(5)
fmul %st(0), %st(6)
fadd %st(0), %st(7)
fmul %st(0), %st(1)
fadd %st(0), %st(2)
fmul %st(0), %st(3)
fadd %st(0), %st(4)
fmul %st(0), %st(5)
fadd %st(0), %st(6)
fmul %st(0), %st(7)
fadd %st(0), %st(1)
fmul %st(0), %st(2)
fadd %st(0), %st(3)
fmul %st(0), %st(4)
fadd %st(0), %st(5)
fmul %st(0), %st(6)
fadd %st(0), %st(7)
fmul %st(0), %st(1)
fadd %st(0), %st(2)
fmul %st(0), %st(3)
fadd %st(0), %st(4)
fmul %st(0), %st(5)
fadd %st(0), %st(6)
fmul %st(0), %st(7)
fadd %st(0), %st(1)
fmul %st(0), %st(2)
fadd %st(0), %st(3)
fmul %st(0), %st(4)
fadd %st(0), %st(5)
fmul %st(0), %st(6)
fadd %st(0), %st(7)
fmul %st(0), %st(1)
fadd %st(0), %st(2)
fmul %st(0), %st(3)
fadd %st(0), %st(4)
fmul %st(0), %st(5)
fadd %st(0), %st(6)
fmul %st(0), %st(7)
fadd %st(0), %st(1)
fmul %st(0), %st(2)
fadd %st(0), %st(3)
fmul %st(0), %st(4)
fadd %st(0), %st(5)
fmul %st(0), %st(6)
fadd %st(0), %st(7)
fmul %st(0), %st(1)
fadd %st(0), %st(2)
fmul %st(0), %st(3)
fadd %st(0), %st(4)
fmul %st(0), %st(5)
fadd %st(0), %st(6)
fmul %st(0), %st(7)
fadd %st(0), %st(1)
fmul %st(0), %st(2)
fadd %st(0), %st(3)
fmul %st(0), %st(4)
fadd %st(0), %st(5)
fmul %st(0), %st(6)
fadd %st(0), %st(7)
fmul %st(0), %st(1)
fadd %st(0), %st(2)
fmul %st(0), %st(3)
fadd %st(0), %st(4)
fmul %st(0), %st(5)
fadd %st(0), %st(6)
fmul %st(0), %st(7)
fadd %st(0), %st(1)
fmul %st(0), %st(2)
fadd %st(0), %st(3)
fmul %st(0), %st(4)
fadd %st(0), %st(5)
fmul %st(0), %st(6)
fadd %st(0), %st(7)
fmul %st(0), %st(1)
fadd %st(0), %st(2)
fmul %st(0), %st(3)
fadd %st(0), %st(4)
fmul %st(0), %st(5)
fadd %st(0), %st(6)
fmul %st(0), %st(7)
fadd %st(0), %st(1)
fmul %st(0), %st(2)
fadd %st(0), %st(3)
fmul %st(0), %st(4)
fadd %st(0), %st(5)
fmul %st(0), %st(6)
fadd %st(0), %st(7)

xorl %eax, %eax
cpuid
rdtsc

movl %eax, koniec

movl %ebp, %esp
popl %ebp
popl %ebx

ret

.global statusRegister
statusRegister:

pushl %ebp
movl %esp, %ebp
xorl %eax, %eax

fstsw %ax
movw %ax, sR

movl %ebp, %esp
popl %ebp

ret


