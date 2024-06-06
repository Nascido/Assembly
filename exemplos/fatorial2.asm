
.data
   num:   .word   5
   one:   .word   1
   two:   .word   2
.text
.globl main   # main()

main:
   lw $s0, num # Guarda o valor de entrada
   lw $s1, one # Guarda 1 para comparacao e retorno
   lw $s2, two # Guarda 2 para comparacao
   li $s3, 268500992 # Endereço de destino na RAM em decimal
   lw $t2, one # para ser o retorno padrao
   lw $t3, num # Valor de controle para o LOOP
   add $s4, $s0, $s1 # $s4 = 11
   
   # Teste para saber se num eh maior que 1
   slt $t0,$s0,$s2   # testa se num < 2 (retorna 1 se num < 2)
         beq $t0,$zero,LOOP   # Se num >= 1, vai fazer outra chamada
         #sw $t2, ($s3)
         j LSair

LOOP:
   addi $t4, $t4, 1
      slt $t0, $t4, $s4 # Verifica se o valor esta na sua ultima posicao
      beq $t0, $zero, LSair # Se chegou no final sai
   mul $t2, $t2, $t4 # t2 começa com 1, e vai incrementando pelo produto
   j LOOP

LSair:
   sw $t2, ($s3)