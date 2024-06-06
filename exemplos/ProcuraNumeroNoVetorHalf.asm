.eqv  TAM_VET      10
.data
vet: 	.half  11, 12, 13, 4, 15, 6, 5, 38, 11, 7  
n:	.half  22  
       
.text
	la	$a0, vet		# Pega o endereço do primeiro byte de VET[0]
	lh   	$a1, n 
	li   	$t1, TAM_VET
	li    	$t0, 0			# índice
      
       
 loop:       
      	sll	$t2, $t0, 1  		# Multiplica índice por 2^1, já que cada posição do vetor ocupa dois bytes
	add	$a2, $a0, $t2		# Endereço de vet[i]
	lh	$t3, 0($a2)		# Pega elemento vet[i]
      	beq     $t3, $a1, encontrou     # Endereço do próximo elemento a partir do início de VET[0]
      	addi	$t0, $t0, 1 		# i++;
       	blt     $t0, $t1, loop		# pesquisa próxima posição
        li	$t0, -1      		# Percorreu todo vetor e não encontrou
encontrou:      						
	li	$v0,10			# Termina o programa 
	syscall    

