.data
	newLine: .byte '\n'
.text
	addi $s0, $zero, 4
	addi $s1, $zero, 9
	
	div $s1, $s0
	
	mflo $s2	#Quotient is stored in LOW register.
	mfhi $s3	#Remainder is stored on HIGH register.
	
	li $v0, 1		#Printing Quotient.
	add $a0, $zero, $s2
	syscall
	
	li $v0, 4		#Printing Newline.
	la $a0, newLine
	syscall
	
	li $v0, 1		#Printing Remainder.
	add $a0, $zero, $s3
	syscall
