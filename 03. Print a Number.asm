.data
	number: .word 69

.text
	li $v0, 1	#An Integer is to be printed.
	lw $a0, number	#Load the integer in $a0.
	syscall
