# This program scans in three numbers and returns the 
# sum of its arithmetic sequence up to the first n terms

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
enter_a_str:        .asciiz "Enter a: "
enter_d_str:        .asciiz "Enter d: "
enter_n_str:        .asciiz "Enter n: "

result1_str:        .asciiz "Sum of the first "
result2_str:        .asciiz " terms of the sequence: "