# This program finds k-th largest number in an array of 10 integers

.data

# program text constants
prompt:
.asciiz "Enter 10 numbers:\n"

prompt_k:
.asciiz "Enter the value of k [1-10]: "

result:
.asciiz "k-th largest number is: "

error_msg:
.asciiz "Input k is out of range! Try again!\n"

.align 2
array:
.space 40                                   # Allocate space for 10 integers

.text
.globl main

# main program

# program variables
# n:	$s0
# k:	$s1

main:
	li      $v0,            4                  # $v0 = 4
	la      $a0,            prompt             # print prompt
	syscall 

loop:
	li      $v0,            5                  # $v0 = 5
	syscall                                    # input numbers of array

	sw      $v0,            0($t0)             # array[i] = $v0
	add     $t0,            $t0,        4      # $t0 = $t0 + 4
	sub     $s1,            $s1,        1      # $s1 = $s1 - 1
	bnez    $s1,            loop               # loop

	jal     sort_array                         # jump to sort_array and save position to $ra

	li      $v0,            4                  # $v0 = 4
	la      $a0,            prompt_k           # print prompt_k
	syscall 

	li      $v0,            5                  # $v0 = 5
	syscall 

	move    $a0,            $v0                # $a0 = $v0
	jal     find_k_largest                     # jump to find_k_largest and save position to $ra
	move    $s3,            $v0                # $s3 = $v0

	li      $v0,            4                  # $v0 = 4
	la      $a0,            result             # print result
	syscall 

	li      $v0,            1                  # $v0 = 1
	move    $a0,            $s0                # $a0 = $s0
	syscall 


sort_array:


find_k_largest:
	lw      $v0,            array($a0)         # $v0 = array[$a0]
	jr      $ra                                # jump to $ra


# procedure swap
# temp0:	$t0
# temp1:	$t1
swap:
	sub     $sp,            $sp,        4      # $sp = $sp - 4
	sw      $t0,            0($sp)             # save t0
	sub     $sp,            $sp,        4      # $sp = $sp - 4
	sw      $t1,            0($sp)             # save t1

	lw      $t0,            array($a0)         # temp0 = array[$a0]
	lw      $t1,            array($a1)         # temp1 = array[$a1]
	sw      $t1,            array($a0)         # array[$a0] = temp1
	sw      $t0,            array($a1)         # array[$a0] = temp1

	lw      $t1,            0($sp)             # restore t1
	addi    $sp,            $sp,        4      # $sp = $sp + 4
	lw      $t0,            0($sp)             # restore t0
	addi    $sp,            $sp,        4      # $sp = $sp + 4

	jr      $ra                                # jump to $ra



