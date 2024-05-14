# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
# TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. 

# Brett Emory
# x86-64 Assembler code for program readrec().

#directives for the file

.file "readrec.s"
.section .rodata

mode:
	.string "r"		#file mode for fopen
nea: 
	.string "Incorrect Arguments"
.data
.text
.globl main
.type	main, @function
main:
	pushq %rbp
	movq %rsp, %rbp


	# Check if there are enough command line arguments
	cmpq $3, %rdi
	je equal

not_equal:
	movq $0, %rax
	movq $nea, %rdi
	call printf
	jmp exit

equal:	
				
	
	movq 8(%rsi), %rdi	#argv[1]
	movq 16(%rsi), %r13	#argv[2] is the filename
	call atoi
	movq %rax, %r12			# r12 now has the integer value of argv[1]
				# Allocate memory for structures
	movq %rax, %rdi
	movq $48, %rsi
	call calloc
	movq %rax, %r14 	#r14 now has the address to the begining of the allocated 					#memory for all of the structures

	#Open File
	movq $0, %rax
	movq %r13, %rdi
	movq $mode, %rsi
	push %rdi
	call fopen
	movq %rax, %r13		#r13 has the file pointer
	popq %rdi

	#call readlines
	

	pushq %r12
	pushq %r13
	pushq %r14
	movq %r13, %rdi
	movq %r14, %rsi
	movq %r12, %rdx
	call readlines
	popq %r14
	popq %r13
	popq %r12
	
	pushq %r12
	pushq %r13
	pushq %r14
	#close the file
	movq $0, %rax
	movq %r13, %rdi
	call fclose
	popq %r14
	popq %r13
	popq %r12
	

	pushq %r12
	pushq %r13
	pushq %r14
	#call compute rdi-> base pointer r14   rsi -> count r12
	movq %r14, %rdi
	movq %r12, %rsi
	call compute
	popq %r14
	popq %r13
	popq %r12

	pushq %r12
	pushq %r13
	pushq %r14
	#call printlines rdi-> base pointer r14   rsi -> count r12
	movq %r14, %rdi
	movq %r12, %rsi
	call printlines
	popq %r14
	popq %r13
	popq %r12
	
	movq %r14, %rdi
	call free
	

exit:
	leave
	ret

.size main, .-main









