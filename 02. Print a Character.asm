.data
	myCharacter: .byte 'a'	#'.byte' specifies the data type,
.text
	li $v0, 4		#Printing a character.
	la $a0, myCharacter	#Loading into $a0 to be printed.
	syscall			#Print.
