.data
	isArm: .asciiz " is an Armstrong Number"
	isNotArm: .asciiz " is not an Armstrong Number"
	input: .asciiz "Enter the number you want to check : "
	newLine: .byte '\n'
.text
	main:
		addi $t0, $zero, 10			#Saved 10 for division.
		addi $t1, $zero, 1
		addi $s0, $zero, 0			#Register $s0 will have the sum.
		addi $s1, $zero, 0			#Register $s1 will have the number of digits.
		
		li $v0, 4				#Printing input message.
		la $a0, input
		syscall
		
		li $v0, 5				#Taking integer input.
		syscall
		
		addi $s2, $v0, 0			#Saving input in $s2.
		
		while_main:
			beqz $v0, exit
			
			div $v0, $v0, $t0
			addi $s1, $s1, 1
			
			b while_main
		exit:
			#li $v0, 10
			#syscall
			
		addi $a1, $s2, 0				#Argument for 'digits' saved.
	
		jal digits				#Calling 'digits'.
		
		beq $s0, $s2, True
		bne $s0, $s2, False
		
		True:
			li $v0, 4				#Printing input message.
			la $a0, isArm
			syscall
			li $v0, 10
			syscall
			
		False:
			li $v0, 4				#Printing input message.
			la $a0, isNotArm
			syscall
			li $v0, 10
			syscall
		 
	li $v0, 10
	syscall
	
	
	
	power:
		while_power:
			beqz $a2, exit_power
			mult $a1, $t1 
			
			mflo $t1
			
			subi $a2, $a2, 1
			j while_power
		
		exit_power:
			add $s0, $s0, $t1
			li $t1, 1
			#li $v0, 10
			#syscall

		jr $ra
	
	
			
	digits:
		while_digits:
			beqz $a1, exit_digits
			div $a1, $t0				
			
			mflo $a1
			mfhi $t2
			
			addi $sp, $sp, -8
			sw $ra, 0($sp)
			sw $a1, 4($sp)
			
			addi $a1, $t2, 0
			addi $a2, $s1, 0
			
			jal power
						
			
			lw $ra, 0($sp)
			lw $a1, 4($sp)
			addi $sp, $sp, 8
			
			j while_digits
			
		exit_digits:
		#li $v0, 10
		#syscall
		
		jr $ra
