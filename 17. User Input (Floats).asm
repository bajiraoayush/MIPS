.data
	prompt: .asciiz "Enter value of PI : "
	message: .asciiz "\nValue of PI is "
	zeroFloat: .float 0.0
.text
	main:
		lwc1 $f0, zeroFloat
		
		la $a1, prompt
		jal printString
		
		li $v0, 6			# 6 for getting float input.
		syscall
	
		la $a1, message
		jal printString
		
		li $v0, 2
		add.s $f12, $f2, $f0		#Single precision addition. $f1 because value of input is saved in whichever $f is unallocated.
		syscall
	
	li $v0, 10
	syscall
	
	printString:
		li $v0, 4
		add $a0, $a1, $zero
		syscall
		
		jr $ra
