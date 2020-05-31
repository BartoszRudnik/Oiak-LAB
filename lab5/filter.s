.section .data
rozmiar: .long 0
ostatni: .long 0
zeros: .long 0
sumaPoczatkowa:	.word 1024,1024,1024,1024

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

	pushl %ebx
	pushl %ecx
	pushl %esi
	pushl %edi

	movl 16(%ebp), %eax
	movl 20(%ebp), %ebx
	mull %ebx
	movl %eax, rozmiar
	
	xorl %ebx, %ebx
	xorl %eax, %eax

	movl 8(%ebp), %ebx
	addl rozmiar, %ebx
	movl %ebx, ostatni				

	movl 8(%ebp), %edx
	leal (%edx), %ebx
	
	addl 16(%ebp), %edx	
	leal (%edx), %ecx
	
	addl 16(%ebp), %edx		
	leal (%edx), %edi	

	movl 12(%ebp), %edx
	movl 16(%ebp), %eax				
	leal 1(%eax, %edx, 1), %esi	
loop:
	movq sumaPoczatkowa, %mm0
	
	movd (%ebx), %mm1
	punpcklbw zeros, %mm1
	psubw %mm1, %mm0
	
	movd 1(%ebx), %mm2
	punpcklbw zeros, %mm2
	psubw %mm2, %mm0
	
	movd (%ecx), %mm3
	punpcklbw zeros, %mm3
	psubw %mm3, %mm0
		
	movd 2(%ecx), %mm5
	punpcklbw zeros, %mm5
	paddw %mm5, %mm0
		
	movd 1(%edi), %mm6
	punpcklbw zeros, %mm6
	paddw %mm6, %mm0
	
	movd 2(%edi), %mm7
	punpcklbw zeros, %mm7
	paddw %mm7, %mm0
	
	psrlw $3, %mm0
	
	packuswb zeros, %mm0
	movd %mm0, (%esi)

	leal 4(,%ebx,1), %ebx
	leal 4(,%ebx,1), %ecx
	leal 4(,%edi,1), %edi
	leal 4(,%esi,1), %esi

	cmpl %edi, ostatni
	jge loop
			
	popl %edi
	popl %esi
	popl %ecx
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	
	ret

