.data # 
A: .asciiz "Please enter the value of A:"
B: .asciiz "Please enter the value of B:"
S: .asciiz " "
.text # Put program here
.globl main # globally define 'main'
main: li $v0, 4
la $a0, A # Ask for input A
syscall
ori $v0, $0, 5 
syscall
addu $t0, $0, $v0 # Store A
li $v0, 4
la $a0, B # Ask for input B
syscall
ori $v0, $0, 5 
syscall
addu $t1, $0, $v0 # Store B
blez $t1, stop # b <= 0, stop
mul $t2, $t0, $t1 # S = A * B
addu $t3, $t0, $t3 # m = A
loop: li $v0, 1
move $a0, $t3 
syscall # Print m
beq $t2, $t3, stop # S == m, stop
addu $t3, $t3, $t0 # Add m + A
li $v0, 4
la $a0, S # Ask for input A
syscall
j loop
stop: li $v0, 10 # syscall to exit cleanly from main only
syscall # ends execution
.end
