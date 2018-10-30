.data
	adder1: .word 5
	adder2: .word 6
.text

	lw $t0, adder1($zero)	#Load integer(word) in $t
	lw $t1, adder2($zero)
	add $t2, $t0, $t1	#Add $t1 ,$t0 and save it in $t2
	li $v0, 1		#An Integer is to be printed.
	add $a0, $zero, $t2	#To put value of $t2 in register we add it with value of $zero i.e. 0, and the put it. Value of $t2 is in a register and not a variable thus this is done.
	syscall
