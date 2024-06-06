.data 
	msg_str: 		.asciiz "Entre com o número: "

.text
	.globl main
	la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# Lê em $v0 o valor digitado pelo usuário
	move		$a0,$v0			# Coloca em $a0 o valor 
		la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# Lê em $v0 o valor digitado pelo usuário
	move		$a1,$v0			# Coloca em $a1 o valor 
main:
   	jal max
	move	        $a0,$v0			# Pega o resultado calculado fatorial de $v0 e copia para $a0
	li		$v0,1			# 
	syscall					# Imprime o resultado
	li		$v0,10			# 
	syscall		
max:
   	slt 		$t0, $a0, $a1
   	beq 		$t0,$zero, prim_maior
seg_maior:
   	move		 $v0, $a1
   	jr		 $ra
prim_maior:
   	move		 $v0, $a0
   	jr		 $ra
