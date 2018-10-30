.data
	num1: .word 30
	num2: .word 22
.text
	lw $s0, num1		#Loading words.
	lw $s1, num2

	sub $t0, $s0, $s1	#Subtraction.
	
	li $v0, 1		#Integer to be printed.
	move $a0, $t0		#We can add or sub zero from $t0 or this move method can be used.
	syscall
