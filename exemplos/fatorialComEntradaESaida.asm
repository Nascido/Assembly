.data
msg_in: .asciiz "Entre com um inteiro >= 0:  "
msg_out: .asciiz "O fatorial é: "
 
.text
 
li $v0,4 # Para escrever na tela a msg
la $a0,msg_in
syscall # Chama o sistema operacional para fazer o servicinho sujo
 
li $v0,5  # Para ler do teclado o número 
syscall
move $s1,$v0 
li   $s2, 1           # fat = 1
beq  $s1, $zero, END
WHILE:
mul  $s2,$s2,$s1
subi $s1,$s1,1
bne  $s1, $zero, WHILE         
END: 
 li $v0,4 # Para escrever na tela a msg
la $a0,msg_out
syscall 
   
li $v0,1 # Para escrever na tela o resultado
move $a0,$s2 
syscall
 
li $v0,10 # Para terminar o programa
syscall
      
