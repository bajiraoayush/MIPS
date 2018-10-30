.data
	myMessage: .asciiz "Hello World\n"	#Giving name to the string, i.e. assigning it to a variable.

.text
	li $v0, 4		#This tells that a character value(s) has to be printed.
	la $a0, myMessage	#We put myMessage in $a0 because whatever is in $a0, it comes as output.
	syscall			#This tell the program to do whta its told. (For now, to print.)
