.data
	newLine: .asciiz " \n"
.text
	
	main:
		addi $s0, $zero, 15
		
		jal increaseValue
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		jal printValues
		
	li $v0, 10		#Terminates program.
	syscall
	
	increaseValue:
		addi $sp, $sp, -8	#Allocating 4 bytes in stack.
		sw $s0, 0($sp)		#Save word in $s0 in 1st(0) position.
		sw $ra, 4($sp)
		
		addi $s0, $s0, 10	
		
		jal printValues
		
		lw $s0, 0($sp)		#Load word.
		lw $ra, 4($sp)
		addi $sp, $sp, 8	#Restoring stack.
		
		jr $ra

	printValues:
		li $v0, 1		#Prints.
		move $a0, $s0
		syscall
		
		jr $ra