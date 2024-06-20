.data
	newline: .asciiz "\n"
.text
	main:
		addi	$s0, $zero, 10
		
		jal increaseRegister
		
		jal printNewline
		jal printValue
		
		jal endProgram
		

	increaseRegister:
		addi	$sp, $sp, -8
		sw	$s0, 0($sp)
		sw	$ra, 4($sp)

		addi	$s0, $s0, 30
		
		# Nested Procedure
		
		jal printValue
		
		# Load the old value
		lw $s0, 0($sp)
		lw $ra, 4($sp)
		
		addi $sp, $sp, 8
		
		jr $ra
	
	printValue:
		# Print Value
		li $v0, 1
		move $a0, $s0
		syscall
		
		jr $ra

	printNewline:
		# Print a New Line
		li $v0, 4
		la $a0, newline
		syscall
		jr $ra
		
	endProgram:
		# End Program
		li	$v0, 10
		syscall