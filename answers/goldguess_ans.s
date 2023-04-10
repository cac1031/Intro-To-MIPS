# Sample answer for goldguess.s
# Written for: 23T1 Introduction to MIPS

###############################################################################

# -- TODO: Register Notes (Tell what each register stores) --
# $t0 = Increment variable
# $t1 = User's guess

# Constant Declarations
CORRECT_GUESS = 13			# TODO: Replace me with the amount of gold you want
NUM_ROUNDS = 3

###############################################################################
# [TASKS]

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
# If Sen makes 3 wrong guesses, we print a losing message

###############################################################################

# [Main]
# + Where you write your program code
# + Note that every program needs a main: label
# + Add more labels!

.text
main:
main__prologue:	# [DO NOT TOUCH]
	begin
	push	$ra

main__body:
	jal game_setup

game_start:
### [Game Loop] ###
loop_init:
	li		$t0, 0
loop_cond:
	bge		$t0, NUM_ROUNDS, loop_end
loop_body:
scan_guess:
	# Scanning in user guess
	li		$v0, 4
	li		$a0, enter_guess_str
	syscall

	li		$v0, 5
	syscall
	move 	$t1, $v0

	# user guess checking
	blt		$t1, 0, invalid_guess

	# Evaluating guesses
	beq		$t1, CORRECT_GUESS, player_win
	bgt		$t1, CORRECT_GUESS, too_big
	blt		$t1, CORRECT_GUESS, too_small

loop_increment:	
	li		$v0, 4
	li		$a0, divider_str
	syscall	
	addi	$t0, $t0, 1
	j		loop_cond	

loop_end:
	j player_lose

### [Conditions] ###
player_lose:
	li		$v0, 4
	li		$a0, lose_str
	syscall
	j main__end

player_win:
	li		$v0, 4
	li		$a0, win_str
	syscall
	j		main__end
	
invalid_guess:
	li		$v0, 4
	li		$a0, invalid_guess_str
	syscall
	j main__end

too_big:
	li		$v0, 4
	li		$a0, too_high_str
	syscall
	j		loop_increment
	
too_small:
	li		$v0, 4
	li		$a0, too_low_str
	syscall
	j		loop_increment

main__end:
main__epilogue:		# [DO NOT TOUCH]
	pop		$ra
	end
	jr 		$ra

###############################################################################

# [Game Setup]
# + A function that prints the title card, rules and a message from No-Face!
# + Print your message from No-Face under the print_message label.
# + Feel free to edit some of the rule and title strings here and in .data !

.text 
game_setup:
game_setup__prologue:	# [DO NOT TOUCH]
	begin
	push		$ra

game_setup__body:
print_title:
	li		$v0, 4
	la		$a0, title1_str
	syscall
	la		$a0, title2_str
	syscall
	la 		$a0, title3_str
	syscall
	la		$a0, title2_str
	syscall
	la		$a0, title1_str
	syscall
	
print_rules:
	# TODO (Task 1): 
	# + Print the game rules using the strings in .data
	# + Print your numRounds between rule3_str and rule4_str
	la		$a0, rule_head_str
	syscall
	la		$a0, rule1_str
	syscall
	la		$a0, rule2_str
	syscall
	la		$a0, rule3_str
	syscall
	li 		$v0, 1
	li		$a0, NUM_ROUNDS
	syscall
	li		$v0, 4
	la		$a0, rule4_str
	syscall
	la		$a0, rule5_str
	syscall

print_start:
	la		$a0, divider_str
	syscall
	la		$a0, start_head_str
	syscall

game_setup__epilogue:	# [DO NOT TOUCH]
	pop		$ra
	end
	jr		$ra

###############################################################################

.data
# .data is the section where data is stored in main memory (RAM)


# STRINGS (feel free to add/customise the strings!!)
# Title Card Strings
title1_str:		.asciiz "-----------------------------\n"
title2_str:		.asciiz "|                           |\n"
title3_str:		.asciiz "|        GOLDGUESSER!!      |\n"

# Rule Strings
rule_head_str:		.asciiz "[RULES]\n\n"
rule1_str:		.asciiz "* Oh No! No-Face has eaten too much and\n has morphed into its terrifying monstrous form!\n\n"
rule2_str:		.asciiz "* He has presented Sen a handful of gold nuggets\n and has challenged you to guess the value it holds.\n\n"
rule3_str:		.asciiz "* Sen has "
rule4_str:		.asciiz " chances to guess it right.\n\n"
rule5_str:		.asciiz "* Guess correct and the gold nuggets shall be Sen's!\n Guess wrong and Sen will be gobbled up.\n\n"

# Interface Strings
divider_str:		.asciiz "-----------------------------\n\n"
start_head_str:		.asciiz "[START!]\n\n"
enter_guess_str:	.asciiz "Enter guess: "
invalid_guess_str:	.asciiz "Invalid guess: you can't have negative gold!\n\n"
too_high_str:		.asciiz "Too high!\n\n"
too_low_str:		.asciiz "Too low!\n\n"
win_str:		.asciiz "Yay! You win !!\n\n"
lose_str:		.asciiz "You lose :( better luck next time!\n\n"

# TODO: Write the string variables you want to print here