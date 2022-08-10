# MIPS Assignment 1 - Problem 2
# Semester - 5
# Group    - 79
# Members  - Ritwik Ranjan Mallik (20CS10049)
# Utsav Basu (20CS30057)

# This program computes and displays the gcd of two integers a and b,
# where a, b are entered by the user.

.globl main

.data

# program output text constants
prompt1:
.asciiz "Please enter first positive integer: "

prompt2:
.asciiz "Please enter second positive integer: "

result:
.asciiz "GCD of the two integers is: "

wrong:
.asciiz "Wrong Input! Entered number is negative.\n"

.text

# main program

# program variables
# a:	$s0
# b:	$s1
# res:	$s2

main:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    prompt1                        # print prompt1
	syscall 

	li      $v0,    5                              # $v0 = 5
	syscall                                        # input a
	move    $s0,    $v0                            # a = $v0

	blt     $s0,    0,          validate_input     # if a < 0 then goto validate_input

	li      $v0,    4                              # $v0 = 4
	la      $a0,    prompt2                        # print prompt2
	syscall 

	li      $v0,    5                              # $v0 = 5
	syscall                                        # input b
	move    $s1,    $v0                            # b = $v0

	blt     $s1,    0,          validate_input     # if b < 0 then goto validate_input

	beq     $s0,    0,          a0                 # if a == 0 then finish

while:
	beq     $s1,    0,          end                # if b == 0 then goto end (exit loop)

	bgt     $s0,    $s1,        a_gt_b             # if a > b then goto a_gt_b
	ble     $s0,    $s1,        b_gte_a            # if a <= b then goto b_gte_a

a_gt_b:
	sub     $s0,    $s0,        $s1                # a = a - b
	b       while                                  # branch to while

b_gte_a:
	sub     $s1,    $s1,        $s0                # b = b - a
	b       while                                  # branch to while

end:
	move    $s2,    $s0                            # res = a
	b       finish                                 # branch to finish

# section to handle a == 0 case
a0:
	move    $s2,    $s1                            # res = b
	b       finish                                 # branch to finish

finish:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    result                         # print result
	syscall 

	li      $v0,    1                              # $v0 = 1
	move    $a0,    $s2                            # $a0 = res
	syscall                                        # print gcd

	li      $v0,    10                             # $v0 = 10
	syscall 

validate_input:
	li      $v0,    4                              # $v0 = 4
	la      $a0,    wrong                          # print wrong input
	syscall 
	b       main                                   # branch to main

