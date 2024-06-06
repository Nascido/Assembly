.macro  max
move  $v0, $a0
bgt   $a0, $a1, return
move $v0, $a1
return:
.end_macro

.text
      li	$a0, 5	
      li	$a1, 3
      max
      move   
      li        
fim:    
      li	$v0,10		# Termina o programa 
      syscall
