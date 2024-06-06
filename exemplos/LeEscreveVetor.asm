	.macro print_int (%x)
	li $v0, 1
	add $a0, $zero, %x
	syscall
	.end_macro

	.macro le_int (%x)
	li $v0, 5
	syscall
	move %x, $v0
	.end_macro
		
	.macro print_str (%str)
	.data
myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
	.end_macro
	
      	.data
vet: 	.word   0 : 3        	# "array" de 12 words 
tam: 	.word  3             	# tamanho of "array" 

       	.text
       	lw $t0, tam
       	move $t2, $zero
       	la $a0, vet
       	move $a1, $a0
       	move $t1, $zero		# índice (pula de 1 em 1)
loop_le:
       beqz $t0, escreve
       print_str("Entre com um número")
       le_int ($s0)
       add  $a1, $a1, $t2
       sw   $s0, 0($a1)
       addi $t1, $t1, 1
       subi $t0, $t0, 1
       addi  $t2, $t2, 4
       j loop_le
escreve: 
       lw $t0, tam     
       move $a1, $a0
       move $t1, $zero		# índice (pula de 1 em 1)
       move $t2, $zero
       loop_escreve:
       beqz $t0, fim
       add  $a1, $a1, $t2
       lw   $s0, 0($a1)
       print_int ($s0)
       addi $t1, $t1, 1
       subi $t0, $t0, 1
       addi  $t2, $t2, 4
       j loop_escreve
 fim:      
             	

