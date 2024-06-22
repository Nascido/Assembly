.data
	message:  .asciiz "The numbers are equal."
	message2: .asciiz "Nothing happaned!"
.text
	
	main:
		addi $t0, $zero, 5
		addi $t1, $zero, 20
		
		jal end
	
	end:
		# syscall to end program
		li $v0, 10
		syscall