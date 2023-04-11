# This program scans in two numbers and returns some facts about them
# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
scan_first_num:
	li	$v0, 4
	la	$a0, first_num_str
	syscall

	li	$v0, 5
	syscall
	move 	$s0, $v0

scan_second_num:
	li	$v0, 4
	la	$a0, second_num_str
	syscall

	li	$v0, 5
	syscall
	move 	$s1, $v0

print_facts:
	# sum
	li	$v0, 4
	la	$a0, sum_str
	syscall

	li 	$v0, 1
	add 	$a0, $s0, $s1
	syscall

    li  $v0, 11
    li  $a0, 10
    syscall

	# difference (assumes num1 > num2)
	# !! if statements not yet covered
	li	$v0, 4
	la	$a0, diff_str
	syscall

	li	$v0, 1
	sub 	$a0, $s0, $s1
	syscall

    li  $v0, 11
    li  $a0, 10
    syscall

	# product of num1 and num2
	li	$v0, 4
	la	$a0, mult_str
	syscall

	li	$v0, 1
	mul 	$a0, $s0, $s1
	syscall

    li  $v0, 11
    li  $a0, 10
    syscall

print_like:
	li	$v0, 4
	la	$a0, like1_str
	syscall

	li 	$v0, 1
	move 	$a0, $s0
	syscall

	li	$v0, 4
	la	$a0, like2_str
	syscall

	li 	$v0, 1
	move 	$a0, $s1
	syscall

	li	$v0, 4
	la	$a0, like3_str
	syscall

    li  $v0, 11
    li  $a0, 10
    syscall

main__epilogue:
	li	$v0, 0		# return 0
	jr 	$ra

###############################################################################
# .data: The section where data is stored in main memory (RAM)
.data
first_num_str:		.asciiz "First number: "
second_num_str:		.asciiz "Second number: "
sum_str:		.asciiz "Sum: "
diff_str:		.asciiz "Diff: "
mult_str:		.asciiz "Mult: "
like1_str:		.asciiz "I like "
like2_str:		.asciiz ", and also "
like3_str:		.asciiz "."