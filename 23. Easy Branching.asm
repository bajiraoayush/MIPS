.data
	message: .asciiz "High"
	message2: .asciiz "Low"
	
.text
	main:
		li $s0, 14
		li $s1, 10
		
		bgt $s0, $s1, displayHi
		blt $s0, $s1, displayLow
	
		li $v0, 10
		syscall
	
	displayHi:
		li $v0, 4
		la $a0, message
		syscall
		
		li $v0, 10
		syscall
		
	displayLow:
		li $v0, 4
		la $a0, message2
		syscall
		
		li $v0, 10
		syscall