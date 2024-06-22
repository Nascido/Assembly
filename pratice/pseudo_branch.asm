.data
	message: .asciiz "Hi, how are you?"
.text
	main:
		addi $s0, $zero, 14
		addi $s1, $zero, 10
		
		bgt $s0, $s1, displayHI
		
	end:
		# End Program
		li $v0, 10
		syscall
		
	displayHI:
		li $v0, 4
		la $a0, message
		syscall
		
		jal end