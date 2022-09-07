.globl main

.data

# Program text constants
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

# main program
# base address of the array:    $s0
# size of the array (n):        $s6

main:
	li      $s6,                  10                              # set n = 10, the static array size
	sll     $t0,                  $s6,            2               # $t0 = 4 * $s6
	sub     $sp,                  $sp,            $t0             # assign space for n size static array on stack
	move    $s0,                  $sp                             # set $s0 to base address of the array
	jal     get_array                                             # jump to procedure get_array
	move    $a0,                  $s0
	li      $a1,                  0
	addi    $a2,                  $s6,            -1
	jal     recursive_sort
	jal     print_array
	j       exit

get_array:
	li      $t0,                  0                               # $t0 = 0 (i = 0)
	move    $t1,                  $s0                             # $t1 = $s0 ($t0 = base address of the array)
	j       get_array_loop                                        # jump to get_array_loop

get_array_loop:
    # printf("Enter element #");
	li      $v0,                  4                               # system call #4 - print string
	la      $a0,                  prompt_prefix                   
	syscall                                                       # execute

    # printf("%d", i + 1);
	li      $v0,                  1                               # system call #1 - print int
	addi    $a0,                  $t0,            1
	syscall                                                       # execute

    # printf("%s", ": ");
	li      $v0,                  4                               # system call #4 - print string
	la      $a0,                  prompt_suffix                               
	syscall                                                       # execute

    # scanf("%d", arr[i]);
	li      $v0,                  5                               # syscall call #5 - get int
	syscall                                                       # execute
	sw      $v0,                  0($t1)                          

	addi    $t0,                  $t0,            1               # $t0 = $t0 + 1 (i = i + 1)
	addi    $t1,                  $t1,            4               # $t1 = $t1 + 4 ($t1 = pointer to the next element of the array)

	beq     $t0,                  $s6,            get_array_done  # if $t0 == $t6 (i == n), jump to get_array_done
	j       get_array_loop                                        # jump to get_array_loop (continue the loop)

get_array_done:
	jr      $ra                                                   # jump to $ra  (return to main)

print_array:
	li      $t0,                  0                               # $t0 = 0 (i = 0)
	move    $t1,                  $s0                             # $t1 - $s0 ($t1 = base address of the array)

    # printf("Sorted array: ");
	li      $v0,                  4                               # system call #4 - print string              
	la      $a0,                  result                          
	syscall                                                       # execute
	j       print_array_loop                                      # jump to print_array_loop

print_array_loop:
    # printf("%d", arr[i]);
	li      $v0,                  1                               # system call #1 - print int
	lw      $a0,                  0($t1)
	syscall                                                       # execute

    # printf(" ");
	li      $v0,                  4                               # system call #4 - print string
	la      $a0,                  space                           
	syscall                                                       # execute

	addi    $t0,                  $t0,            1               # $t0 = $t0 + 1 (i = i + 1)
	addi    $t1,                  $t1,            4               # $t1 = $t1 + 4 ($t1 = pointer to the next element of the array) 

	beq     $t0,                  $s6,            parray_done     # if $t0 == $s6 (i == n), jump to parray_done
	j       print_array_loop                                      # jump to print_array_loop (continue the loop)

parray_done:
	jr      $ra                                                   # jump to $ra  (return to main)

recursive_sort:
    # $a0 = base address of the array
    # $a1 = left
    # $a2 = right
	addi    $sp,                  $sp,            -16             # assign space on stack for saving return address and $s registers 
	sw      $ra,                  12($sp)
	sw      $s3,                  8($sp)
	sw      $s2,                  4($sp)
	sw      $s1,                  0($sp)
	move    $s1,                  $a1                             # $s1 = $a1 (l =  left)
	move    $s2,                  $a2                             # $s2 = $a2 (r = right)
	move    $s3,                  $a1                             # $s3 = $a1 (p = left)
	j       rsort_outer_loop                                      # jump to rsort_outer_loop

rsort_outer_loop:
	bge     $s1,                  $s2,            rsort_done      # if $s1 >= $s2 (l >= r), jump to rsort_done
	j       rsort_inner_1                                     # jump to rsort_inner_1

rsort_inner_1:
	sll     $t0,                  $s1,            2               # $t0 = 4 * $s1 ($t0 = 4 * l)
	add     $t1,                  $a0,            $t0             # $t1 = $a0 + $t0 ($t1 = &arr[l])
	sll     $t2,                  $s3,            2               # $t2 = 4 * $s3 ($t1 = 4 * p)
	add     $t3,                  $a0,            $t2             # $t2 = $a0 + $t2 ($t1 = &arr[p])
	lw      $t4,                  0($t1)                          # $t4 = M[$t1], $t4 = arr[l]
	lw      $t5,                  0($t3)                          # $t5 = M[$t3], $t5 = arr[p]
	bgt     $t4,                  $t5,            rsort_inner_2   # if $t4 > $t5 (arr[l] > arr[p]), jump to rsort_inner_2
	bge     $s1,                  $a2,            rsort_inner_2   # if $s1 >= $a2 (l >= right), jump to rsort_inner_2
	addi    $s1,                  $s1,            1               # $s1 = $s1 + 1 (l = l + 1)
	j       rsort_inner_1                                         # jump to rsort_inner_1 (continue the loop)

rsort_inner_2:
	sll     $t0,                  $s2,            2               # $t0 = 4 * $s2 ($t0 = 4 * r)  
	add     $t1,                  $a0,            $t0             # $t1 = $a0 + $t0 ($t1 = &arr[r])
	sll     $t2,                  $s3,            2               # $t2 = 4 * $s3 ($t1 = 4 * p)
	add     $t3,                  $a0,            $t2             # $t2 = $a0 + $t2 ($t1 = &arr[p])
	lw      $t4,                  0($t1)                          # $t4 = M[$t1], $t4 = arr[r]
	lw      $t5,                  0($t3)                          # $t5 = M[$t3], $t5 = arr[p]
	blt     $t4,                  $t5,            rsort_if        # if $t4 < $t5 (arr[r] < arr[p]), jump to rsort_inner_2
	ble     $s2,                  $a1,            rsort_if        # if $s1 <= $a2 (r <= left), jump to rsort_if
	addi    $s2,                  $s2,            -1              # $s2 = $s2 - 1 (r = r - 1)
	j       rsort_inner_2                                         # jump to rsort_inner_2 (continue the loop)

rsort_if:
	blt     $s1,                  $s2,            rwrap_one_loop  # if $s1 < $s2 (l < r), jump to rwrap_one_loop

    # swap(arr[r], arr[p]);
	sll     $t0,                  $s2,            2                
	add     $t1,                  $a0,            $t0
	sll     $t2,                  $s3,            2
	add     $t3,                  $a0,            $t2
	lw      $t4,                  0($t1)
	lw      $t5,                  0($t3)
	sw      $t4,                  0($t3)
	sw      $t5,                  0($t1)
                                        
    
	addi    $sp,                  $sp,            -12
	sw      $a2,                  8($sp)
	sw      $a1,                  4($sp)
	sw      $a0,                  0($sp)

	move    $a0,                  $s0
	addi    $a2,                  $s2,            -1
	jal     recursive_sort

	lw      $a0,                  0($sp)
	lw      $a1,                  4($sp)
	lw      $a2,                  8($sp)
	addi    $sp,                  $sp,            12


	addi    $sp,                  $sp,            -12
	sw      $a2,                  8($sp)
	sw      $a1,                  4($sp)
	sw      $a0,                  0($sp)

	move    $a0,                  $s0
	addi    $a1,                  $s2,            1
	jal     recursive_sort

	lw      $a0,                  0($sp)
	lw      $a1,                  4($sp)
	lw      $a2,                  8($sp)
	addi    $sp,                  $sp,            12
	j       rsort_done

rwrap_one_loop:
    # SWAP(A[l], A[r]);
	sll     $t0,                  $s1,            2
	add     $t1,                  $s0,            $t0
	sll     $t2,                  $s2,            2
	add     $t3,                  $s0,            $t2
	lw      $t4,                  0($t1)
	lw      $t5,                  0($t3)
	sw      $t4,                  0($t3)
	sw      $t5,                  0($t1)
	j       rsort_outer_loop

rsort_done:
	lw      $s1,                  0($sp)
	lw      $s2,                  4($sp)
	lw      $s3,                  8($sp)
	lw      $ra,                  12($sp)
	addi    $sp,                  $sp,            16
	jr      $ra

exit:
	li      $v0,                  10
	syscall 
