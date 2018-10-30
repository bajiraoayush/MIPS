.data

.text
	addi $s0, $zero, 200		#Another way of loading.
	li $s1, 2			#Direct loading.
	div $t0, $s0, $s1		
	
	#Display.
	li $v0, 1
	add $a0, $zero, $t0		#Same way of loading as above.
	syscall
