.data
	myArray: .space 12
	newLine: .byte '\n'

.text
	li $s0, 4
	li $s1, 10
	li $s2, 8
	
	li $t0, 0
	
	sw $s0, myArray($t0)
	addi $t0, $t0, 4
	sw $s1, myArray($t0)
	addi $t0, $t0, 4
	sw $s2, myArray($t0)
	
	
	while:
		bltz $t0, exit
		lw $t6, myArray($t0)
		li $v0, 1
		addi $a0, $t6, 0
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		subi $t0, $t0, 4
		j while
		
	exit:
		li $v0, 10
		syscall