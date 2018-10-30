.data 
	myArray: .space 24
	space: .byte ' '
	inputMessage: .asciiz "is prime.\n"
.text
	main:
		li $t0, 20
		li $s0, 2
		li $t7, 1
		li $t6, 0
#		li $t5, 24
		while_input:
			bltz $t0, exit_input
			li $v0, 5
			syscall

			move $t1, $v0
			sw $t1, myArray($t0)
			subi $t0, $t0, 4

			j while_input
		exit_input:

		li $t0, 20
		while_check:
			bltz $t0, exit
			lw $t1, myArray($t0)
			
			addi $a1, $t1, 0
			
			jal is_prime
			
			subi $t0, $t0, 4
			j while_check
		exit:
	li $v0, 10
	syscall
	
		is_prime:
			li $s0, 2
			div $a1, $s0
			mflo $s0
			while_prime:
				beq $t7, $s0, True_prime
				div $a1, $s0
				mfhi $t1
				beqz $t1, False_prime
				subi $s0, $s0, 1
				j while_prime
			False_prime:
				jr $ra
				
			True_prime:
				li $v0, 1
				addi $a0, $a1, 0
				syscall
				
				li $v0, 4
				la $a0, space
				syscall
				
				jr $ra
