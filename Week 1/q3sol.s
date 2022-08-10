# MIPS Assignment 1 - Problem 3
# Semester - 5
# Group    - 79
# Members  - Ritwik Ranjan Mallik (20CS10049)
#            Utsav Basu (20CS30057)

# This program that checks if a positive integer n (user input) >= 10 is a prime number or not

.globl main

.data

# program output text constants
prompt:
.asciiz "Enter a positive number greater than or equal to 10: "

result_yes:
.asciiz "Entered number is a PRIME number!"

result_no:
.asciiz "Entered number is a COMPOSITE number!"

wrong:
.asciiz "Wrong Input! Entered number is less than 10.\n"

.text

# main program

# program variables
# n:	$s0
# i:	$s1
# t:	$s2 (to store i^2)
# rem:	$s3

main:
	li      $v0,    4                              # issue prompt
	la      $a0,    prompt
	syscall 

	li      $v0,    5                              # get n from user
	syscall 
	move    $s0,    $v0

	blt     $s0,    10,         validate_input     # if n < 10 then goto validate_input

	li      $s1,    1                              # i = 1

for:
	addi    $s1,    $s1,        1                  # i = i + 1
	mul     $s2,    $s1,        $s1                # t = i * i
	blt     $s0,    $s2,        prime              # if n < t then goto endf (exit loop)

	div     $s0,    $s1                            # n / i
	mfhi    $s3                                    # rem = n % i

	beq     $s3,    0,          not_prime          # if rem == 0 then goto divisor
	b       for                                    # branch to for

prime:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    result_yes                     # prime number
	syscall 

	b       finish                                 # branch to finish

not_prime:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    result_no                      # not prime number
	syscall 

	b       finish                                 # branch to finish

finish:
	li      $v0,    10                             # $v0 = 10
	syscall 

validate_input:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    wrong                          # print wrong input
	syscall 
	b       main                                   # branch to main

