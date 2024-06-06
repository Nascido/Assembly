.macro done
	li $v0,10
	syscall
.end_macro	
		
.macro print_int (%x)
	li $v0, 1
	add $a0, $zero, %x
	syscall
.end_macro
	
.macro read_int (%x)	
	li $v0,5  
	syscall
	move %x,$v0 
.end_macro
	
	
.macro print_str (%str)
	.data
myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
.end_macro	
					
.text
main:                               	# int main(){
print_str ("Entre com a base ")     	#   printf("Entre com a base ");
read_int($s0)                       	#   scanf("%i", &n);
print_str ("Entre com o expoente ") 	#   printf("Entre com o expoente ");
read_int($s1)                       	#   scanf("%i", &m);
move $a0, $s0                      	# 
move $a1, $s1                       	#
jal pot                             	#   int nElevadoAm = pot(n, m);
move $s2, $v0                       	#
print_str("A potencia e’ ")         	#   printf("A potencia e' ");
print_int ($s2)                     	#   printf("%d", nElevadoAm)
done                                	#   return 0;
                                    	# }
pot:					# int pot(int base, int expoente){
move $t0, $a0                  		#   int temp1 = base;
move $t1, $a1				#   int temp2 = expeoente;                	
li $v0, 1  				#   int acum = 1; 
while:		   			#   while (temp2 >= 1){
beq $t1, $zero, end_while		#
mul $v0, $v0, $t0			#	acum = acum * temp1;
addiu $t1, $t1, -1			#	temp2--;
j while					#   
end_while:				#   }
jr $ra					#   return acum;
					# }
