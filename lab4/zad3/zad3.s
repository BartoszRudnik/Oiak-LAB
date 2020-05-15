.section .data
value1: .double 1.933
value2: .double 1.337

newPrecision: .byte 0x7F
newRounding: .word  0x87F
newRounding2: .word 0x47F

.section .text
.global tryb1
tryb1:

pushl %ebp
movl %esp, %ebp

finit
fldcw newPrecision

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
fldcw newRounding

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
fldcw newRounding2

fldl value1
fldl value2

fmulp

movl %ebp, %esp
popl %ebp

ret


