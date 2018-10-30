.data
	message: .asciiz "Enter input string : "
	message2: .asciiz "Enter substring : "
	userInput: .space 20
	subString: .space 3
	endLine: .byte '\n'

.text
	main:
		li $s1, 2 	#$s1 has constant 2 saved in it.
		
		
		li $v0, 4
		la $a0, message
		syscall
				
		li $v0, 8
		la $a0, userInput
		li $a1, 20
		syscall
		
		li $v0, 4
		la $a0, message2
		syscall
		
		li $v0, 8
		la $a0, subString
		li $a1, 3
		syscall
		
		li $v0, 4
		la $a0, endLine
		syscall
		
		lb $s0, endLine		#$s0 conatains endLine character.
		li $t9, 0		#$t9 is counter of while1.
		
		
		while1:
			lb $t1, userInput($t9)		#$t1 is used to print values at $t9.
			beq $t1, $s0, exit
			li $t8, 0			#$t8 is counter of while2.
			addi $s7, $t9, 0
			while2:
				lb $t2, subString($t8)		#$t2 is used to print values at $t8.
				lb $t1, userInput($s7)
				lb $t2, subString($t8)
				addi $s7, $s7, 1
				addi $t8, $t8, 1		#Increment.
				bne $t2, $t1, next		#If substring not equal to string, out.
				beq $t8, $s1, out
				
			#	li $v0, 11
			#	addi $a0, $t2, 0
			#	syscall
				
				j while2
			
			out:
			bne $s1, $t8, next
			addi $t9, $s7, 0
			
			next:			
			li $v0, 11
			lb $a0, userInput($t9)
			syscall
			
			addi $t9, $t9, 1
			j while1
		
		exit:
			li $v0, 10
			syscall
