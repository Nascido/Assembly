.eqv  TAM_VET      10
.data
vet: 	.half  11, 12, 13, 4, 15, 6, 5, 38, 11, 7  
n:	.half  22  
       
.text
	la	$a0, vet		# Pega o endere�o do primeiro byte de VET[0]
	lh   	$a1, n 
	li   	$t1, TAM_VET
	li    	$t0, 0			# �ndice
      
       
 loop:       
      	sll	$t2, $t0, 1  		# Multiplica �ndice por 2^1, j� que cada posi��o do vetor ocupa dois bytes
	add	$a2, $a0, $t2		# Endere�o de vet[i]
	lh	$t3, 0($a2)		# Pega elemento vet[i]
      	beq     $t3, $a1, encontrou     # Endere�o do pr�ximo elemento a partir do in�cio de VET[0]
      	addi	$t0, $t0, 1 		# i++;
       	blt     $t0, $t1, loop		# pesquisa pr�xima posi��o
        li	$t0, -1      		# Percorreu todo vetor e n�o encontrou
encontrou:      						
	li	$v0,10			# Termina o programa 
	syscall    

