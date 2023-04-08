# This program scans in a positive integer and prints all the factors that it has
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
enter_num_str:		.asciiz "Enter number: "
factors1_str:		.asciiz "Factors of "
factors2_str:		.asciiz ":\n"
invalid_num_str:	.asciiz "Please enter a poitive integer!\n"