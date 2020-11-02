# test program
.text
main:
	ori $s7,$0,4097		# put a memory location in $s7
	sll $s7,$s7,16		#
	ori $s0,$0,0x2		# put 2 into $s0
     and $s0,$s0,$zero    # clear $s0
     ori $s0,$zero,0x2    # put 2 back into $s0
     nor $s0,$s0, $zero   # complement $s0
     ori $s0,$zero,0x2    # put 2 back into $s0
     ori $s1,$0,0x3  	     # put 3 into $s1
	add $s2,$s0,$s1 	# add
     beq $s2,$zero, exit
	sw $s2, 4($s7)		# store the result to memory
       j exit
     ori $s0,$zero,0x2    # pretend like we might do
     nor $s0,$s0, $zero   # other work after jump

# exit gracefully
exit:	addi $v0,$0,10		# load exit
	syscall			# exit

## end of file
