.section .bss
.comm control, 2
.comm newControl, 2

.section .text
.global getControl
getControl:

pushl %ebp
movl %esp, %ebp

fstcw control
movw control, %ax

movl %ebp, %esp
popl %ebp

ret

.global setControl
setControl:

pushl %ebp
movl %esp, %ebp

movw 8(%ebp), %ax
movw %ax, newControl
fldcw newControl

movl %ebp, %esp
popl %ebp

ret
