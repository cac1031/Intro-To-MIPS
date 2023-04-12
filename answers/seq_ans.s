# This program takes in three numbers, the start of the sequence, 
# the end of the sequence and the step (increment) of the sequence
# and print out all numbers between 'start' and 'stop' (inclusive), 
# while incrementing the number by 'step' each time.

# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
scan_start:
	li	$v0, 4
	la	$a0, enter_start_str
	syscall

	li	$v0, 5
	syscall
	move	$s0, $v0

scan_stop:
	li	$v0, 4
	la	$a0, enter_stop_str
	syscall

	li	$v0, 5
	syscall
	move	$s1, $v0

scan_step:
	li	$v0, 4
	la	$a0, enter_step_str
	syscall

	li	$v0, 5
	syscall
	move	$s2, $v0

loop_init:
	move	$t0, $s0

loop_cond:
	blt	$s1, $s0, cond_smaller_end

cond_bigger_end:
	bgt	$t0, $s1, loop_end
	ble	$s2, 0, loop_end
	j 	loop_body

cond_smaller_end:
	blt	$t0, $s1, loop_end
	bge	$s2, 0, loop_end
	j 	loop_body

loop_body:
	li	$v0, 1
	move	$a0, $t0
	syscall
	
	li	$v0, 11
	la	$a0, 10
	syscall

loop_increment:
	add	$t0, $t0, $s2
	j	loop_cond
	
loop_end:


main__epilogue:
	li	$v0, 0		# return 0
	jr 	$ra

###############################################################################
# .data: The section where data is stored in main memory (RAM)
.data
enter_start_str:	.asciiz "Enter start: "
enter_stop_str:		.asciiz "Enter stop: "
enter_step_str:		.asciiz "Enter step: "
