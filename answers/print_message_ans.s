# This program prints a message to the screen
# Written by: <write your name here and remove triangular brackets>

###############################################################################
# Where you write your program code
.text
main:
	# print msg
	li 	$v0, 4
	la	$a0, msg1
	syscall

	# print newline with ascii
	li	$v0, 11
	la	$a0, 10
	syscall

	# prints msg2
	li	$v0, 4
	la	$a0, msg2
	syscall

	# do not need to reload v0 for same type
	la	$a0, msg3
	syscall

	# prints newline as a char
	li	$v0, 11
	la 	$a0, '\n'
	syscall

main__epilogue:
	li	$v0, 0						# return 0
	jr 	$ra

###############################################################################
# .data is the section where data is stored in main memory (RAM)
.data
msg1:		.asciiz "Hello World"
msg2:		.asciiz "This is my first MIPS Program!\n"
msg3:       	.asciiz "... or is it?"
