
.main:  
# These are 5 parameters for our function  
li $s0, 2  
li $s1, 3  
li $s2, 4  


addi $sp, $sp, -12       # 5 Words are 3 * 4 bytes  

sw $s0, 0($sp)  
sw $s1, 4($sp)  
sw $s2, 8($sp)  

jal addThreeNumbers  

# We don't need no more the parameters on the stack, free them  
addi $sp, $sp, 12  

# Now use the result in $v0  
# and exit  
# Again, we could use $s0,...,$s4 directly, but from a conventional point of view that's not encouraged  
# This system is also more flexible, because the callee can use every registers he wants, and is not  
# forced to use the exact registers the caller function rely on.  
li $v0,10 # Para terminar o programa
syscall
addThreeNumbers:  

# Load the parameters  
# From a conventional point of view the registers $t0-$t9 are 'temporary', so I can use them  
# without any restrictions. Almost every other registers including $s0-$s7, are "preserved on call"  
# which means that if you use them is a function you should restore them with their original  
# values right before exiting the function.  
lw $t0, 0($sp)  
lw $t1, 4($sp)  
lw $t2, 8($sp)  
add $v0, $t0, $t1  
add $v0, $v0, $t2  
jr $ra  