.section .data

precision1: .byte 0x7F, 0x00
precision2: .word 0x27F, 0x000

a: .double 1.1111111111111111111111111111111111111111111111111111
b: .double 2.2222222222222222222222222222222222222222222222222222

.section .text

.global precyzja1
precyzja1:

pushl %ebp
movl %esp, %ebp

finit

fldl a
fldl b

fldcw precision1
fstcw control1

faddp

movl %ebp, %esp
popl %ebp

ret

.global precyzja2
precyzja2:

pushl %ebp
movl %esp, %ebp

finit

fldl a
fldl b

fldcw precision2
fstcw control2

faddp

movl %ebp, %esp
popl %ebp

ret

