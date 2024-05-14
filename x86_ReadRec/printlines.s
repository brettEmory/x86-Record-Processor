# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
# TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. 

# Brett Emory
# x86-64 Assembler code for printlines().

.file "printlines.s"
.section .rodata

format_sum:     .string "%d + %d = %d\n"
format_diff:    .string "%d - %d = %d\n"
format_prod:    .string "%d * %d = %d\n"
format_quot:    .string "%d / %d = %d\n"
format_rem: .string "remainder = %d\n\n"
.text
.globl printlines
.type	printlines, @function

printlines:
    pushq %rbp
    movq %rsp, %rbp

	# Arguments:
    	# %rdi: Pointer to the structure array
    	# %rsi: Number of structures (count)

	movq %rdi, %r14
	movq %rsi, %rbx

printlines_loop:

	decq %rbx
	jl end_loop
	pushq %rbx
	
	 # Load values from the structure
    	movq 4(%r14), %r8          # value1
    	movq (%r14), %r9         # value2
    	movq 24(%r14), %r10         # sum
    	movq 8(%r14), %r11          # difference
    	movq 40(%r14), %r12         # product
    	movq 16(%r14), %r13         # quotient
    	movq 32(%r14), %r15         # remainder

    pushq %r8
    pushq %r9
    pushq %r10
    pushq %r11
    pushq %r12
    pushq %r13
    pushq %r15
	#print sum
	movq $format_sum, %rdi
	movq $0, %rax
	movq %r8, %rsi
	movq %r9, %rdx
	movq %r10, %rcx
	call printf
    popq %r15
    popq %r13
    popq %r12
    popq %r11
    popq %r10
    popq %r9
    popq %r8


    pushq %r8
    pushq %r9
    pushq %r10
    pushq %r11
    pushq %r12
    pushq %r13
    pushq %r15
	#print diff
	movq $format_diff, %rdi
	movq $0, %rax
	movq %r8, %rsi
	movq %r9, %rdx
	movq %r11, %rcx
	call printf
    popq %r15
    popq %r13
    popq %r12
    popq %r11
    popq %r10
    popq %r9
    popq %r8

    pushq %r8
    pushq %r9
    pushq %r10
    pushq %r11
    pushq %r12
    pushq %r13
    pushq %r15
	#print prod
	movq $format_prod, %rdi
	movq $0, %rax
	movq %r8, %rsi
	movq %r9, %rdx
	movq %r12, %rcx
	call printf
    popq %r15
    popq %r13
    popq %r12
    popq %r11
    popq %r10
    popq %r9
    popq %r8

    pushq %r8
    pushq %r9
    pushq %r10
    pushq %r11
    pushq %r12
    pushq %r13
    pushq %r15
	#print quot
	movq $format_quot, %rdi
	movq $0, %rax
	movq %r8, %rsi
	movq %r9, %rdx
	movq %r13, %rcx
	call printf
    popq %r15
    popq %r13
    popq %r12
    popq %r11
    popq %r10
    popq %r9
    popq %r8
	
    pushq %r8
    pushq %r9
    pushq %r10
    pushq %r11
    pushq %r12
    pushq %r13
    pushq %r15
	#print remainder
	movq $format_rem, %rdi
	movq %r15, %rsi
	movq $0, %rax
	call printf
    popq %r15
    popq %r13
    popq %r12
    popq %r11
    popq %r10
    popq %r9
    popq %r8

	
	cmpq $0, %rbx
	je end_loop
	# Move to the next structure
    	addq $48, %r14

	popq %rbx
    	jmp printlines_loop
	
end_loop:
	leave
	ret
.size printlines, .-printlines





