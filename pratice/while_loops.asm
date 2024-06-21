.data
	message: .asciiz "After while loop is done"
	newLine: .asciiz "\n"
.text
	main:
		addi $t0, $zero, 0 		# i = 0
		
		while:
			bgt  $t0, 10 exit
			addi $t0, $t0, 1		# i++ 
			jal printNumber
			
			j while
			
		exit:
			jal printMessage
			
	end:
		# End of Program
		li $v0, 10
		syscall
	
	printNumber:
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 1
		add $a0, $zero, $t0
		syscall
		
		jr $ra
		
	printMessage:
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message
		syscall
		
		jr $ra
		