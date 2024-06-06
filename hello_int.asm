.data
	age: .word 23 # This is a word or Integer
.text
	# Print an Integer to the screen.
	li $v0, 1
	lw $a0, age
	syscall