# This program calculates transpose of a matrix of size (m * n)

.data

# program text constants
prompt:
.asciiz "Enter four positive integers m, n, a and r:\n"

matrixA:
.asciiz "Matrix A:\n"

matrixB:
.asciiz "Matrix B:\n"

space:
.asciiz " "

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
	li      $v0,            4                  # system call #4 - print string
	la      $a0,            prompt
	syscall                                    # execute

	li      $v0,            5                  # $v0 = 5
	syscall                                    # input m
	move    $s0,            $v0                # $s0 = $v0

	li      $v0,            5                  # $v0 = 5
	syscall                                    # input n
	move    $s1,            $v0                # $s1 = $v0

	li      $v0,            5                  # $v0 = 5
	syscall                                    # input a
	move    $s2,            $v0                # $s2 = $v0

	li      $v0,            5                  # $v0 = 5
	syscall                                    # input r
	move    $s3,            $v0                # $s3 = $v0

	mul     $s4,            $s0,    $s1        # $s4 = $s0 * $s1

	jal     mallocInStack                      # jump to mallocInStack and save position to $ra
	move    $s5,            $v0                # $s5 = $v0

	jal     mallocInStack                      # jump to mallocInStack and save position to $ra
	move    $s6,            $v0                # $s6 = $v0

mallocInStack:
	move    $v0,            $sp                # $v0 = $sp

	sll     $a0,            $a0,    2          # $a0 = $a0 << 2
	sub     $sp,            $sp,    $a0        # $sp = $sp - $a0
	jr      $ra                                # jump to $ra



