# This program gives a user 3 tries to guess the value of gold nuggets
# Written by: <write your name here and remove triangular brackets>

# -- TODO: Register Notes (Tell what each register stores) --
# $t0 = 
# $t1 = 
# $t2 = 
# ...

# Constant Declarations
CORRECT_GUESS = 12			# TODO: Replace me with the amount of gold you want


# Where you write your program code
# Note that every program needs a main: label
# Add more labels!
.text
main:
# TODO (Task 1): Print a message from No-Face

# TODO (Task 2): Scan in a number representing guess for gold nugget amount

# TODO (Task 3): Evaluate guess
# - If guess is too low, tell Sen to guess higher
# - If guess is too high, tell Sen to guess lower
# - If guess is equal to correct amount, tell Sen she won!

# TODO (Task 4): Now change it so that Sen has 3 guesses instead of 1
# Note that if Sen guesses a non-positive integer, she can't make further guesses. Print an appropriate message
# Similar to Task 3, print a message if each guess is too low or high
# If Sen guesses correct, we stop the loop and print a message saying she won!
# If Sen majkes 3 wrong guesses, we print a losing message


main__epilogue:
	li	$v0, 0						# return 0
	jr 	$ra

# TODO: Write the string variables you want to print here
# .data is the section where data is stored in main memory (RAM)
.data
