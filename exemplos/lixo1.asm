.text
li $t0, 8
li $t1, 3
bge  $t0, $t1, fim
addi  $t0, $t0, 1
j fim
move  $t0, $s0
fim:


