# This program takes in three numbers, the start of the sequence, 
# the end of the sequence and the step (increment) of the sequence
# and print out all numbers between 'start' and 'stop' (inclusive), 
# while incrementing the number by 'step' each time.

# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
# TODO: Add code here

main__epilogue:
	li	$v0, 0		# return 0
	jr 	$ra

###############################################################################
# .data: The section where data is stored in main memory (RAM)
.data
enter_start_str:	.asciiz "Enter start: "
enter_stop_str:		.asciiz "Enter stop: "
enter_step_str:		.asciiz "Enter step: "
