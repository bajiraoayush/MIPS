.data


.text
	addi $s0, $zero, 4	#Loading Immediately.
	addi $s1, $zero, 9
	
	div $t0, $s1, $s0	#Quotient of $s1/$s0 saved in $t0.
	
	#Printing.
	li $v0, 1
	add $a0, $zero, $t0
	syscall