# Exercício
# Traduzam o seguinte código para linguagem de montagem MIPS
# x = ((x+300) – y) + z + 27 + x
# x = $s0, y = $s1, z = $s2

addi $t0, $s0, 300 	# $t0 = $s0 + 300
sub  $t0, $t0, $s1	# $t0 = $t0 - $s1
add  $t0, $t0, $s2	# $t0 = $t0 + $s2
addi $t0, $t0, 27	# $t0 = $t0 + $27
add  $s0, $t0, $s0	# $s0 = $t0 + $s0

# Otimizem o código acima
# Flag de compilação “-confio_em_ti” ligada
# x = (327  + z + (x << 1)) – y

# Exercício
# Traduzam o seguinte código para linguagem de montagem MIPS
# s = (a & b) | (!a & c) 
# $a0 = a $a1 = b $a2 = c $s0 = s

and $s0, $a0, $a1 	# $s0 = $a0 & $a1
nor $a0, $a0, $zero 	# $a0 = !$a0
and $t0, $a0, $a2	# $t0 = $a0 & $a2
or  $s0, $s0, $t0	# $s0 = $s0 | $t0

# li $s0, 0xFFFFAAAA
addi $t0, $zero, 0xFFFF
sll $t0, $t0, 16
addi $s0, $t0, 0xAAAA

# li $s0, 0xFFFFAAAA
ori $t0, $zero, 0xFFFF
sll $s0, $t0, 16
ori $s0, $s0, 0xAAAA

# Compile o seguinte código de linguagem de alto nível:
# Valor = 4*(a+b+c+d)
# Usar $sx para as variáveis em ordem
# Valor vai para $v0
# a = $a0 b = $a1 c = $a2 d = $a3
li $a0, 0xFFFFAAAA
li $a1, 2
li $a2, 3
li $a3, 3
add $a0, $a0, $a1 	# $a0 = $a0 + $a1
add $a0, $a0, $a2 	# $a0 = $a0 + $a2
add $a0, $a0, $a3 	# 4a0 = $a0 + $a3
sll $v0, $a0, 2		# $v0 = $a0 * 4

# Compile o seguinte código de linguagem de alto nível:
# Vetor[15] = Vetor[14+Vetor[2]]
# Considere que o endereço de vetor está armazenado em $s4
	.data
Vetor: 	.word   0 : 100       # "array" de 100 words 

      	.text
      la   	$s4, Vetor        	# $s4 = &Vetor Carrega endereço inicial do vetor
      lw  	$s0, 8($s4)      	# %s0 = Vetor[2]
      addi	$s0, $s0, 14      	# $s0 = $s0 + 14
      sll  	$s0, $s0, 2		# $s0 = $s0*4
      lw 	$t0, 0($s0)		# $t0 = Vetor[14+Vetor[2]]
      sw	$t0, 60($s4)
      

