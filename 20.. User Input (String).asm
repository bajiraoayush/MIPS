.data
	prompt: .asciiz "Enter you name : \n"
	message: .asciiz "\nYour name is "
	userInput: .space 10
.text
	main:
		
		la $a1, prompt
		jal printString
		
		li $v0, 8			# 8 for getting string input.
		la $a0, userInput		#Tells which variable will store thr input.
		li $a1, 10			#Tells the length of the input.
		syscall
	
		la $a1, message
		jal printString
		
		la $a1, userInput		#Printing
		jal printString
		
	
	li $v0, 10
	syscall
	
	printString:
		li $v0, 4
		add $a0, $a1, $zero
		syscall
		
		jr $ra
