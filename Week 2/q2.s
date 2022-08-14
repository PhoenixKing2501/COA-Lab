# This program finds k-th largest number in an array of 10 integers

.data

# program text constants
prompt:
.asciiz "Enter 10 numbers:\n"

prompt_num:
.asciiz "Enter number: "

prompt_k:
.asciiz "Enter the value of k [1-10]: "

result:
.asciiz "k-th largest number is: "

error_msg:
.asciiz "Input k is out of range! Try again!\n"

newline:
.asciiz "\n"

.align 2
array:
.space 40                                               # Allocate space for 10 integers

.text
.globl main

# main program

main:
	li      $v0,            4                              # $v0 = 4
	la      $a0,            prompt                         # print prompt
	syscall 

	li      $t0,            0                              # $t0 = 0

loop:
	li      $v0,            4                              # $v0 = 4
	la      $a0,            prompt_num                     # print prompt
	syscall 

	li      $v0,            5                              # $v0 = 5
	syscall                                                # input numbers of array

	sw      $v0,            array($t0)                     # array[i] = $v0
	addi    $t0,            $t0,        4                  # $t0 = $t0 + 4
	blt     $t0,            40,         loop               # if $t0 < 40 then loop

# jal     print_array                                    # jump to print_array and save position to $ra

	jal     sort_array                                     # jump to sort_array and save position to $ra

# jal     print_array                                    # jump to print_array and save position to $ra

input_k:
	li      $v0,            4                              # $v0 = 4
	la      $a0,            prompt_k                       # print prompt_k
	syscall 

	li      $v0,            5                              # $v0 = 5
	syscall 

	ble     $v0,            0,          invalid_k          # if $v0 <= 0 then invalid_k
	bgt     $v0,            10,         invalid_k          # if $v0 > 10 then invalid_k

	move    $a0,            $v0                            # $a0 = $v0
	li      $t0,            10                             # $t0 = 10
	sub     $a0,            $t0,        $a0                # $a0 = $t0 - $a0

	jal     find_k_largest                                 # jump to find_k_largest and save position to $ra
	move    $s1,            $v0                            # $s1 = $v0

	li      $v0,            4                              # $v0 = 4
	la      $a0,            result                         # print result
	syscall 

	li      $v0,            1                              # $v0 = 1
	move    $a0,            $s1                            # $a0 = $s1
	syscall 

	li      $v0,            10                             # $v0 = 10
	syscall                                                # exit

invalid_k:
	li      $v0,            4                              # system call #4 - print string
	la      $a0,            error_msg
	syscall                                                # execute

	b       input_k                                        # branch to input_k


# procedure print_array
# used for debugging
# print_array:
# sub     $sp,            $sp,        4                  # $sp = $sp - 4
# sw      $t0,            0($sp)                         # save t0
# sub     $sp,            $sp,        4                  # $sp = $sp - 4
# sw      $ra,            0($sp)                         # save ra

# li      $t0,            0                              # $t0 = 0

# print_loop:
# li      $v0,            1                              # system call #1 - print int
# lw      $a0,            array($t0)
# syscall                                                # execute

# addi    $t0,            $t0,        4                  # $t0 = $t0 + 4
# blt     $t0,            40,         print_loop         # if $t0 < 40 then print_loop

# li      $v0,            4                              # system call #4 - print string
# la      $a0,            newline
# syscall                                                # execute

# lw      $ra,            0($sp)                         # restore ra
# addi    $sp,            $sp,        4                  # $sp = $sp + 4
# lw      $t0,            0($sp)                         # restore t0
# addi    $sp,            $sp,        4                  # $sp = $sp + 4

# jr      $ra                                            # jump to $ra

# procedure sort_array
# i:			$t0
# j:			$t1
# j+1:			$t2
# array[j]:		$t3
# array[j+1]:	$t4
# n-i-1:		$t5
sort_array:
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t0,            0($sp)                         # save t0
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t1,            0($sp)                         # save t1
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t2,            0($sp)                         # save t2
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t3,            0($sp)                         # save t3
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t4,            0($sp)                         # save t4
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t5,            0($sp)                         # save t5
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $ra,            0($sp)                         # save ra

	li      $t0,            0                              # $t0 = 0

sort_loop_i:
	li      $t1,            0                              # $t1 = 0
	addi    $t2,            $t1,        4                  # $t2 = $t1 + 4

sort_loop_j:
	lw      $t3,            array($t1)                     # $t3 = array[$t1]
	lw      $t4,            array($t2)                     # $t4 = array[$t2]

	ble     $t3,            $t4,        skip_j             # if $t3 <= $t4 then skip_j

	move    $a0,            $t1                            # $a0 = $t1
	move    $a1,            $t2                            # $a1 = $t2
	jal     swap                                           # jump to swap and save position to $ra

skip_j:
	li      $t5,            40                             # $t5 = 40
	sub     $t5,            $t5,        $t0                # $t5 = $t5 - $t0

	move    $t1,            $t2                            # $t1 = $t2
	addi    $t2,            $t2,        4                  # $t2 = $t2 + 4
	blt     $t2,            $t5,        sort_loop_j        # if $t1 < $t5 then sort_loop_j

	addi    $t0,            $t0,        4                  # $t0 = $t0 + 4
	blt     $t0,            40,         sort_loop_i        # if $t0 < 40 then sort_loop_i

	lw      $ra,            0($sp)                         # restore ra
	addi    $sp,            $sp,        4                  # $sp = $sp + 4
	lw      $t5,            0($sp)                         # restore t5
	addi    $sp,            $sp,        4                  # $sp = $sp + 4
	lw      $t4,            0($sp)                         # restore t4
	addi    $sp,            $sp,        4                  # $sp = $sp + 4
	lw      $t3,            0($sp)                         # restore t3
	addi    $sp,            $sp,        4                  # $sp = $sp + 4
	lw      $t2,            0($sp)                         # restore t2
	addi    $sp,            $sp,        4                  # $sp = $sp + 4
	lw      $t1,            0($sp)                         # restore t1
	addi    $sp,            $sp,        4                  # $sp = $sp + 4
	lw      $t0,            0($sp)                         # restore t0
	addi    $sp,            $sp,        4                  # $sp = $sp + 4

	jr      $ra                                            # jump to $ra


# procedure find_k_largest
find_k_largest:
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t0,            0($sp)                         # save t0

	sll     $t0,            $a0,        2                  # $t0 = $a0 << 2
	lw      $v0,            array($t0)                     # $v0 = array[$a0]

	lw      $t0,            0($sp)                         # restore t0
	addi    $sp,            $sp,        4                  # $sp = $sp + 4

	jr      $ra                                            # jump to $ra


# procedure swap
# temp0:	$t0
# temp1:	$t1
swap:
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t0,            0($sp)                         # save t0
	sub     $sp,            $sp,        4                  # $sp = $sp - 4
	sw      $t1,            0($sp)                         # save t1

	lw      $t0,            array($a0)                     # temp0 = array[$a0]
	lw      $t1,            array($a1)                     # temp1 = array[$a1]
	sw      $t1,            array($a0)                     # array[$a0] = temp1
	sw      $t0,            array($a1)                     # array[$a1] = temp0

	lw      $t1,            0($sp)                         # restore t1
	addi    $sp,            $sp,        4                  # $sp = $sp + 4
	lw      $t0,            0($sp)                         # restore t0
	addi    $sp,            $sp,        4                  # $sp = $sp + 4

	jr      $ra                                            # jump to $ra



