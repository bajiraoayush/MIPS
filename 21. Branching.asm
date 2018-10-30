.data
	message: .asciiz "Equal"
	message2: .asciiz "Not Equal"
	
.text
	main:
		addi $t0, $zero, 10
		addi $t1, $zero, 20
		
		beq $t0, $t1, numbersEqual
		bne $t0, $t1, numbersNotEqual
		li $v0, 10
		syscall
	
	numbersEqual:
		li $v0, 4
		la $a0, message
		syscall
	
		li $v0, 10
		syscall
		
		
	numbersNotEqual:
		li $v0, 4
		la $a0, message2
		syscall
	
		li $v0, 10
		syscall