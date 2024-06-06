.text
main:
addi $t0,$zero,0     		
addi $t1,$t0,3       
li $t2,23
beq $t2,1,Not_is	


rem $t3,$t2,2       # Pseudo-instrução que coloca em $t3 o resto de $t2 por 2
beq $t3,0,Not_is     

loop:

mul $t3,$t1,$t1
slt $t5,$t2,$t3
beq $t5,1,Is	  

rem $t4,$t2,$t1
beq $t4,0,Not_is	
	
addi $t1,$t1,2	
j loop

Is:
li $v0,1
j fim
Not_is:
li $v0,0
fim:     
	