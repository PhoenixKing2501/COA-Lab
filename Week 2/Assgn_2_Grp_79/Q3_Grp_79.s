# MIPS Assignment 2 - Problem 3
# Semester - 5
# Group    - 79
# Members  - Utsav Basu (20CS30057)
# Ritwik Ranjan Mallik (20CS10049)

# This program calculates transpose of a matrix of size (m * n)

.data

# program text constants
prompt:
.asciiz "Enter four positive integers m, n, a and r:\n"

matrixA:
.asciiz "\nMatrix A:\n"

matrixB:
.asciiz "\nMatrix B:\n"

error:
.asciiz "Invalid Input! Matrix Dimensions must be positive!\n"

space:
.asciiz "\t"

newline:
.asciiz "\n"

.text
.globl main

# main program
# m:		$s0
# n:		$s1
# a:		$s2
# r:		$s3
# m*n:		$s4
# matrixA:	$s5
# matrixB:	$s6

main:
	li      $v0,                4                                  # system call #4 - print string
	la      $a0,                prompt
	syscall                                                        # execute

	li      $v0,                5                                  # $v0 = 5
	syscall                                                        # input m
	move    $s0,                $v0                                # $s0 = $v0

	li      $v0,                5                                  # $v0 = 5
	syscall                                                        # input n
	move    $s1,                $v0                                # $s1 = $v0

	li      $v0,                5                                  # $v0 = 5
	syscall                                                        # input a
	move    $s2,                $v0                                # $s2 = $v0

	li      $v0,                5                                  # $v0 = 5
	syscall                                                        # input r
	move    $s3,                $v0                                # $s3 = $v0

	ble     $s0,                0,          invalid_dim            # if $s0 <= 0 then invalid_dim
	ble     $s1,                0,          invalid_dim            # if $s1 <= 0 then invalid_dim

	mul     $s4,                $s0,        $s1                    # $s4 = $s0 * $s1

	move    $a0,                $s4                                # $a0 = $s4
	jal     mallocInStack                                          # jump to mallocInStack and save position to $ra
	move    $s5,                $v0                                # $s5 = $v0

	move    $a0,                $s0                                # $a0 = $s0
	move    $a1,                $s1                                # $a1 = $s1
	move    $a2,                $s2                                # $a2 = $s2
	move    $a3,                $s3                                # $a3 = $s3
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $s5,                0($sp)                             # save $s5
	jal     fillMatrix                                             # jump to fillMatrix and save position to $ra

	li      $v0,                4                                  # system call #4 - print string
	la      $a0,                matrixA
	syscall                                                        # execute

	move    $a0,                $s0                                # $a0 = $s0
	move    $a1,                $s1                                # $a1 = $s1
	move    $a2,                $s5                                # $a2 = $s5
	jal     printMatrix                                            # jump to printMatrix and save position to $ra

	move    $a0,                $s4                                # $a0 = $s4
	jal     mallocInStack                                          # jump to mallocInStack and save position to $ra
	move    $s6,                $v0                                # $s6 = $v0

	move    $a0,                $s0                                # $a0 = $s0
	move    $a1,                $s1                                # $a1 = $s1
	move    $a2,                $s5                                # $a2 = $s5
	move    $a3,                $s6                                # $a3 = $s6
	jal     transposeMatrix                                        # jump to transposeMatrix and save position to $ra

	li      $v0,                4                                  # system call #4 - print string
	la      $a0,                matrixB
	syscall                                                        # execute

	move    $a0,                $s1                                # $a0 = $s1
	move    $a1,                $s0                                # $a1 = $s0
	move    $a2,                $s6                                # $a2 = $s6
	jal     printMatrix                                            # jump to printMatrix and save position to $ra

	li      $v0,                10                                 # $v0 = 10
	syscall                                                        # exit

invalid_dim:
	li      $v0,                4                                  # system call #4 - print string
	la      $a0,                error
	syscall                                                        # execute

	b       main


# procedure mallocInStack
# $a0:	size of allocation
# $v0:	address of start of matrix
mallocInStack:
	move    $v0,                $sp                                # $v0 = $sp

	sll     $a0,                $a0,        2                      # $a0 = $a0 << 2
	sub     $sp,                $sp,        $a0                    # $sp = $sp - $a0
	jr      $ra                                                    # jump to $ra

# procedure printMatrix
# $a0:	m
# $a1:	n
# $a2:	start address of matrix
# $t0:	i
# $t1:	j
# $t2:	temporary to calculate location of Mat[i][j]
# $t3:	temporary to store m
printMatrix:
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t0,                0($sp)                             # save $t0
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t1,                0($sp)                             # save $t1
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t2,                0($sp)                             # save $t2
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t3,                0($sp)                             # save $t3

	li      $t0,                0                                  # $t0 = 0
	move    $t3,                $a0                                # $t3 = $a0

print_loop_i:
	li      $t1,                0                                  # $t1 = 0

print_loop_j:
	mul     $t2,                $t0,        $a1                    # $t2 = $t0 * $a1
	add     $t2,                $t2,        $t1                    # $t2 = $t2 + $t1
	sll     $t2,                $t2,        2                      # $t2 = $t2 << 2
	add     $t2,                $t2,        $a2                    # $t2 = $t2 + $a2
	lw      $t2,                0($t2)

	li      $v0,                1                                  # system call #1 - print int
	move    $a0,                $t2
	syscall                                                        # execute

	li      $v0,                4                                  # system call #4 - print string
	la      $a0,                space
	syscall                                                        # execute

	addi    $t1,                $t1,        1                      # $t1 = $t1 + 1
	blt     $t1,                $a1,        print_loop_j           # if $t1 < $a1 then print_loop_j

	li      $v0,                4                                  # system call #4 - print string
	la      $a0,                newline
	syscall                                                        # execute

	addi    $t0,                $t0,        1                      # $t0 = $t0 + 1
	blt     $t0,                $t3,        print_loop_i           # if $t0 < $t3 then print_loop_i

	lw      $t3,                0($sp)                             # restore $t3
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t2,                0($sp)                             # restore $t2
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t1,                0($sp)                             # restore $t1
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t0,                0($sp)                             # restore $t0
	addi    $sp,                $sp,        4                      # $sp = $sp + 4

	jr      $ra                                                    # jump to $ra

# procedure fillMatrix
# $a0:	m
# $a1:	n
# $a2:	a
# $a3:	r
# start address of matrix at top of stack
# $t0:	i
# $t1:	j
# $t2:	temporary to calculate location of Mat[i][j]
# $t3:	to store terms of GP(a,r)
# $t4:	temporary to store start address of matrix
fillMatrix:
	lw      $v0,                0($sp)                             # get matrix start
	addi    $sp,                $sp,        4                      # $sp = $sp + 4

	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t0,                0($sp)                             # save $t0
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t1,                0($sp)                             # save $t1
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t2,                0($sp)                             # save $t2
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t3,                0($sp)                             # save $t3
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t4,                0($sp)                             # save $t4

	li      $t0,                0                                  # $t0 = 0
	move    $t3,                $a2                                # $t3 = $a2
	move    $t4,                $v0                                # $t4 = $v0

fill_loop_i:
	li      $t1,                0                                  # $t1 = 0

fill_loop_j:
	mul     $t2,                $t0,        $a1                    # $t2 = $t0 * $a1
	add     $t2,                $t2,        $t1                    # $t2 = $t2 + $t1
	sll     $t2,                $t2,        2                      # $t2 = $t2 << 2
	add     $t2,                $t2,        $t4                    # $t2 = $t2 + $t4

	sw      $t3,                0($t2)

	mul     $t3,                $t3,        $a3                    # $t3 = $t3 * $a3

	addi    $t1,                $t1,        1                      # $t1 = $t1 + 1
	blt     $t1,                $a1,        fill_loop_j            # if $t1 < $a1 then fill_loop_j

	addi    $t0,                $t0,        1                      # $t0 = $t0 + 1
	blt     $t0,                $a0,        fill_loop_i            # if $t0 < $a0 then fill_loop_i

	lw      $t4,                0($sp)                             # restore $t4
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t3,                0($sp)                             # restore $t3
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t2,                0($sp)                             # restore $t2
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t1,                0($sp)                             # restore $t1
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t0,                0($sp)                             # restore $t0
	addi    $sp,                $sp,        4                      # $sp = $sp + 4

	jr      $ra                                                    # jump to $ra


# procedure transposeMatrix
# $a0:	m
# $a1:	n
# $a2:	start address of MatrixA
# $a3:	start address of matrixB
# $t0:	i
# $t1:	j
# $t2:	temporary to calculate location of MatA[i][j]
# $t3:	temporary to calculate location of MatB[i][j]
transposeMatrix:
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t0,                0($sp)                             # save $t0
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t1,                0($sp)                             # save $t1
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t2,                0($sp)                             # save $t2
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t3,                0($sp)                             # save $t3
	addi    $sp,                $sp,        -4                     # $sp = $sp + -4
	sw      $t4,                0($sp)                             # save $t4

	li      $t0,                0                                  # $t0 = 0
	move    $t3,                $a2                                # $t3 = $a2

transpose_loop_i:
	li      $t1,                0                                  # $t1 = 0

transpose_loop_j:
	mul     $t2,                $t0,        $a1                    # $t2 = $t0 * $a1
	add     $t2,                $t2,        $t1                    # $t2 = $t2 + $t1
	sll     $t2,                $t2,        2                      # $t2 = $t2 << 2
	add     $t2,                $t2,        $a2                    # $t2 = $t2 + $a2

	lw      $t4,                0($t2)

	mul     $t3,                $t1,        $a0                    # $t3 = $t1 * $a0
	add     $t3,                $t3,        $t0                    # $t3 = $t3 + $t0
	sll     $t3,                $t3,        2                      # $t3 = $t3 << 2
	add     $t3,                $t3,        $a3                    # $t3 = $t3 + $a3

	sw      $t4,                0($t3)

	addi    $t1,                $t1,        1                      # $t1 = $t1 + 1
	blt     $t1,                $a1,        transpose_loop_j       # if $t1 < $a1 then transpose_loop_j

	addi    $t0,                $t0,        1                      # $t0 = $t0 + 1
	blt     $t0,                $a0,        transpose_loop_i       # if $t0 < $a0 then transpose_loop_i

	lw      $t4,                0($sp)                             # restore $t4
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t3,                0($sp)                             # restore $t3
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t2,                0($sp)                             # restore $t2
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t1,                0($sp)                             # restore $t1
	addi    $sp,                $sp,        4                      # $sp = $sp + 4
	lw      $t0,                0($sp)                             # restore $t0
	addi    $sp,                $sp,        4                      # $sp = $sp + 4

	jr      $ra                                                    # jump to $ra

