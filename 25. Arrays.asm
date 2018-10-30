.data
	myArray: .space 12

.text
	li $s0, 85
	li $s1, 10
	li $s2, 8
	
	li $t0, 0
	
	sw $s0, myArray($t0)
	addi $t0, $t0, 4
	sw $s1, myArray($t0)
	addi $t0, $t0, 4
	sw $s2, myArray($t0)
	
	lw $t6, myArray($zero)
	
	li $v0, 1
	addi $a0, $t6, 0
	syscall
