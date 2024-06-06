# Programa que lê na memória os valores dos lados de um triângulo e escreve na memória o tipo do triângulo formado
# 0: triângulo equilátero; 1: triângulo escaleno; 2: triângulo isosceles
# (Não verifica se os lados formam um triângulo)

      .data
n:   .word  7 
fat:  .word  0 
             
      .text
      li   $s2, 0x1         # fat = 1;              // $s2 faz o papel de fat
      la   $t0, n           #                       // Carrega o endereço de n
      lw   $s1, 0($t0)      # n = 7                 // $s1 faz o papel de n //Carrega o conteúdo de n
      beq  $s1, $zero, FIM  # if (n == 0) goto fim  // 0! = 1
      addi $s1,$s1,1        # n = n + 1;
      li   $s3, 1           # i = 1 
WHILE:                      # do{
      mul  $s2,$s2,$s3      #   fat = fat; 
      addi $s3,$s3,1        #   i = i + 1; 
      bne  $s3, $s1, WHILE  # }while(i != n + 1);   // Equivalente a }while(i <= n); 
FIM: 
      sw  $s2, 4($t0)	    # Armazena o valor calculado na variável fat
      
