.data
	#Immediate functions are used when constants are used instead of variables or registers.
.text
	li $s1, 10	#Direct loading numbers without variables.
	li, $s0, 4	
	
	mul $t0, $s1, $s0	#Mutiplication.
	
	#Display
	li $v0, 1
	move $a0, $t0
	syscall