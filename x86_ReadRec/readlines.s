# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
# TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. 

# Brett Emory
# x86-64 Assembler code for function readlines().

#directives for the file
.file "readlines.s"
.section .rodata
format:
	.string "%d %d"

PR_1: 
	.string "Value is %d , %d \n"
.data
.text
.globl readlines
.type	readlines, @function
readlines: 
	pushq %rbp
	movq %rsp, %rbp

	# Arguments:
	# %rdi: File pointer
	# %rsi: Pointer to the array of structures
	# %rdx: Number of structures (X) (count)

	movq %rdi, %r13
	movq %rsi, %r14
	movq %rdx, %r12

read_line_loop:
	
	decq %r12
	jl end_of_loop

	movq %r13, %rdi
	movq $format, %rsi
	leaq (%r14), %rcx
	leaq 4(%r14), %rdx
	movq $0, %rax
	call fscanf

	cmpq $0,%r12
	je end_of_loop
	addq $48, %r14
	jmp read_line_loop

end_of_loop:
	leave
	ret
.size readlines, .-readlines













