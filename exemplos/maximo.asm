.data 
	a: 	.word 5
	b: 	.word -8
.text
j main
abs:
   	#andi 		$v0, $a0, 0x7FFFFFFF # x & 0x7FFFFFFF
addu $v0, $a0, $zero
bgez $v0, return
sub $v0, $zero, $a0
return:
  	jr		 $ra
max:
   	add 		$t0, $a0, $a1   # (x + y)
        sub             $a0, $a0, $a1      # x - y
        addi		$sp, $sp, -4				
	sw 		$ra, 0($sp)     # push($ra)
   	jal		abs             # abs(x - y)
   	add             $v0, $t0, $v0  #     ((x + y)+ abs(x - y))
   	srl             $v0, $v0, 1    # ((x + y)+ abs(x - y))/2;
   	lw 		$ra, 0($sp)     # pop($ra)
	addi		$sp, $sp, +4
 	jr		 $ra
main:
        lw  $a0, a
        lw  $a1, b
   	jal max
	move	        $a0,$v0			# Pega o resultado calculado fatorial de $v0 e copia para $a0


