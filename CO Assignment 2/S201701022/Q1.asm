.data
	message: .asciiz "Enter the number upto which you want the sequence : "		#Prompt.
	newLine: .byte '\n'
.text
	main:
		addi $t0, $zero, 1		#Loading numbers in registers.
		addi $t1, $zero, 0
		addi $t2, $zero, 1
		
		li $v0, 4			#Printing prompt.
		la $a0, message
		syscall
		
		li $v0, 5			#Taking user input.
		syscall
		move $s0, $v0
		
		while:				#Loop label.
			bgt $t0, $s0, exit	#Condition.
			
			li $v0, 1		#Printing integer.
			add $a0, $t1, $zero
			syscall
			
			li $v0, 4		#Printing new line character.
			la $a0, newLine
			syscall
			
			add $t1, $t1, $t2	#Addition
			
			jal swap		#Calling swap function.
			
			addi $t0, $t0, 1	#Incremment.
			j while			#Jump statement for loop.
			
		exit:				#Exit label to end program.
			li $v0, 10
			syscall
			
	li $v0, 10
	syscall
	
	swap:					#Swap function definition.
		add $t1, $t1, $t2
		sub $t2, $t1, $t2
		sub $t1, $t1, $t2
		
		jr $ra				#Jumping back to caller function.