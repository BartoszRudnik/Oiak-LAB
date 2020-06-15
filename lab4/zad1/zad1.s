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
