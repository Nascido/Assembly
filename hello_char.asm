.data
	myChar: .byte 'R'
.text
	li $v0, 4
	la $a0, myChar
	syscall