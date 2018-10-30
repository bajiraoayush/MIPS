.data
	message: .asciiz "Enter input text : "
	userInput: .space 20
	endLine: .byte '\n'
	
.text
	main:
		li $v0, 4
		la $a0, message
		syscall
				
		li $v0, 8
		la $a0, userInput
		li $a1, 20
		syscall
		
		li $v0, 4
		la $a0, userInput
		syscall
		
		jal reverseString
		
		
		li $v0, 10
		syscall
	
	reverseString:
		lb $s0, endLine
		li $t0, 0
		li $t1, 1
		while1:
			beq $t1, $s0, while2
			lb $t1, userInput($t0)
			addi $t0, $t0, 1
			j while1
		
		while2:
			bltz $t0, end
			li $v0, 11
			lb $a0, userInput($t0)
			syscall
			addi $t0, $t0, -1
			j while2 
		
		end:
			jr $ra
