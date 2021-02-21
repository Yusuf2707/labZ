	.file	"lab4.c"
	.text
	.globl	exit_flag
	.bss
exit_flag:
	.space 1
	.section .rdata,"dr"
.LC0:
	.ascii "64-bit hello!\0"
	.text
	.globl	ThreadFunc
	.def	ThreadFunc;	.scl	2;	.type	32;	.endef
	.seh_proc	ThreadFunc
ThreadFunc:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -16(%rbp)
	movq	$0, -56(%rbp)
	jmp	.L2
.L3:
	leaq	.LC0(%rip), %rdx
	movl	$0, %ecx
	movq	__imp_FindWindowA(%rip), %rax
	call	*%rax
	movq	%rax, -56(%rbp)
.L2:
	cmpq	$0, -56(%rbp)
	je	.L3
	leaq	-80(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp_GetWindowRect(%rip), %rax
	call	*%rax
	jmp	.L4
.L5:
	call	rand
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	imull	$1000, %ebx, %eax
	movl	%ecx, %ebx
	subl	%eax, %ebx
	call	rand
	movl	%eax, %ecx
	movl	$274877907, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$1000, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movq	-56(%rbp), %rcx
	movl	$1, 40(%rsp)
	movl	$150, 32(%rsp)
	movl	$150, %r9d
	movl	%ebx, %r8d
	movl	%eax, %edx
	movq	__imp_MoveWindow(%rip), %rax
	call	*%rax
	movl	$3000, %ecx
	movq	__imp_Sleep(%rip), %rax
	call	*%rax
.L4:
	movzbl	exit_flag(%rip), %eax
	testb	%al, %al
	je	.L5
	movl	$0, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Hello, hell!\0"
	.text
	.globl	WinMain
	.def	WinMain;	.scl	2;	.type	32;	.endef
	.seh_proc	WinMain
WinMain:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	ThreadFunc(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	movq	__imp_CreateThread(%rip), %rax
	call	*%rax
	movl	$0, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC1(%rip), %rdx
	movl	$0, %ecx
	movq	__imp_MessageBoxA(%rip), %rax
	call	*%rax
	movb	$1, exit_flag(%rip)
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 8.3.0"
	.def	rand;	.scl	2;	.type	32;	.endef
