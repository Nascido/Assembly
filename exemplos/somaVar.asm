.data
a:        .word   5
b:      .double 0
c:        .byte   7
        .text
main:
        lw      $t0,a
        lw	$t1,c
        add	$t0, $t0, $t1
        la    	$t1, b
        sw	$t0, 0($t1)