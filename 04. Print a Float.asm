.data
	PI: .float 3.1419
.text
	li $v0, 2	#Print a float vslue.
	lwc1 $f12, PI	#Load PI into co-processor 1 in its $f12 register. Floats are saved in co-processor 1.
	syscall		#Print.
