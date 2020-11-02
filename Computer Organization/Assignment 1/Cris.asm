.data
    A: .asciiz "Enter Value A:"
    B: .asciiz "Enter Value B:"
.text
.globl main
main: la $a0, A
ori $v0, $0, 5
syscall
addu $t0, $0, $v0
la $a0, B
ori $v0, $0, 5
syscall
addu $t1, $0, $v0
blez $t1, exit
mul $t2, $t0, $t1
addu $t3, $t0, $t3
loop: li $v0,1
move $a0, $t3
syscall # will print m
beq $t2, $t3, exit 
addu $t3,$t3,$t0
j loop
.end

exit:    li $v0, 10        # load exit
    syscall            # exit
.end