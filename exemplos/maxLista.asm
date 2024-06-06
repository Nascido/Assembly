	.data
n:	.word	5		#Tamanho da lista
i:	.word	1
max: 	.word   0
Lista:	.word	3, 11, 13, 9, 10# Lista

.text
	la   	$a0, n		# Carrega end. de n
	la   	$a1, i		# Carrega end. de i
	la   	$t4, Lista	# Carrega end. de Lista

	la   	$a3, max  	# Carrega end. de max
	 		
    	add 	$s3, $t4, $zero
      	lw  	$s0, ($t4)	# max := Lista[1]
      	lw  	$s1, 0($a1)
      	lw  	$s2, 0($a3)
      	lw  	$t2, 0($a0)  
      	addi 	$t2, $t2, 1
	li  	$s1, 1		# i:=1
	li 	$t5, 4
repeat:
 	lw  	$s3, ($t4)
 	add  	$t4, $t4, $t5
          
 	slt 	$t0, $s0, $s3
 	beqz 	$t0, fimse	# if  Lista[i] > max 
then:	add  	$s0, $s3, $zero # max := Lista[i]
fimse:    
        addi 	$s1, $s1, 1  	# i := i + 1;\\
        slt  	$t0,  $s1, $t2 
        bne  	$t0, $zero, repeat # until i > n
        sw   	$s0, ($a3)
