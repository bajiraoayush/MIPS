.data
	myDouble: .double 7.202
	zeroDouble: .double 0.0	#$zero has integral 0. So we need to define a zero of data type double.
.text
	ldc1 $f0, zeroDouble	#Load double in $f0 of co-processor 1. (A double requires space of 2 registers.)
	ldc1 $f2, myDouble
	li $v0, 3		#A float value is to be printed.
	add.d $f12, $f2, $f0	#Add double and save it in $f12. We use $a0 for integers and characters since they are stored in registers.
				#But to print values stored in co-processor 1 we have to put them in $f12 only.
	syscall
