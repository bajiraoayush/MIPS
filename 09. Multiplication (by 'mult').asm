.data

.text
	li $s1, 200	#Direct loading.
	li $s0, 100
	
	mult $s1, $s0	#Can save overflow values too.
	mflo $t0	#mflo = Move from low. And $t0 is the register in which the value is being moved.
	
	#Display.
	li $v0, 1
	move $a0, $t0
	syscall
