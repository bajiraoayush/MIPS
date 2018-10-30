.data
	message: .asciiz "Enter the number upto which you want the sequence : "
	newLine: .byte '\n'
.text
	main:
		addi $t0, $zero, 1
		addi $t1, $zero, 0
		addi $t2, $zero, 1
		
		li $v0, 4
		la $a0, message
		syscall
		
		li $v0, 5
		syscall
		move $s0, $v0
		
		while:
			bgt $t0, $s0, exit
			
			li $v0, 1
			add $a0, $t1, $zero
			syscall
			
			li $v0, 4
			la $a0, newLine
			syscall
			
			add $t1, $t1, $t2
			
			jal swap
			
			addi $t0, $t0, 1
			j while
			
		exit:
			li $v0, 10
			syscall
			
	li $v0, 10
	syscall
	
	swap:
		add $t1, $t1, $t2
		sub $t2, $t1, $t2
		sub $t1, $t1, $t2
		
		jr $ra
