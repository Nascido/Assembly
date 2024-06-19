.data
	message: .asciiz "Meu nome e Rafael"
.text
	main:
		jal displayMessage
	
		# O programa acabou
		li $v0, 10
		syscall
		
	displayMessage:
		li $v0, 4
		la $a0, message
		syscall
		
		jr $ra