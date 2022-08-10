# MIPS Assignment 1 - Problem 4
# Semester - 5
# Group    - 79
# Members  - Ritwik Ranjan Mallik (20CS10049)
#            Utsav Basu (20CS30057)

# This program that checks if a positive integer n (user input) is a perfect
# number or not

.globl main

.data

# program output text constants
prompt:
.asciiz "Enter a positive number: "

result_yes:
.asciiz "Entered number is a perfect number!"

result_no:
.asciiz "Entered number is not a perfect number!"

wrong:
.asciiz "Wrong Input! Entered number is not a positive integer.\n"

.text

# main program

# program variables
# n:	$s0
# sum:	$s1
# i:	$s2
# rem:	$s3

main:
	li      $v0,    4                              # issue prompt
	la      $a0,    prompt
	syscall 

	li      $v0,    5                              # get n from user
	syscall 
	move    $s0,    $v0

	ble     $s0,    0,          validate_input     # if n <= 0 then goto validate_input

	li      $s1,    0                              # sum = 0
	li      $s2,    0                              # i = 0

for:
	addi    $s2,    $s2,        1                  # i = i + 1
	ble     $s0,    $s2,        endf               # if n <= i then goto endf (exit loop)

	div     $s0,    $s2                            # n / i
	mfhi    $s3                                    # rem = n % i

	beq     $s3,    0,          divisor            # if rem == 0 then goto divisor
	b       for                                    # branch to for

divisor:
	add     $s1,    $s1,        $s2                # sum = sum + i
	b       for

endf:
	beq     $s1,    $s0,        perfect            # if sum == n then goto perfect
	bne     $s1,    $s0,        not_perfect        # if sum != n then goto not_perfect

perfect:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    result_yes                     # perfect number
	syscall 

	b       finish                                 # branch to finish

not_perfect:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    result_no                      # not perfect number
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

