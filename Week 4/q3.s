# A[i] calculations uses sub, not add

.globl main

.data

prompt_array_prefix:
.asciiz "Enter element                                                                                      # "
prompt_array_suffix:
.asciiz ": "
prompt_key:
.asciiz "Enter key: "
result_array:
.asciiz "Sorted array: "
result_key_success:
.asciiz " is FOUND in the array at index : "
result_key_failure:
.asciiz " is NOT FOUND in the array."
space:
.asciiz " "
newline:
.asciiz "\n"

.text

# s0 - Base address of array
# s5 - n

main:
	li      $s6,                                4
	move    $s0,                                $sp
	addi    $s0,                                $s0,                    -4
	jal     get_array
	jal     get_key
	move    $a0,                                $s0
	li      $a1,                                0
	addi    $a2,                                $s6,                    -1
	jal     recursive_sort
	jal     print_array

	li      $v0,                                4
	la      $a0,                                newline
	syscall 

	move    $a0,                                $s0
	li      $a1,                                0
	addi    $a2,                                $s6,                    -1
	move    $a3,                                $s5
	jal     recursive_search

	move    $s1,                                $v0

	li      $v0,                                1
	move    $a0,                                $s5
	syscall 

	beq     $s1,                                -1,                     not_found
	bne     $s1,                                -1,                     found

not_found:
	li      $v0,                                4
	la      $a0,                                result_key_failure
	syscall 
	j       exit

found:
	li      $v0,                                4
	la      $a0,                                result_key_success
	syscall 

	li      $v0,                                1
	move    $a0,                                $s1
	syscall 
	j       exit

get_array:
	li      $t0,                                0
	j       get_array_loop

get_array_loop:
	beq     $t0,                                $s6,                    get_array_done

	li      $v0,                                4
	la      $a0,                                prompt_array_prefix
	syscall 

	li      $v0,                                1
	addi    $a0,                                $t0,                    1
	syscall 

	li      $v0,                                4
	la      $a0,                                prompt_array_suffix
	syscall 

	li      $v0,                                5
	syscall 
	addi    $sp,                                $sp,                    -4
	sw      $v0,                                0($sp)

	addi    $t0,                                $t0,                    1
	j       get_array_loop

get_array_done:
	jr      $ra

get_key:
	li      $v0,                                4
	la      $a0,                                prompt_key
	syscall 

	li      $v0,                                5
	syscall 
	move    $s5,                                $v0
	jr      $ra

print_array:
	li      $t0,                                0
	move    $t1,                                $s0
	li      $v0,                                4
	la      $a0,                                result_array
	syscall 
	j       print_array_loop

print_array_loop:
	beq     $t0,                                $s6,                    print_array_done

	li      $v0,                                1
	lw      $a0,                                0($t1)
	syscall 

	li      $v0,                                4
	la      $a0,                                space
	syscall 

	addi    $t0,                                $t0,                    1
	addi    $t1,                                $t1,                    -4
	j       print_array_loop

print_array_done:
	jr      $ra

recursive_sort:
                                                                                                            # $a0 - A
                                                                                                            # $a1 - left
                                                                                                            # $a2 - right
	addi    $sp,                                $sp,                    -16
	sw      $ra,                                12($sp)
	sw      $s3,                                8($sp)
	sw      $s2,                                4($sp)
	sw      $s1,                                0($sp)
	move    $s1,                                $a1                                                            # l
	move    $s2,                                $a2                                                            # r
	move    $s3,                                $a1                                                            # p
	j       recursive_sort_outer_loop

recursive_sort_outer_loop:
	bge     $s1,                                $s2,                    recursive_sort_done
	j       recursive_sort_inner_first

recursive_sort_inner_first:
	sll     $t0,                                $s1,                    2
	sub     $t1,                                $a0,                    $t0
	sll     $t2,                                $s3,                    2
	sub     $t3,                                $a0,                    $t2
	lw      $t4,                                0($t1)
	lw      $t5,                                0($t3)
	bgt     $t4,                                $t5,                    recursive_sort_inner_second
	bge     $s1,                                $a2,                    recursive_sort_inner_second
	addi    $s1,                                $s1,                    1
	j       recursive_sort_inner_first

recursive_sort_inner_second:
	sll     $t0,                                $s2,                    2
	sub     $t1,                                $a0,                    $t0
	sll     $t2,                                $s3,                    2
	sub     $t3,                                $a0,                    $t2
	lw      $t4,                                0($t1)
	lw      $t5,                                0($t3)
	blt     $t4,                                $t5,                    recursive_sort_if
	ble     $s2,                                $a1,                    recursive_sort_if
	addi    $s2,                                $s2,                    -1
	j       recursive_sort_inner_second

recursive_sort_if:
	blt     $s1,                                $s2,                    recursive_sort_wrap_one_loop

	sll     $t0,                                $s2,                    2
	sub     $t1,                                $s0,                    $t0
	sll     $t2,                                $s3,                    2
	sub     $t3,                                $s0,                    $t2
	lw      $t4,                                0($t1)
	lw      $t5,                                0($t3)
	sw      $t4,                                0($t3)
	sw      $t5,                                0($t1)
                                                                                                            # $s1, $s2, $s3, $a0, $a1, $a3, $ra are in use
	addi    $sp,                                $sp,                    -12
	sw      $a2,                                8($sp)
	sw      $a1,                                4($sp)
	sw      $a0,                                0($sp)

	move    $a0,                                $s0
	addi    $a2,                                $s2,                    -1
	jal     recursive_sort

	lw      $a0,                                0($sp)
	lw      $a1,                                4($sp)
	lw      $a2,                                8($sp)
	addi    $sp,                                $sp,                    12


	addi    $sp,                                $sp,                    -12
	sw      $a2,                                8($sp)
	sw      $a1,                                4($sp)
	sw      $a0,                                0($sp)

	move    $a0,                                $s0
	addi    $a1,                                $s2,                    1
	jal     recursive_sort

	lw      $a0,                                0($sp)
	lw      $a1,                                4($sp)
	lw      $a2,                                8($sp)
	addi    $sp,                                $sp,                    12
	j       recursive_sort_done

recursive_sort_wrap_one_loop:
                                                                                                            # SWAP(A[l], A[r]);
	sll     $t0,                                $s1,                    2
	sub     $t1,                                $s0,                    $t0
	sll     $t2,                                $s2,                    2
	sub     $t3,                                $s0,                    $t2
	lw      $t4,                                0($t1)
	lw      $t5,                                0($t3)
	sw      $t4,                                0($t3)
	sw      $t5,                                0($t1)
	j       recursive_sort_outer_loop

recursive_sort_done:
	lw      $s1,                                0($sp)
	lw      $s2,                                4($sp)
	lw      $s3,                                8($sp)
	lw      $ra,                                12($sp)
	addi    $sp,                                $sp,                    16
	jr      $ra

recursive_search:
                                                                                                            # $a0 - A
                                                                                                            # $a1 - start
                                                                                                            # $a2 - end
                                                                                                            # $a3 - key
                                                                                                            # figure out which $s registers are to be saved along with $r
	addi    $sp,                                $sp,                    -4
	sw      $ra,                                0($sp)
	bgt     $a1,                                $a2,                    recursive_search_end
	move    $t0,                                $a2
	sub     $t0,                                $t0,                    $a1
	li      $t1,                                3
	div     $t0,                                $t1                                                            # $t0 / $t1
	mflo    $t2                                                                                                # $t2 = floor($t0 / $t1)
	add     $t3,                                $a1,                    $t2
	sub     $t4,                                $a2,                    $t2

	sll     $t0,                                $t3,                    2
	sub     $s1,                                $s0,                    $t0
	sll     $t1,                                $t4,                    2
	sub     $s2,                                $s0,                    $t1
	lw      $s3,                                0($s1)
	lw      $s4,                                0($s2)

	beq     $a3,                                $s3,                    recursive_search_end_mid1
	beq     $a3,                                $s4,                    recursive_search_end_mid2
	blt     $a3,                                $s3,                    recursive_search_end_first_part
	bgt     $a3,                                $s4,                    recursive_search_end_third_part
	j       recursive_search_end_second_part

recursive_search_end:
	li      $v0,                                -1
	lw      $ra,                                0($sp)
	addi    $sp,                                $sp,                    4
	jr      $ra

recursive_search_end_mid1:
	move    $v0,                                $t3
	lw      $ra,                                0($sp)
	addi    $sp,                                $sp,                    4
	jr      $ra

recursive_search_end_mid2:
	move    $v0,                                $t4
	lw      $ra,                                0($sp)
	addi    $sp,                                $sp,                    4
	jr      $ra

recursive_search_end_first_part:
	move    $a0,                                $s0
	addi    $a2,                                $t3,                    -1
	jal     recursive_search
	lw      $ra,                                0($sp)
	addi    $sp,                                $sp,                    4
	jr      $ra

recursive_search_end_third_part:
	move    $a0,                                $s0
	addi    $a1,                                $t4,                    1
	jal     recursive_search
	lw      $ra,                                0($sp)
	addi    $sp,                                $sp,                    4
	jr      $ra

recursive_search_end_second_part:
	move    $a0,                                $s0
	addi    $a1,                                $t3,                    1
	addi    $a2,                                $t4,                    -1
	jal     recursive_search
	lw      $ra,                                0($sp)
	addi    $sp,                                $sp,                    4
	jr      $ra

exit:
	li      $v0,                                10
	syscall 
