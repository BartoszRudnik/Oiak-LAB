.section .data
value1 : .double 22.31
value2 : .double 0.0
value3 : .float 1.0
value4 : .float 3.0

.section .bss
.comm control, 2

.section .text
.global statusRegister
statusRegister:

pushl %ebp
movl %esp, %ebp
xorl %eax, %eax

fstsw %ax

movl %ebp, %esp
popl %ebp

ret 

.global divZero
divZero:

pushl %ebp
movl %esp, %ebp

finit 

fldl value2
fldl value1

fdiv %st, %st(1)

fstp %st(0)
fstp %st(0)

movl %ebp, %esp
popl %ebp

ret 

.global clearRegister
clearRegister:

pushl %ebp
movl %esp, %ebp

finit

movl %ebp, %esp
popl %ebp

ret

.global overflow
overflow:

pushl %ebp
movl %esp, %ebp

finit

flds value4
flds value3

fdiv %st, %st(1)

fstp %st(0)
fstp %st(0)

movl %ebp, %esp
popl %ebp

ret


