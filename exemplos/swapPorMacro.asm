.macro  swap  (%a, %b)
move $t0, %a
move %a, %b
move %b, $t0
.end_macro

.text
      li	$a0, 5	
      li	$a1, 3
      swap $a0, $a1
      li       $a2, 5
      swap $a0, $a2
