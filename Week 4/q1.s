# This program calculates determinant of a matrix

.data

# program text constants
prompt:
.asciiz "Enter four positive integers (n, a, r and m) :\n"

matrixA:
.asciiz "\nMatrix A:\n"

det_mat:
.asciiz "Final determinant of the matrix A is: "

error:
.asciiz "Invalid Input! Inputs must be positive!\n"

space:
.asciiz "\t"

newline:
.asciiz "\n"

.text
.globl main

# main program
# n:		$s0
# a:		$s1
# r:		$s2
# m:		$s3
# n*n:		$s4
# matrixA:	$s5

main:
	li      $v0,            4                                  # system call #4 - print string
	la      $a0,            prompt
	syscall                                                    # execute

	li      $v0,            5                                  # $v0 = 5
	syscall                                                    # input n
	move    $s0,            $v0                                # $s0 = $v0

	li      $v0,            5                                  # $v0 = 5
	syscall                                                    # input a
	move    $s1,            $v0                                # $s1 = $v0

	li      $v0,            5                                  # $v0 = 5
	syscall                                                    # input r
	move    $s2,            $v0                                # $s2 = $v0

	li      $v0,            5                                  # $v0 = 5
	syscall                                                    # input m
	move    $s3,            $v0                                # $s3 = $v0

	ble     $s0,            0,          invalid_input          # if $s0 <= 0 then invalid_input
	ble     $s1,            0,          invalid_input          # if $s1 <= 0 then invalid_input
	ble     $s2,            0,          invalid_input          # if $s2 <= 0 then invalid_input
	ble     $s3,            0,          invalid_input          # if $s3 <= 0 then invalid_input

	mul     $s4,            $s0,        $s0                    # $s4 = $s0 * $s0

	move    $a0,            $s4                                # $a0 = $s4
	jal     mallocInStack                                      # jump to mallocInStack and save position to $ra
	move    $s5,            $v0                                # $s5 = $v0

	move    $a0,            $s0                                # $a0 = $s0
	move    $a1,            $s1                                # $a1 = $s1
	move    $a2,            $s2                                # $a2 = $s2
	move    $a3,            $s3                                # $a3 = $s3
	addi    $sp,            $sp,        -4                     # $sp = $sp + -4
	sw      $s5,            0($sp)                             # save $s5
	jal     fillMatrix                                         # jump to fillMatrix and save position to $ra
	addi    $sp,            $sp,        4                      # $sp = $sp + 4

	li      $v0,            4                                  # system call #4 - print string
	la      $a0,            matrixA
	syscall                                                    # execute

	move    $a0,            $s0                                # $a0 = $s0
	move    $a1,            $s5                                # $a1 = $s5
	jal     printMatrix                                        # jump to printMatrix and save position to $ra

	move    $a0,            $s0                                # $a0 = $s0
	addi    $a0,            $a0,        -1                     # $a0 = $a0 + -1
	mul     $a0,            $a0,        $a0                    # $a0 = $a0 * $a0
	jal     mallocInStack                                      # jump to mallocInStack and save position to $ra
	move    $s6,            $v0                                # $s6 = $v0

	move    $a0,            $s0                                # $a0 = $s0
	li      $a1,            0                                  # $a1 = 0
	li      $a2,            0                                  # $a2 = 0
	addi    $sp,            $sp,        -4                     # $sp = $sp + -4
	sw      $s5,            0($sp)
	addi    $sp,            $sp,        -4                     # $sp = $sp + -4
	sw      $s6,            0($sp)
	jal     get_minor                                          # jump to get_minor and save position to $ra
	addi    $sp,            $sp,        8                      # $sp = $sp + 8

	move    $a0,            $s0                                # $a0 = $s0
	addi    $a0,            $a0,        -1                     # $a0 = $a0 + -1
	move    $a1,            $s6                                # $a1 = $s6
	jal     printMatrix                                        # jump to printMatrix and save position to $ra


	li      $v0,            10                                 # $v0 = 10
	syscall                                                    # exit

invalid_input:
	li      $v0,            4                                  # system call #4 - print string
	la      $a0,            error
	syscall                                                    # execute

	b       main


# procedure mallocInStack
# $a0:	size of allocation
# $v0:	address of start of matrix
mallocInStack:
	move    $v0,            $sp                                # $v0 = $sp

	sll     $a0,            $a0,        2                      # $a0 = $a0 << 2
	sub     $sp,            $sp,        $a0                    # $sp = $sp - $a0
	jr      $ra                                                # jump to $ra


# procedure printMatrix
# $a0:	n
# $a1:	start address of matrix
# $t0:	i
# $t1:	j
# $t2:	temporary to calculate location of Mat[i][j]
# $t3:	temporary to store m
printMatrix:
	li      $t0,            0                                  # $t0 = 0
	move    $t3,            $a0                                # $t3 = $a0

print_loop_i:
	li      $t1,            0                                  # $t1 = 0

print_loop_j:
	mul     $t2,            $t0,        $t3                    # $t2 = $t0 * $t3
	add     $t2,            $t2,        $t1                    # $t2 = $t2 + $t1
	sll     $t2,            $t2,        2                      # $t2 = $t2 << 2
	add     $t2,            $t2,        $a1                    # $t2 = $t2 + $a1
	lw      $t2,            0($t2)                             # $t2 = Mem[$t2]

	li      $v0,            1                                  # system call #1 - print int
	move    $a0,            $t2
	syscall                                                    # execute

	li      $v0,            4                                  # system call #4 - print string
	la      $a0,            space
	syscall                                                    # execute

	addi    $t1,            $t1,        1                      # $t1 = $t1 + 1
	blt     $t1,            $t3,        print_loop_j           # if $t1 < $t3 then print_loop_j

	li      $v0,            4                                  # system call #4 - print string
	la      $a0,            newline
	syscall                                                    # execute

	addi    $t0,            $t0,        1                      # $t0 = $t0 + 1
	blt     $t0,            $t3,        print_loop_i           # if $t0 < $t3 then print_loop_i

	jr      $ra                                                # jump to $ra


# procedure fillMatrix
# $a0:	n
# $a1:	a
# $a2:	r
# $a3:	m
# start address of matrix at top of stack
# $t0:	i
# $t1:	j
# $t2:	temporary to calculate location of Mat[i][j]
# $t3:	to store terms of GP(a,r) mod m
# $t4:	temporary to store start address of matrix
fillMatrix:
	li      $t0,            0                                  # $t0 = 0
	move    $t3,            $a1                                # $t3 = $a1
	lw      $t4,            0($sp)                             # get matrix start

fill_loop_i:
	li      $t1,            0                                  # $t1 = 0

fill_loop_j:
	mul     $t2,            $t0,        $a0                    # $t2 = $t0 * $a0
	add     $t2,            $t2,        $t1                    # $t2 = $t2 + $t1
	sll     $t2,            $t2,        2                      # $t2 = $t2 << 2
	add     $t2,            $t2,        $t4                    # $t2 = $t2 + $t4

	sw      $t3,            0($t2)                             # Mem[t2] = $t3

	mul     $t3,            $t3,        $a2                    # $t3 = $t3 * $a2
	div     $t3,            $a3                                # $t3 / $a3
	mfhi    $t3                                                # $t3 = $t3 mod $a3

	addi    $t1,            $t1,        1                      # $t1 = $t1 + 1
	blt     $t1,            $a0,        fill_loop_j            # if $t1 < $a0 then fill_loop_j

	addi    $t0,            $t0,        1                      # $t0 = $t0 + 1
	blt     $t0,            $a0,        fill_loop_i            # if $t0 < $a0 then fill_loop_i

	jr      $ra                                                # jump to $ra

# procedure get_minor
# $a0:	n
# $a1:	x
# $a2:	y
# start address of matrix and minor at top of stack
# $t0:	i
# $t1:	j
# $t2:	mi
# $t3:	mj
# $t4:	temporary to store start address of matrix
# $t5:	temporary to store start address of minor
# $t6:	temporary to calculate location of matrix[i][j]
# $t7:	temporary to calculate location of minor[mi][mj]
# $t8:	store and transfer the value
# $t9:	n-1

get_minor:
	ble     $a0,            1,          exit_get_minor         # if $a0 <= 1 then exit_get_minor

	li      $t0,            0                                  # $t0 = 0
	li      $t2,            0                                  # $t2 = 0
	lw      $t4,            4($sp)
	lw      $t5,            0($sp)

	move    $t9,            $a0                                # $t9 = $a0
	addi    $t9,            $t9,        -1                     # $t9 = $t9 + -1


get_minor_i:
	blt     $t0,            $a0,        exit_get_minor         # if $t0 < $a0 then exit_get_minor
	beq     $a1,            $t0,        get_minor_inc_i        # if $a1 == $t0 then get_minor_inc_i

	li      $t1,            0                                  # $t1 = 0
	li      $t3,            0                                  # $t3 = 0

get_minor_j:
	blt     $t1,            $a0,        end_get_minor_j        # if $t1 < $a0 then end_get_minor_j
	beq     $a2,            $t1,        get_minor_inc_j        # if $a2 == $t1 then get_minor_inc_i

	mul     $t6,            $t0,        $a0                    # $t6 = $t0 * $a0
	add     $t6,            $t6,        $t1                    # $t6 = $t6 + $t1
	sll     $t6,            $t6,        2                      # $t6 = $t6 << 2
	add     $t6,            $t6,        $t4                    # $t6 = $t6 + $t4

	mul     $t7,            $t2,        $t9                    # $t7 = $t2 * $t9
	add     $t7,            $t7,        $t3                    # $t7 = $t7 + $t3
	sll     $t7,            $t7,        2                      # $t7 = $t7 << 2
	add     $t7,            $t7,        $t5                    # $t7 = $t7 + $t5

	lw      $t8,            0($t6)
	sw      $t8,            0($t7)

	addi    $t3,            $t2,        1                      # $t2 = $t2 + 1
get_minor_inc_j:
	addi    $t1,            $t1,        1                      # $t1 = $t0 + 1
	b       get_minor_j                                        # branch to get_minor_i

end_get_minor_j:
	addi    $t2,            $t2,        1                      # $t2 = $t2 + 1
get_minor_inc_i:
	addi    $t0,            $t0,        1                      # $t0 = $t0 + 1
	b       get_minor_i                                        # branch to get_minor_i


exit_get_minor:
	jr      $ra                                                # jump to $ra
