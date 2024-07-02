.data
	myArray: .space 12
.text
	addi $s0, $zero, 4
	addi $s1, $zero, 10
	addi $s2, $zero, 12
	
	# Index = $t0
	
	addi $t0, $zero, 0	# i = 0
	sw $s0, myArray($t0)	# myArray[0] = $s0
	
	addi $t0, $t0, 4	# i = 1
	sw $s1, myArray($t0)	# myArray[1] = $s1
	
	addi $t0, $t0, 4	# i = 2
	sw $s2, myArray($t0) 	# myArray[] = $s2
	