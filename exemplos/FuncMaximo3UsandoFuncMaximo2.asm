.macro push (%reg)  				# Criando uma macro (pseudo-instru��o) para empilhar o valor de um resgistrador
       	addi		$sp, $sp, -4				
	sw 		%reg, 0($sp)
.end_macro

.macro pop (%reg)				# Criando uma macro (pseudo-instru��o) para desempilhar o valor do topo da pilha em um resgistrador			
	lw 		%reg, 0($sp)
	addi		$sp, $sp, +4
.end_macro

.data 
	msg_str: 		.asciiz "Entre com o n�mero: "

.text
	.globl main
	la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# L� em $v0 o valor digitado pelo usu�rio
	move		$t0, $v0  	        # Coloca em $t0 o valor digitado 
	
	
	la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# L� em $v0 o valor digitado pelo usu�rio
	move		$a1,$v0			# Coloca em $a1 o valor digitado
	
	la		$a0, msg_str
	li		$v0, 4
	syscall					# Escreve mensagem na tela
	li		$v0, 5			#
	syscall					# L� em $v0 o valor digitado pelo usu�rio
	move		$a2,$v0			# Coloca em $a2 o valor digitado	

	
main:
   	move		$a0, $t0		# Acerta o 1o argumneto (os outros j� est�o em $a1 e $a2)
   	jal 		maximoDe3
	move	        $a0,$v0			# Pega o retorno de maximoDe3 e prepara pra escrev�-lo na tela
	li		$v0,1			# 
	syscall					# Imprime o resultado
	li		$v0,10			# 
	syscall					# Termina o programa
	
	
	
maximoDe2:
   	slt 		$t0, $a0, $a1
   	beq 		$t0,$zero, prim_maior
seg_maior:
   	move		 $v0, $a1
   	jr		 $ra
prim_maior:
   	move		 $v0, $a0
   	jr		 $ra
   	
maximoDe3:
        push		$ra
        jal 		maximoDe2
        push		$a0			# Salva contexto
        push		$a1			# Salva contexto
        move 		$t0, $v0		# Salva o retorno de maximoDe2(a0, a1) 
   	move		$a0, $t0		# Manda o retorno de maximoDe2(a0, a1) para a nova de maximoDe2(a0, a1)
   	move		$a1, $a2		# Segundo argumento da chamada
   	jal 		maximoDe2
   	pop		$a1
   	pop		$a0
   	pop		$ra   	
   	jr		$ra
