.data
	newLine: .asciiz " \n"
.text
	
	main:
		addi $s0, $zero, 15
		
		jal increaseValue		#Calling Function.
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		addi $a1, $s0, 0		#Passing Argumennt.
		jal printValueOfArg
		
	li $v0, 10				#Terminates program.
	syscall
	
	increaseValue:
		addi $sp, $sp, -8		#Allocating 4 bytes in stack.
		sw $s0, 0($sp)			#Save word in $s0 in 1st(0) position.
		sw $ra, 4($sp)
		
		addi $s0, $s0, 10	
		
		addi $a1, $s0, 0
		jal printValueOfArg
		
		lw $s0, 0($sp)			#Load word.
		lw $ra, 4($sp)
		addi $sp, $sp, 8		#Restoring stack.
		
		jr $ra

	printValueOfArg:
		li $v0, 1			#Prints value saved in argument.
		move $a0, $a1
		syscall
		
		jr $ra
