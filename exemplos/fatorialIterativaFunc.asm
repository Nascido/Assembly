	# Exemplo de função recursiva
	#
	# int rec(int n){
	#   if (n == 1) return 1;
	#   else return n*fac(n-1);
	# }
	.data 
	msg_str: 		.asciiz "Entre com o número: "
	.text
	.globl main
	main:
	la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# Lê em $v0 o valor digitado pelo usuário
	move		$a0,$v0			# Coloca em $a0 o valor do fatorial ser calculado
	jal		fat			# Chama a função fac
	move	        $a0,$v0			# Pega o resultado calculado fatorial de $v0 e copia para $a0
	li		$v0,1			# 
	syscall					# Imprime o resultado
	li		$v0,10			# 
	syscall					# Encerra o programa

	#
	# fac(arg) - computa o fatorial de arg (arg!)
	#	argumento é passado em $a0
	#   pilha:
	#
	#       |... end.  + alto ...|
	#       |--------------------|
	#       |                    |
	#       |--------------------|
	#       |  end. de retorno   |  +4
	#       |--------------------|  
	#  $sp->|       $s0 salvo    |  +0
	#       |--------------------|
	#       |... end.  + baixo...|
	#		
	#	
fat:
	# prólogo para entrada na função (salvamento de contexto)
	addi            $sp,$sp,-4		# Prepara o empilhamento
	sw		$s0,0($sp)		# Salva $s0

	move            $s0,$a0			# i = n; 
	li		$v0, 1			# f = 1;
	move 		$t0, $v0		# 
while:	ble		$s0,$t0,sai		# while(i > 1){
	mul 		$v0, $v0, $s0		#   f = f*i;
	addi            $s0,$s0,-1		#   i = i - 1;
	j		while			# }
sai:
	lw		$s0,0($sp)		# Recupera $s0
	addi            $sp,$sp,8		# Desempilha
	jr		$ra			# Retorna


comb:
sub $sp, $sp, 16
sw $ra, 0($sp)
sw $s0, 4($sp)
sw $a0, 8($sp)
sw $a1, 12($sp)
jal fat
move $s0, $v0
lw $a0, 12($sp)
jal fat
div $s0, $s0, $v0
lw $a0, 8($sp)
lw $a1, 12($sp)
sub $a0, $a0, $a1
jal fat
div $s0, $s0, $v0
move $v0, $s0
lw $ra, 0($sp)
lw $s0, 4($sp)
addi $sp, $sp, 16
jr $ra