.data
	message:  .asciiz "The numbers are equal."
	message2: .asciiz "Nothing happaned!"
.text
	
	main:
		addi $t0, $zero, 20
		addi $t1, $zero, 20
		
		beq  $t0, $t1, numbersEqual
		bne  $t0, $t1, numbersNOTequal
	
	numbersEqual:
		li $v0, 4
		la $a0, message
		syscall
		
		jal end
		
	numbersNOTequal:
		li $v0, 4
		la $a0, message2
		syscall
		
		jal end
	
	end:
		# syscall to end program
		li $v0, 10
		syscall