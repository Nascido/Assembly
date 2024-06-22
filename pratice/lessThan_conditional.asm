.data
	message: .asciiz "The number is less than the other"
.text
	main:
		
		addi $t0, $zero, 80
		addi $t1, $zero, 6
		
		slt $s0, $t0, $t1
		bne $s0, $zero, printMessage
		
	end:
		# END PROGRAM
		li $v0, 10
		syscall
		
	printMessage:
		
		# Print the message
		li $v0, 4
		la $a0, message
		
		syscall
		
		jal end