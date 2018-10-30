.data
	text: .asciiz "Enter the size of the array :"
	end: .asciiz "Sum is :"
	 array: .align 4
	        .space 400  
.text
	li $v0,4
	la $a0,text
	syscall
	addi $t2,$zero,0
	addi $t3,$zero,0
	addi $t4,$zero,0
	li $v0,5
	syscall
	addi $t1,$v0,0
	
	loop:
		li $v0,5
		syscall
		addi $s1,$v0,0
		sw $s1,array($t3)
		add $t4,$t4,$s1
		addiu  $t3,$t3,4
		addi $t2,$t2,1
		bne $t2,$t1,loop
	li $v0,4
	la $a0,end
	syscall
	li $v0,1
	addi $a0,$t4,0
	syscall	
