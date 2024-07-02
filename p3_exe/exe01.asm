.data
	result: .word 0x09524511
	card: 	.word 0x0b526515
.text
.globl main
	main:
		# Carrega os valores de 'result' e 'card'
		lw $s0, result	   # s0 = result
		lw $s1, card	   # s1 = card
		
		# Realiza operacao AND bit a bit: acertos = s2
		and $s2, $s0, $s1  # s2 = s0 & s1 ==> 	acertos = result & card
		
		# Inicializa o Total em $t0
		li $t0, 0	   # total = 0
		
	while:
		# Verifica se acertos > 0
		blez  $s2, end 	   # Se acertos <= 0 entao vai para end
		
		# Verifica os 3 bits menos significativos
		addi $t1, $s2, 0x7
		beqz $t1, shift
		
		# incrementa total
		addi $t0, $t0, 1
		
	
	shift:
		# Desloca acertos 3 bits para a direita
		srl $s2, $s2, 3
		
		# Volta para o while
		j while
		
	end:
		li $v0, 10
		syscall
