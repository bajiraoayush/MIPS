.data


.text
	main:
		addi $t0, $zero, 0

		while:
			bgt $t0, 10, exit	#Braching (Basically the condition).

			li $v0, 1		#Printing.
			addi $a0, $t0, 0
			syscall
			
			addi $t0, $t0, 1	#Increment.
			j while			#Jump back to while

		exit:				#Ending loop.

		li $v0, 10
		syscall

	li $v0, 10
		syscall
