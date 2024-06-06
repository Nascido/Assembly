.data						#Segmento de dados de um programa (dados que ficam em memoria). 
_arrayA: .word 0x1122,0xAABB, 0x0001
_x: .word 0xA#ALTERAR

.text
.globl main
main:
	la $s0, _arrayA	#pseudoinstrucao
	lw $t8, _x	#pseudoinstrucao
	
	lw $t0, 0($s0)
	lw $t1, 4($s0)
	and $t2, $t0, $t1
	sll $t0, $t2, 1
	add $t3, $t0, $t8
	sw $t3, 8($s0)