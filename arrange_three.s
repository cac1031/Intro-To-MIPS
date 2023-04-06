# This program scans in three numbers and prints them in ascending order, 
# separated by a comma and a space

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
first_num_str:		.asciiz "Enter first number: "
second_num_str:		.asciiz "Enter second number: "
third_num_str:		.asciiz "Enter third number: "
arranged_num_str:	.asciiz "Arranged Numbers: "