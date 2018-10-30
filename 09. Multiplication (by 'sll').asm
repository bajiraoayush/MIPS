.data

.text
	li $s0, 200		#Direct loading.
	sll $t0, $s0, 2		#Shift binary in $so by 2 bits to the left and sve it in $t0.
	
	#Display.
	li $v0, 1
	move $a0, $t0
	syscall