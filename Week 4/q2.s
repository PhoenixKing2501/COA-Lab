   .globl main

    .data

prompt_prefix:
    .asciiz "Enter element #"
prompt_suffix:
    .asciiz ": "
result:
    .asciiz "Sorted array: "
space:
    .asciiz " "
newline:
    .asciiz "\n"

    .text

#s0 - Base address of array

main:
    li      $s6, 10
    sll     $t0, $s6, 2
    sub     $sp, $sp, $t0
    move    $s0, $sp
    jal get_array
    move    $a0, $s0
    li      $a1, 0
    addi    $a2, $s6, -1 
    jal recursive_sort
    jal print_array
    j exit

get_array:
    li  $t0, 0
    move    $t1, $sp
    j get_array_loop

get_array_loop:
    beq     $t0, $s6, get_array_done

    li      $v0, 4
    la      $a0, prompt_prefix
    syscall

    li       $v0, 1
    addi     $a0, $t0, 1
    syscall

    li      $v0, 4
    la      $a0, prompt_suffix
    syscall

    li      $v0, 5
    syscall
    sw		$v0, 0($t1)

    addi    $t0, $t0, 1
    addi    $t1, $t1, 4
    j get_array_loop    

get_array_done:
    jr		$ra

print_array:
    li      $t0, 0
    move    $t1, $s0
    li      $v0, 4
    la      $a0, result
    syscall
    j print_array_loop

print_array_loop:
    beq     $t0, $s6, print_array_done

    li      $v0, 1
    lw      $a0, 0($t1)
    syscall

    li      $v0, 4
    la      $a0, space
    syscall 

    addi    $t0, $t0, 1
    addi    $t1, $t1, 4
    j print_array_loop

print_array_done:
    jr      $ra

recursive_sort:
    # $a0 - A
    # $a1 - left
    # $a2 - right
    addi    $sp, $sp, -16
    sw      $ra, 12($sp)
    sw      $s3, 8($sp)
    sw      $s2, 4($sp)
    sw      $s1, 0($sp)
    move    $s1, $a1    # l
    move    $s2, $a2    # r
    move    $s3, $a1    # p
    j recursive_sort_outer_loop

recursive_sort_outer_loop:
    bge		$s1, $s2, recursive_sort_done
    j recursive_sort_inner_first

recursive_sort_inner_first:
    sll     $t0, $s1, 2
    add     $t1, $a0, $t0
    sll     $t2, $s3, 2
    add     $t3, $a0, $t2
    lw      $t4, 0($t1)
    lw      $t5, 0($t3)
    bgt     $t4, $t5, recursive_sort_inner_second
    bge     $s1, $a2, recursive_sort_inner_second
    addi    $s1, $s1, 1
    j recursive_sort_inner_first

recursive_sort_inner_second:
    sll     $t0, $s2, 2
    add     $t1, $a0, $t0
    sll     $t2, $s3, 2
    add     $t3, $a0, $t2
    lw      $t4, 0($t1)
    lw      $t5, 0($t3)
    blt     $t4, $t5, recursive_sort_if
    ble     $s2, $a1, recursive_sort_if
    addi    $s2, $s2, -1
    j recursive_sort_inner_second

recursive_sort_if:
    blt     $s1, $s2, recursive_sort_wrap_one_loop

    sll     $t0, $s2, 2
    add     $t1, $a0, $t0
    sll     $t2, $s3, 2
    add     $t3, $a0, $t2
    lw      $t4, 0($t1)
    lw      $t5, 0($t3)
    sw      $t4, 0($t3)
    sw      $t5, 0($t1)
    # $s1, $s2, $s3, $a0, $a1, $a3, $ra are in use
    addi    $sp, $sp, -12
    sw      $a2, 8($sp)
    sw      $a1, 4($sp)
    sw      $a0, 0($sp)

    move    $a0, $s0
    addi    $a2, $s2, -1
    jal     recursive_sort

    lw      $a0, 0($sp)
    lw      $a1, 4($sp)
    lw      $a2, 8($sp)
    addi    $sp, $sp, 12


    addi    $sp, $sp, -12
    sw      $a2, 8($sp)
    sw      $a1, 4($sp)
    sw      $a0, 0($sp)

    move    $a0, $s0
    addi    $a1, $s2, 1
    jal     recursive_sort

    lw      $a0, 0($sp)
    lw      $a1, 4($sp)
    lw      $a2, 8($sp)
    addi    $sp, $sp, 12
    j		recursive_sort_done

recursive_sort_wrap_one_loop:
    # SWAP(A[l], A[r]);
    sll     $t0, $s1, 2
    add     $t1, $s0, $t0
    sll     $t2, $s2, 2
    add     $t3, $s0, $t2
    lw      $t4, 0($t1)
    lw      $t5, 0($t3)
    sw      $t4, 0($t3)
    sw      $t5, 0($t1)
    j recursive_sort_outer_loop

recursive_sort_done: 
    lw      $s1, 0($sp)  
    lw      $s2, 4($sp)
    lw      $s3, 8($sp)
    lw      $ra, 12($sp)
    addi	$sp, $sp, 16
    jr      $ra

exit:
    li      $v0, 10
    syscall
