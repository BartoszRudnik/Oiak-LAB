.section .data
value1: .double 1.933
value2: .double 1.337

Rounding1: .byte 0x7F, 0x00
Rounding2: .word  0x87F, 0x000
Rounding3: .word 0x47F, 0x000

.section .text
.global tryb1
tryb1:

pushl %ebp
movl %esp, %ebp

finit
fldcw Rounding1
fstcw control1

fldl value1
fldl value2

fmulp

movl %ebp, %esp
popl %ebp

ret

.global tryb2
tryb2:

pushl %ebp
movl %esp, %ebp

finit
fldcw Rounding2
fstcw control2

fldl value1
fldl value2

fmulp 

movl %ebp, %esp
popl %ebp

ret

.global tryb3
tryb3:

pushl %ebp
movl %esp, %ebp

finit
fldcw Rounding3
fstcw control3

fldl value1
fldl value2

fmulp

movl %ebp, %esp
popl %ebp

ret

.global bez
bez:

pushl %ebp
movl %esp, %ebp

finit

fldl value1
fldl value2

fmulp

movl %ebp, %esp
popl %ebp

ret


