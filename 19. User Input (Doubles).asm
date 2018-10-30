.data
	prompt: .asciiz "Enter value of PI : "
	message: .asciiz "\nValue of PI is "
	zeroFloat: .double 0.0
.text
	main:
		lwc1 $f0, zeroFloat
		
		la $a1, prompt
		jal printString
		
		li $v0, 7			# 7 for getting double input.
		syscall
	
		la $a1, message
		jal printString
		
		li $v0, 3
		add.d $f12, $f2, $f0		#Double precision addition. $f2 because value of input is saved in whichever $f is unallocated.
		syscall
	
	li $v0, 10
	syscall
	
	printString:
		li $v0, 4
		add $a0, $a1, $zero
		syscall
		
		jr $ra
