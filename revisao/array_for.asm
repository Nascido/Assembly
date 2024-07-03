.data
	i:	   .word 0
	lenght:  .word 5
	array:   .space 20

.text
.globl main

	main:
		sw $zero, i		# i = 0
		la $s0, array	# $s0 = *array[0]
		
		lw $t0, i		# $t0 <==> i
		lw $s1, lenght	# $s1 <==> lenght
	loop:
		bge $t0, $s1, end
		
		sll $t1, $t0, 2	# $t1 = i*4 	 
		add $t2, $s0, $t1 # $t2 = *array[i]
		
		addi $t3, $t0, 1  # $t3 = i+1
		mul $t3, $t3, 10  # $t3 = (i+1) * 10
	
		sw $t3, 0($t2)	# array[i] = (i+1) * 10
		
		addi $t0, $t0, 1	# $t0 = $t0 + 1
		sw $t0, i		# i = $t0
		
		jal loop
	
	end:
		addi $v0, $zero, 10 # END PROCEDURE
		syscall

