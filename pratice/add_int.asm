.data
	number1:	.word 34
	number2:	.word 890

.text
	lw $t0, number1($zero)	# t0 --> number1
	lw $t1, number2($zero)	# t1 --> number2
	
	add $t2, $t0, $t1		# t2 = t0 + t1
