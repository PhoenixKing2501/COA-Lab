# This program multiplies two 16-bit numbers, Q and M (user inputs)

.data

# program text constants
prompt1:
.asciiz "Enter first number: "

prompt2:
.asciiz "Enter second number: "

result:
.asciiz "Product of the two numbers are: "

error_msg:
.asciiz "Input out of range! Try again!\n"

.text
.globl main

# main program

# program variables
# M:	$s0
# Q:	$s1

main:
	li      $v0,            4                              # $v0 = 4
	la      $a0,            prompt1                        # print prompt1
	syscall 

	li      $v0,            5                              # $v0 = 5
	syscall                                                # input M
	move    $s0,            $v0                            # $s0 = $v0

	li      $v0,            4                              # $v0 = 4
	la      $a0,            prompt2                        # print prompt2
	syscall 

	li      $v0,            5                              # $v0 = 5
	syscall                                                # input Q
	move    $s1,            $v0                            # $s1 = $v0

# ########## INPUT VALIDATION ################
	blt     $s0,            -32768,     invalid_input      # if $s0 < -32768 then invalid_input
	bgt     $s0,            32767,      invalid_input      # if $s0 > 32767 then invalid_input

	blt     $s1,            -32768,     invalid_input      # if $s1 < -32768 then invalid_input
	bgt     $s1,            32767,      invalid_input      # if $s1 > 32767 then invalid_input

	move    $a0,            $s0                            # $a0 = $s0 (M)
	move    $a1,            $s1                            # $a1 = $s1 (Q)
	jal     multiply_booth                                 # jump to multiply_booth and save position to $ra
	move    $t0,            $v0                            # $t0 = $v0

	li      $v0,            4                              # $v0 = 4
	la      $a0,            result                         # print result
	syscall 

	li      $v0,            1                              # $v0 = 1
	move    $a0,            $t0                            # $a0 = $t0
	syscall                                                # print product

	li      $v0,            10                             # $v0 = 10
	syscall 

invalid_input:
	li      $v0,            4                              # $v0 = 4
	la      $a0,            error_msg                      # print error_msg
	syscall 
	b       main                                           # branch to main


# procedure multiply_booth
# [A;Q]:	$t0
# Q_0:		$t1
# Q_-1:		$t2
# count:	$t3

multiply_booth:
	move    $t0,            $a1                            # $t0 = $a1
	sll     $t0,            $t0,        16                 # $t0 = $t0 << 16
	srl     $t0,            $t0,        16                 # $t0 = $t0 >> 16

	li      $t2,            0                              # $t2 = 0
	li      $t3,            16                             # $t3 = 16
	sll     $t4,            $a0,        16                 # $t4 = $a0 << 16

mulb_start:
	andi    $t1,            $t0,        1                  # $t1 = $t0 & 1
	beq     $t2,            $t1,        mulb_equal         # if $t2 == $t1 then mulb_equal
	beq     $t2,            1,          mulb_01            # if $t2 == 1 then mulb_b01
	b       mulb_10                                        # branch to mulb_b10

mulb_01:
	add     $t0,            $t0,        $t4                # $t0 = $t0 + $t4
	b       mulb_equal                                     # branch to mulb_equal

mulb_10:
	sub     $t0,            $t0,        $t4                # $t0 = $t0 - $t4
	b       mulb_equal                                     # branch to mulb_equal

mulb_equal:
	andi    $t1,            $t0,        1                  # $t1 = $t0 & 1
	move    $t2,            $t1                            # $t2 = $t1
	sra     $t0,            $t0,        1                  # $t0 = $t0 >> 1 (arithmetic)
	sub     $t3,            $t3,        1                  # $t3 = $t3 - 1

	beqz    $t3,            mulb_end                       # if $t2 == 1 then mulb_end
	b       mulb_start                                     # branch to mulb_start

mulb_end:
	move    $v0,            $t0                            # $v0 = $t0
	jr      $ra                                            # jump to $ra



