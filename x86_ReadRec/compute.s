# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
# TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. 

# Brett Emory
# x86-64 Assembler code for compute().

.file "compute.s"
.section .rodata

.text
.globl compute
.type compute, @function

compute:
    	pushq %rbp
    	movq %rsp, %rbp

    	# Arguments:
    	# %rdi: Pointer to the array of structures (struct Record *rptr)
    	# %rsi: Number of structures (int count)

    	movq %rdi, %r14
    	movq %rsi, %r12

compute_loop:
    	decq %r12
    	jl end_of_compute

	
    # Load values from the structure
    	movl 4(%r14), %r8d       # value1 (32-bit)
    	movl (%r14), %r9d        # value2 (32-bit)

	pushq %r8
	pushq %r9
    # Compute sum (value1 + value2)
    	addl %r8d, %r9d          # Sum
    	movl %r9d, 24(%r14)      # Store in the structure
	popq %r9
	popq %r8

	pushq %r8
	pushq %r9
    # Compute difference (value1 - value2)
    	subl %r9d, %r8d          # Difference
    	movl %r8d, 8(%r14)       # Store in the structure
	popq %r9
	popq %r8

	pushq %r8
	pushq %r9
    # Compute product (value1 * value2)
    	imull %r9d, %r8d         # Product (lower 32 bits)
    	movl %r8d, 40(%r14)      # Store in the structure
	popq %r9
	popq %r8

	pushq %r8
	pushq %r9
    # Compute quotient (value1 / value2) and move remainder into remainder member
    	movl $0, %edx            # Clear upper 32 bits in %edx (for signed division)
    	movl %r8d, %eax          # Load value1 into %eax
    	idivl %r9d               # Divide %edx:%eax by %r9d; result in %eax, remainder %edx
    	movl %eax, 16(%r14)      # Store quotient in the structure
    	movl %edx, 32(%r14)      # Store remainder in the structure
	popq %r9
	popq %r8

	cmpq $0, %r12
	je end_of_compute
    # Move to the next structure
    	addq $48, %r14

    # Continue the loop
    jmp compute_loop

end_of_compute:
    leave
    ret
.size compute, .-compute

