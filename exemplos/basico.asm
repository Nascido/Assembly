.data 
	msg_str: 		.asciiz "Entre com o n�mero: "

.text
	.globl main
	la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# L� em $v0 o valor digitado pelo usu�rio
	move		$s0,$v0			# Coloca em $s0 o valor 
	la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# L� em $v0 o valor digitado pelo usu�rio
	move		$s1,$v0			# Coloca em $s1 o valor 
main:
	add		$s2,$s0,$s1
	la		$a0, $s2
	li		$v0, 4
	syscall	
 
