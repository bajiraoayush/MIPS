.data
	Message: .asciiz " is the sum.\n"
.text
	
	main:
		
		addi $a1, $zero, 15	#Arguments. Convention is to save in $a regisetrs.
		addi $a2, $zero, 5
		
		jal addNumbers		#Function call.
		
		li $v0, 1		#Printing return value of function. 
		addi $a0, $v1, 0
		syscall
		
		li $v0, 4		#Printing a message.
		la $a0, Message
		syscall
		
		
	li $v0, 10			#Terminating program.
	syscall
	
	addNumbers:
		add $v1, $a1, $a2	#Saving answer of function in register which will be returned. Convention is to save in $v registers.
		jr $ra
	
