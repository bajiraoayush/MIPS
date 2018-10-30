.data
	myMessage: .asciiz "Hey Man! What's up?\n"	#Loading message.
	otherMessage: .asciiz "I'm alright"

.text
	main:
		jal myDisplay		#Calling function.
		
		li $v0, 4		#Printing.
		la $a0, otherMessage
		syscall
	
	li $v0, 10			#Tells program to end. Or else it'll go on infinitely.
	syscall	
		
	myDisplay:			#Defining function.
		li $v0, 4		#Printing.
		la $a0, myMessage
		syscall
		jr $ra			#Jump to register $ra. Basically printing.