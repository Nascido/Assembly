
.main:  
# These are 5 parameters for our function  
li $s0, 2  
li $s1, 3  
li $s2, 4  
li $s3, 5 



sw $s0, 0($sp) 
sw $s1, 4($sp)
addi $sp, $sp, -8      # 5 Words are 3 * 4 bytes  

jal addTwoNumbers
move $s0, $v0
addi $sp, $sp, 8 

sw $s2, 0($sp) 
sw $s3, 4($sp)
addi $sp, $sp, -8      # 5 Words are 3 * 4 bytes 

jal addTwoNumbers
addi $sp, $sp, 8 
add $s0, $s0, $v0  


li $v0,10 # Para terminar o programa
syscall


addTwoNumbers:  

addi $sp, $sp, 8      # 5 Words are 3 * 4 bytes
lw $t1, 0($sp)  
lw $t2, 4($sp) 

sw $s0, 0($sp)  
addi $sp, $sp, -4      # 5 Words are 3 * 4 bytes  

add $s0, $t1, $t2
move $v0, $s0 
addi $sp, $sp, 4      # 5 Words are 3 * 4 bytes  
lw $s0, 0($sp)    
jr $ra  