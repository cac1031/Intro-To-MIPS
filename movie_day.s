# This program takes in a number between 1 - 7, denoting the days of the week, 
#and depending on the number, gives a movie for the corresponding day of the week

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
enter_day_str:			.asciiz "Enter day: "
invalid_day_str:		.asciiz  "Invalid day!\n"
movie_to_watch_str:		.asciiz "Movie to watch: "

movie1_str:			.asciiz "Princess Mononoke\n" # (objectively the best studio ghibli film)

# TODO: Add more movie strings for the rest of the days of the week