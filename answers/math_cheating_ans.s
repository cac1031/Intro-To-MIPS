# This program scans in three numbers and returns the 
# sum of its arithmetic sequence up to the first n terms

# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
scan_a:
	li	$v0, 4
	la	$a0, enter_a_str
	syscall

	li	$v0, 5
	syscall
	move 	$s0, $v0

scan_d:
	li	$v0, 4
	la	$a0, enter_d_str
	syscall

	li	$v0, 5
	syscall
	move 	$s1, $v0

scan_n:
	li	$v0, 4
	la	$a0, enter_n_str
	syscall

	li	$v0, 5
	syscall
	move 	$s2, $v0

compute:
	sub	$t0, $s2, 1	# n - 1
	mul	$t0, $t0, $s1	# (n - 1) * d
	mul	$t1, $s0, 2	# 2 * a
	add	$t0, $t0, $t1 	# 2a + (n-1)d
	mul	$t0, $t0, $s2	# n * (2a + (n-1)d)

	div	$t0, $t0, 2	# n * (2a + (n-1)d)
	# (mflo	$t0) 
	# --> optional because div is a pseudo-instruction

print:
	li 	$v0, 4
	la	$a0, result1_str
	syscall

	li 	$v0, 1
	move 	$a0, $s2
	syscall

	li 	$v0, 4
	la	$a0, result2_str
	syscall

	li 	$v0, 1
	move	$a0, $t0
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
enter_a_str:        .asciiz "Enter a: "
enter_d_str:        .asciiz "Enter d: "
enter_n_str:        .asciiz "Enter n: "

result1_str:        .asciiz "Sum of the first "
result2_str:        .asciiz " terms of the sequence: "