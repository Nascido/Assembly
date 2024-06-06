# Exercicio 2: Classe de endereço IPV4 (verão 2)
# Classe do enedreço IP
# Classe A: Primeiro bit é 0 (zero)
# Classe B: Primeiros dois bits são 10 (um, zero)
# Classe C: Primeiros três bits são 110 (um, um, zero)
# Classe D: (endereço multicast): Primeiros quatro bits são: 1110 (um, um, um, zero)
# Classe E: (endereço especial reservado): Primeiros quatro bits são 1111 (um, um, um, um)
.data
A_:	.word	0
B_:	.word	0
C_:	.word	0
D_:	.word	0
E_:	.word	0
#IPV4addr:	.word	0x7EFFFFFF 	# 01111110 11111111 11111111 11111111 ou 126.255.255.255 Classe A)
#IPV4addr:	.word	0xBEFFFFFF 	# 10111110 11111111 11111111 11111111 ou 126.255.255.255 Classe B)
IPV4addr:	.word	0xDCFFFFFF 	# 11011100 11111111 11111111 11111111 ou 126.255.255.255 Classe C)
#IPV4addr:	.word	0xE6FFFFFF 	# 11100110 11111111 11111111 11111111 ou 126.255.255.255 Classe D)
#IPV4addr:	.word	0xF1FFFFFF 	# 11110001 11111111 11111111 11111111 ou 126.255.255.255 Classe E)
.text
lw	$s0, IPV4addr
li	$t2, 1
testaA_:
srl	$t0, $s0, 31
bne     $t0, $zero, testaB_		# if $t0 != 0 entao verifica se é classe B
sw	$t2, A				# A = 1 (é classe A)
j 	exit_
testaB_:
li	$t1, 2				# $t1 = 10b
srl	$t0, $s0, 30
bne     $t0, $t1, testaC_		# if $t0 != 10b entao verifica se é classe C
sw	$t2, B				# B = 1 (é classe B)
j 	exit_
testaC_:
li	$t1, 6				# $t1 = 110b
srl	$t0, $s0, 29
bne     $t0, $t1, testaD_		# if $t0 != 110b entao verifica se é classe D
sw	$t2, C				# C = 1 (é classe C)
j 	exit_
testaD_:
li	$t1, 14				# $t1 = 1110b
srl	$t0, $s0, 28
bne     $t0, $t1, testaE_		# if $t0 != 1110b entao classe é E
sw	$t2, D				# D = 1 (é classe D)
j 	exit_
testaE_:
sw	$t2, E
exit_:



	
# Exercicio 2: Classe de endereço IPV4
# Classe do enedreço IP
# Classe A: Primeiro bit é 0 (zero)
# Classe B: Primeiros dois bits são 10 (um, zero)
# Classe C: Primeiros três bits são 110 (um, um, zero)
# Classe D: (endereço multicast): Primeiros quatro bits são: 1110 (um, um, um, zero)
# Classe E: (endereço especial reservado): Primeiros quatro bits são 1111 (um, um, um, um)
.data
A:	.word	0
B:	.word	0
C:	.word	0
D:	.word	0
E:	.word	0
#IPaddr:	.word	0x7EFFFFFF 		# 01111110 11111111 11111111 11111111 ou 126.255.255.255 Classe A)
#IPaddr:	.word	0xBEFFFFFF 	# 10111110 11111111 11111111 11111111 ou 126.255.255.255 Classe B)
#IPaddr:	.word	0xDCFFFFFF 	# 11011100 11111111 11111111 11111111 ou 126.255.255.255 Classe C)
#IPaddr:	.word	0xE6FFFFFF 	# 11100110 11111111 11111111 11111111 ou 126.255.255.255 Classe D)
IPaddr:	.word	0xF1FFFFFF 	# 11110001 11111111 11111111 11111111 ou 126.255.255.255 Classe E)
mascA: 	.word   0x7FFFFFFF 		# 01111111 11111111 11111111 11111111 ou 127.255.255.255
mascB: 	.word   0xBFFFFFFF 		# 10111111 11111111 11111111 11111111 ou 191.255.255.255
mascC: 	.word   0xDFFFFFFF 		# 11011111 11111111 11111111 11111111 ou 223.255.255.255
mascD: 	.word   0xEFFFFFFF 		# 11101111 11111111 11111111 11111111 ou 239.255.255.255
.text
lw	$s0, IPaddr
li	$t2, 1
testaA:
lw	$t0, mascA
or      $t1, $t0, $s0 			# $t1 = mascA | IPaddr
bne	$t1, $t0, testaB		# if $t1 != mascA entao verifica se é classe B
sw	$t2, A				# A = 1 (é classe A)
j 	exit
testaB:
lw	$t0, mascB
or      $t1, $t0, $s0 			# $t1 = mascB | IPaddr
bne	$t1, $t0, testaC		# if $t1 != mascB entao verifica se é classe C
sw	$t2, B				# B = 1 (é classe B)
j	exit
testaC:
lw	$t0, mascC
or      $t1, $t0, $s0 			# $t1 = mascC | IPaddr
bne	$t1, $t0, testaD		# if $t1 != mascC entao verifica se é classe D
sw	$t2, C				# C = 1 (é classe C)
j	exit
testaD:
lw	$t0, mascD
or      $t1, $t0, $s0 			# $t1 = mascD | IPaddr
bne	$t1, $t0, testaE		# if $t1 != mascD entao verifica se é classe E
sw	$t2, D				# D = 1 (é classe D)
j	exit
testaE:
sw	$t2, E				# E = 1 (é classe E)				
exit:

# Exercicio 1: Máximo
.data
v1:	.word	20
v2:	.word	15
max:	.word	
.text
lw	$s0, v1
lw	$s1, v2
bge	$s0, $s1, v1_maior 	# if v1 >= v2
v2_maior:
sw	$s1, max	
j	fim
v1_maior:
sw	$s0, max		
fim:
