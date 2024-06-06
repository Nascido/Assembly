.data 
n1: 		.word 0xBEBACAFE
n2: 		.word 0xCAFED0CE

.text
	.globl main
main:
   	lw 	$s0, n1
   	lw	$s1, n2
max:
   	slt 		$a0, $s0, $s1		# ($s0 < $s1 ? $a0 = 1 : $a1 = 0)
   	beq 		$a0,$zero, prim_maior
seg_maior:
   	add		 $v0, $s1, $zero
   	j		 FIM
prim_maior:
   	add		 $v0, $s0, $zero
FIM:    nop

