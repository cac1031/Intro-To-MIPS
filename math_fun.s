# This program scans in two numbers and returns some facts about them
# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
# TODO: Add code here
scan_first_num:

scan_second_num:

print_facts:

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