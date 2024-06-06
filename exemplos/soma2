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
	jal		fac			# Chama a função fac
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
fac:
	# prólogo para entrada na função (salvamento de contexto)
	addi            $sp,$sp,-8		# Prepara o empilhamento
	sw		$s0,0($sp)		# Salva $s0
	sw		$ra,4($sp)		# Salva endereço de retorno
	# Inicia o verdadeiro trabalho da função
	move            $s0,$a0			# Pega o argumento ($a0 = n)
	li		$v0,0x00000001	# 1
	beq		$s0,$v0,L2		# if (n == 1) L2
	addi            $a0,$s0,-1		# else seta o argument (n-1)
	jal		fac			# 	chama recursivamente a função fac(n-1) 
	#mult            $v0,$s0			# 	multiplica por n o resultado retornado
	#mflo            $v0			# 	retorna o resultado de n*fac(n-1)
	mul $v0, $v0, $s0
	j		L3			# 	vai para a saída da função
L2:
	li		$v0,0x00000001          # retorna o valor 1
	# epílogo para sair da função (recuperação de contexto)
L3:
	lw		$ra,4($sp)		# Recupera endereço de retorno ($ra)
	lw		$s0,0($sp)		# Recupera $s0
	addi            $sp,$sp,8		# Desempilha
	jr		$ra			# Retorna
