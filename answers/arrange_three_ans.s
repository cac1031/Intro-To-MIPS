# This program scans in three numbers and prints them in ascending order, 
# separated by a comma and a space

# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
scan_num1:
	li	$v0, 4
	la 	$a0, first_num_str
	syscall

	li	$v0, 5
	syscall
	move	$s0, $v0

scan_num2:
	li	$v0, 4
	la 	$a0, second_num_str
	syscall

	li	$v0, 5
	syscall
	move	$s1, $v0

scan_num3:
	li	$v0, 4
	la 	$a0, third_num_str
	syscall

	li	$v0, 5
	syscall
	move	$s2, $v0

sort:
	move	$t0, $s0			# a
	move	$t1, $s1			# b
	move	$t2, $s2			# c

	# t3 is a temporary 'buffer' variable

	bgt	$t0, $t2, swap_ac		# if (a > c) {swap(a, c);}
	j	swap_ac_end

swap_ac:
	move	$t3, $t0
	move	$t0, $t2
	move	$t2, $t3

swap_ac_end:
	bgt	$t0, $t1, swap_ab		# if (a > b) {swap(a, b);}
	j	swap_ab_end

swap_ab:
	move	$t3, $t0
	move	$t0, $t1
	move	$t1, $t3

swap_ab_end:
	bgt	$t1, $t2, swap_bc		# if (b > c) {swap(b, c);}
	j 	swap_bc_end

swap_bc:
	move	$t3, $t1
	move	$t1, $t2
	move	$t2, $t3

swap_bc_end:

print_arranged:
	li	$v0, 4
	la	$a0, arranged_num_str
	syscall

	li	$v0, 1
	move 	$a0, $t0
	syscall

	li	$v0, 4
	la	$a0, comma_space_str
	syscall

	li	$v0, 1
	move 	$a0, $t1
	syscall

	li	$v0, 4
	la	$a0, comma_space_str
	syscall

	li	$v0, 1
	move 	$a0, $t2
	syscall

	li	$v0, 11
	la	$a0, 10
	syscall

main__epilogue:
	li	$v0, 0		# return 0
	jr 	$ra

###############################################################################
# .data: The section where data is stored in main memory (RAM)
.data
first_num_str:		.asciiz "Enter first number: "
second_num_str:		.asciiz "Enter second number: "
third_num_str:		.asciiz "Enter third number: "
arranged_num_str:	.asciiz "Arranged Numbers: "
comma_space_str:    .asciiz ", "