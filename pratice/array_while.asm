.data
	array: .space 8
	length: .word 2
.text
.globl main

	main:
		la 	$t0, array		# $t0 = array[0]
		lw 	$t1, length		# $t1 = length
		la    $t5, 0		# $t5 = 0
		li	$t6, 1		# $t6 = 1
		
		la	$t2, 0		# $t2 = 0 ;; i = 0
		
	loop:
		beq $t2, $t1, end		# if i == length : END

		sll $t3, $t2, 2		# $t3 = t2*4 ;; j = 4*i
		add $t4, $t0, $t3		# $t4 = array[j]
		
		sw  $t5, 0($t4) 		# array[j] = $t5
		
		add  $t7, $t5, $zero	# $t7 = $t5 ;; tmp = $t5
		add  $t5, $t6, $t5	# $t5 = $t6 + $t5
		add  $t6, $t7, $zero 	# $t6 = $t7 ;; $t6 = tmp
		
		addi $t2, $t2, 1		# i = i + 1
		j loop
		
	end:
		addi $v0, $zero, 10	# END PROCEDURE
		syscall
