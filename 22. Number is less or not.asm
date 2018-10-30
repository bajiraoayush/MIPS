.data
	message: .asciiz "The number is less than the other"

.text
	main:
		li $t0, 0
		li $t1, 2
	
		slt $s0, $t0, $t1
	
		bne $s0, $zero, myMessage
		
		li $v0, 10
		syscall
	
	myMessage:
		li $v0, 4
		la $a0, message
		syscall