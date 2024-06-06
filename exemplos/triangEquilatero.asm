# Programa que l� na mem�ria os valores dos lados de um tri�ngulo e escreve na mem�ria o tipo do tri�ngulo formado
# 0: tri�ngulo equil�tero; 1: tri�ngulo escaleno; 2: tri�ngulo isosceles
# (N�o verifica se os lados formam um tri�ngulo)

      .data
l1:   .word  3 
l2:   .word  2 
l3:   .word  2        
tipo: .word  0              
      .text
      la   $t0, l1          # Carrega o endere�o de l1
      lw   $s1, 0($t0)      # Carrega o conte�do de l1
      lw   $s2, 4($t0)      # Carrega o conte�do de l2
      lw   $s3, 8($t0)      # Carrega o conte�do de l3
      
      bne  $s1, $s2, NAO_EQUILATERO
      bne  $s1, $s3, NAO_EQUILATERO     
EQUILATERO:     
      li   $s4, 0           # tipo = 0
      j	   FIM            

NAO_EQUILATERO:	
     beq   $s2, $s3, ISOSCELES
     beq   $s1, $s3, ISOSCELES
     beq   $s1, $s2, ISOSCELES

ESCALENO:
      li   $s4, 1           # tipo = 1
      j	   FIM          

ISOSCELES:
      li   $s4, 2           # tipo = 2	
FIM:
      sw  $s4, 12($t0)	    # Armazena o tipo calculado na vari�vel tipo
      
