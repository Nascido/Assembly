.data
max: .word 13
.text
la $t0, max
addi $s1, $s1, 3
sw  $s1, 0($t0)

