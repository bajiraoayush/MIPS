.data
	prompt: .asciiz "Enter Age : "
	message: .asciiz "\nYour age is "
.text
	main:
		la $a1, prompt
		jal printString
		
		li $v0, 5		# 5 for getting integer input and it is saved in $v0.
		syscall
		
		move $t0, $v0		#Storing value saved in $v in $t0. Note that it itself adds a newline character at the end.
	
		la $a1, message		#Argument
		jal printString		#Function
		
		li $v0, 1		#Printing the age.
		addi $a0, $t0, 0
		syscall
	
	li $v0, 10
	syscall
	
	printString:
		li $v0, 4
		add $a0, $a1, $zero
		syscall
		
		jr $ra