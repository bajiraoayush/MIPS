.data
	message: .asciiz "The GCD is "
	input: .asciiz "Enter a number : "
.text
	main:
		addi $t5, $zero, 1
		
		li $v0, 4
		la $a0, input
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 4
		la $a0, input
		syscall
		
		li $v0, 5
		syscall
		move $t1, $v0
		
		addi $t2, $t0, 0
		while_main:
			beq $t2, $t5, exit_main
		
			div $t1, $t2
			mfhi $s0
			beqz $s0, $t1_is_divisible
			try:                                  # Doesn't matter
			subi $t2, $t2, 1
		
			j while_main
		
		exit_main:
			li $v0, 4
			la $a0, message
			syscall
			
			li $v0, 1
			addi $a0, $a1, 0
			syscall
			
			li $v0, 10
			syscall

			
			
	$t1_is_divisible:
		div $t0, $t2
		mfhi $s0
		beqz $s0, exit
		j try
		
		exit:
			li $v0, 4
			la $a0, message
			syscall
			
			li $v0, 1
			addi $a0, $t2, 0
			syscall
			
			li $v0, 10
			syscall
