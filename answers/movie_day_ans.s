# This program takes in a number between 1 - 7, denoting the days of the week, 
#and depending on the number, gives a movie for the corresponding day of the week

# Written by: <write your name here and remove triangular brackets>

###############################################################################
# .text: Where you write your program code
.text
main:
get_date:
	li 	$v0, 4
	la	$a0, enter_day_str
	syscall

	li	$v0, 5
	syscall
	move	$s0, $v0

check_date:
	blt	$s0, 1, invalid_day
	bgt	$s0, 7, invalid_day

	li 	$v0, 4
	la	$a0, movie_to_watch_str
	syscall

	beq	$s0, 1, day1
	beq	$s0, 2, day2
	beq	$s0, 3, day3
	beq	$s0, 4, day4
	beq	$s0, 5, day5
	beq	$s0, 6, day6
	beq	$s0, 7, day7

	## OR this is also acceptable ##
	# j	invalid_day 
	# li 	$v0, 4
	# la	$a0, movie_to_watch_str
	# syscall

day1:
	li 	$v0, 4
	la 	$a0, movie1_str
	syscall
	j	main__epilogue

day2:
	li 	$v0, 4
	la 	$a0, movie2_str
	syscall
	j	main__epilogue

day3:
	li 	$v0, 4
	la 	$a0, movie3_str
	syscall
	j	main__epilogue

day4:
	li 	$v0, 4
	la 	$a0, movie4_str
	syscall
	j	main__epilogue

day5:
	li 	$v0, 4
	la 	$a0, movie5_str
	syscall
	j	main__epilogue

day6:
	li 	$v0, 4
	la 	$a0, movie6_str
	syscall
	j	main__epilogue

day7:
	li 	$v0, 4
	la 	$a0, movie7_str
	syscall
	j	main__epilogue

invalid_day:
	li 	$v0, 4
	la 	$a0, invalid_day_str
	syscall
	j	main__epilogue

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
movie2_str:			.asciiz "Howl's Moving Castle\n"
movie3_str:			.asciiz "Kiki's Delivery Service\n"
movie4_str:			.asciiz "Totoro\n"
movie5_str:			.asciiz "Grave of the Fireflies\n"
movie6_str:			.asciiz "Spirited Away\n"
movie7_str:			.asciiz "When Marnie Was There\n"