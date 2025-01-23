addi $t1, $t1, 10
Loop:
addi $s2, $s2, 2
subi $t1, $t1, 1
bne $t1, $0, Loop
j Loop