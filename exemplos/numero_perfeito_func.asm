.data
N:	.word 100
.text
lw	$a0, N
jal souPerfeito
move 	$s0, $v0
li 	$v0,10
syscall

souPerfeito:				# inteiro souPerfeito(int n){
  					# int metade, divs, i;
li	$t0, 2
div  	$a0, $t0			# 
mfhi 	$t1 				# copia o resto para $t1
bne	$t1, $zero, NaoSouPerfeito      # if (n%2 == 0){ // Só se conhecem perfeitos pares
mflo 	$t2 				#   metade = n/2;
    					#   i = 2; (// $t0)
li	$t3, 1				#   divs = 1;
while:
bgt    	$t0, $t2, fimwhile		#   while(i<=metade){
div   	$a0, $t0			
mfhi 	$t1 				# copia o resto para $t1
bnez    $t1, fimse			#     if (n%i == 0)
add     $t3, $t3, $t0			#       divs = divs + i;
fimse:
addi	$t0, $t0, 1      		#     i++; 
j	while				#   }  	 
fimwhile: 
bne	$t3, $a0, NaoSouPerfeito    	#  if (divs ==  n) 
li	$v0, 1				#    return 1;
jr	$ra				#
NaoSouPerfeito:
move	$v0,$zero			#   return 0;
jr	$ra				# }    



