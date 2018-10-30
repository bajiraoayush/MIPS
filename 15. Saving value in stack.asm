.data
	newLine: .asciiz " \n"
.text
	
	main:
		addi $s0, $zero, 15
		
		jal increaseValue
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 1		#Prints.
		move $a0, $s0
		syscall
		
		
	li $v0, 10		#Terminates program.
	syscall
	
	increaseValue:
		addi $sp, $sp, -4	#Allocating 4 bytes in stack.
		sw $s0, 0($sp)		#Save word in $s0 in 1st(0) position.
		
		addi $s0, $s0, 10	
		
		li $v0, 1		#Print.
		move $a0, $s0
		syscall
		
		lw $s0, 0($sp)		#Load word.
		addi $sp, $sp, 4	#Restoring stack.
		
		jr $ra