# This program scans in a positive integer and prints all the factors that it has
# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
scan_num:
	li	$v0, 4
	la 	$a0, enter_num_str
	syscall

	li	$v0, 5
	syscall
	move	$s0, $v0

	ble	$s0, 0, invalid_num

print_factors:
	li	$v0, 4
	la 	$a0, factors1_str
	syscall

	li	$v0, 1
	move	$a0, $s0
	syscall

	li	$v0, 4
	la 	$a0, factors2_str
	syscall

loop_init:
	li	$t0, 1

loop_cond:
	bgt	$t0, $s0, loop_end

loop_body:
	div	$s0, $t0
	mfhi	$t1
	bne	$t1, 0, loop_increment

print:
	li	$v0, 1
	move	$a0, $t0
	syscall

	li	$v0, 11
	la	$a0, 10
	syscall

loop_increment:
	addi	$t0, $t0, 1
	j	loop_cond
	
loop_end:
	j 	main__epilogue

invalid_num:
	li	$v0, 4
	la 	$a0, invalid_num_str
	syscall

main__epilogue:
	li	$v0, 0		# return 0
	jr 	$ra

###############################################################################
# .data: The section where data is stored in main memory (RAM)
.data
enter_num_str:		.asciiz "Enter number: "
factors1_str:		.asciiz "Factors of "
factors2_str:		.asciiz ":\n"
invalid_num_str:	.asciiz "Invalid number!\n"