.section .data
ostatni: .long 0
sumaPoczatkowa:	.word 765,765,765,765
przesuniecie: .word 3

.section .bss
.comm M,4
.comm W,4
.comm width,4
.comm height,4

.section .text

.global mtime

mtime:
	pushl %ebx
	pushl %ebp
	movl %esp, %ebp

	xorl %eax, %eax
	cpuid
	rdtsc

	movl %ebp, %esp
	popl %ebp
	popl %ebx

	ret	
	

.global filter

filter:
	pushl %ebp
	movl %esp, %ebp

	pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl %esi
	pushl %edi

	movl 8(%ebp), %eax
	movl %eax, M

	movl 12(%ebp), %eax
	movl %eax, W

	movl 16(%ebp), %eax
	movl %eax, width

	movl 20(%ebp), %eax
	movl %eax, height

	movl M, %eax
	leal 2(%eax), %ebx
	
	addl width, %eax	
	leal 2(%eax), %ecx
	
	addl width, %eax		
	leal 2(%eax), %edi	

	movl W, %esi
	movl width, %eax				
	leal 1(%eax, %esi,), %esi	

	movl width, %eax
	movl height, %edx
	mull %edx
	addl M, %eax
	movl %eax, ostatni
	subl $1, ostatni

	movl $4, %eax
	
loop:	cmpl %edi, ostatni
	jle end	

	movq sumaPoczatkowa, %mm0
	pxor %mm2, %mm2	

	movd -2(%ebx), %mm1
	punpcklbw %mm2, %mm1
	psubusw %mm1, %mm0
	
	movd -1(%ebx), %mm1
	punpcklbw %mm2, %mm1
	psubusw %mm1, %mm0
	
	movd -2(%ecx), %mm1
	punpcklbw %mm2, %mm1
	psubusw %mm1, %mm0
		
	movd (%ecx), %mm1
	punpcklbw %mm2, %mm1
	paddusw %mm1, %mm0
		
	movd -1(%edi), %mm1
	punpcklbw %mm2, %mm1
	paddusw %mm1, %mm0
	
	movd (%edi), %mm1
	punpcklbw %mm2, %mm1
	paddusw %mm1, %mm0
	
	psrlw przesuniecie, %mm0
	
	packuswb %mm2, %mm0
	movd %mm0, (%esi)

	leal (%eax,%ebx), %ebx
	leal (%eax,%ecx), %ecx
	leal (%eax,%edi), %edi
	leal (%eax,%esi), %esi

	jmp loop			
	
end:	emms

	popl %edi
	popl %esi
	popl %edx
	popl %ecx
	popl %ebx
	popl %eax

	movl %ebp, %esp
	popl %ebp
	
	ret

