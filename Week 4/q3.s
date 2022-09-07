# This program takes in an array of 10 elemnts and a key. It sorts the array and prints them. Then it searches for the key in the
# sorted array. If found, it prints the index of key in the sorted array.

.globl main

.data

# Program text constants
prompt_array_prefix:
.asciiz "Enter element #"
prompt_array_suffix:
.asciiz ": "
prompt_key:
.asciiz "Enter key: "
result_array:
.asciiz "Sorted array: "
result_key_success:
.asciiz " is FOUND in the array at index: "
result_key_failure:
.asciiz " is NOT FOUND in the array."
space:
.asciiz " "
newline:
.asciiz "\n"

.text

# main program
# base address of the array:    $s0
# size of the array (n):        $s6
# key to be searched for:		$s5

main:
	li      $s6,                  10                              # set n = 10, the static array size
	sll     $t0,                  $s6,            2               # $t0 = 4 * $s6
	sub     $sp,                  $sp,            $t0             # assign space for n size static array on stack
	move    $s0,                  $sp                             # set $s0 to base address of the array

	jal     get_array                                             # jump to procedure get_array
	jal 	get_key											      # jump to precedure get_key

	move    $a0,                  $s0                             # $a0 = $s0 ($a0 = base address of the array)
	li      $a1,                  0                               # $a1 = 0
	addi    $a2,                  $s6,            -1              # $a2 = $s6 - 1 ($a2 = n - 1)
	jal     recursive_sort                                        # jump to procedure recursive_sort

	jal     print_array                                           # jump to procedure print_array

	# printf("\n");
	li      $v0,                  4				                  # system call #4 - print string
	la      $a0,                  newline
	syscall                                                       # execute

	move    $a0,                  $s0                             # $a0 = $s0 ($a0 = base address of the array)
	li      $a1,                  0                               # $a1 = 0
	addi    $a2,                  $s6,            -1              # $a2 = $s6 - 1 ($a2 = n - 1)
	move    $a3,                  $s5                             # $a3 = $s5 ($a3 = key)
	jal     recursive_search                                      # jump to recursive_search

	move    $s1,                  $v0                             # $s1 = $v0 ($s1 = recursive_search(arr, 0, n - 1, key))

	# printf("%d", key);
	li      $v0,                  1                               # system call #1 - print int
	move    $a0,                  $s5                             
	syscall                                                       # execute

	beq     $s1,                  -1,             not_found       # if $s1 == -1, jump to not_found
	bne     $s1,                  -1,             found           # if $s1 != -1, jump to found

	j       exit                                                  # jump to exit

not_found:
	# printf(" is NOT FOUND in the array.");
	li      $v0,                  4                               # system call #4 - print string
	la      $a0,                  result_key_failure              
	syscall                                                       # execute

	j       exit                                                  # jump to exit

found:
	# printf(" is FOUND in the array at index: ");
	li      $v0,                  4                               # system call #4 - print string
	la      $a0,                  result_key_success
	syscall                                                       # execute

	# printf("%d", index);
	li      $v0,                  1                               # system call #1 - print int
	move    $a0,                  $s1
	syscall 													  # execute

	j       exit                                                  # jump to exit

get_array:
	li      $t0,                  0                               # $t0 = 0 (i = 0)
	move    $t1,                  $s0                             # $t1 = $s0 ($t0 = base address of the array)
	j       get_array_loop                                        # jump to get_array_loop

get_array_loop:
    # printf("Enter element #");
	li      $v0,                  4                               # system call #4 - print string
	la      $a0,                  prompt_array_prefix                   
	syscall                                                       # execute

    # printf("%d", i + 1);
	li      $v0,                  1                               # system call #1 - print int
	addi    $a0,                  $t0,            1
	syscall                                                       # execute

    # printf("%s", ": ");
	li      $v0,                  4                               # system call #4 - print string
	la      $a0,                  prompt_array_suffix                               
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

get_key:
	li      $v0,                  4
	la      $a0,                  prompt_key
	syscall 

	li      $v0,                  5
	syscall 
	move    $s5,                  $v0
	jr      $ra

print_array:
	li      $t0,                  0                               # $t0 = 0 (i = 0)
	move    $t1,                  $s0                             # $t1 - $s0 ($t1 = base address of the array)

    # printf("Sorted array: ");
	li      $v0,                  4                               # system call #4 - print string              
	la      $a0,                  result_array                          
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
	addi    $sp,                  $sp,            -16             # allocate space on stack for saving return address and $s registers 
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
	j       rsort_inner_1                                         # jump to rsort_inner_1

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
	sll     $t0,                  $s2,            2               # $t0 = 4 * $s2 ($t0 = 4 * r)       
	add     $t1,                  $a0,            $t0             # $t1 = $a0 + $t0 ($t1 = &arr[r])
	sll     $t2,                  $s3,            2               # $t2 = 4 * $s3 ($t2 = 4 * p) 
	add     $t3,                  $a0,            $t2             # $t3 = $a0 + $t2 ($t3 = &arr[p])
	lw      $t4,                  0($t1)                          # $t4 = M[$t1] ($t4 = arr[r])
	lw      $t5,                  0($t3)                          # $t5 = M[$t3] ($t5 = arr[p])
	sw      $t4,                  0($t3)                          # M[$t3] = $t4
	sw      $t5,                  0($t1)                          # M[$t1] = $t5
                                        
    
	addi    $sp,                  $sp,            -12             # allocate space on stack for saving $a registers 
	sw      $a2,                  8($sp)                          
	sw      $a1,                  4($sp)
	sw      $a0,                  0($sp)

	move    $a0,                  $s0                             # $a0 = $s0 ($a0 = base address of the array)
	addi    $a2,                  $s2,            -1              # $a2 = $s2 - 1 ($a2 = r - 1)
	jal     recursive_sort                                        # jump to procedure recursive_sort

	lw      $a0,                  0($sp)                          
	lw      $a1,                  4($sp)
	lw      $a2,                  8($sp)
	addi    $sp,                  $sp,            12              # deallocate space after reloading the $a registers


	addi    $sp,                  $sp,            -12             # allocate space on stack for saving $a registers  
	sw      $a2,                  8($sp)
	sw      $a1,                  4($sp)
	sw      $a0,                  0($sp)

	move    $a0,                  $s0                             # $a0 = $s0 ($a0 = base address of the array)
	addi    $a1,                  $s2,            1               # $a1 = r + 1
	jal     recursive_sort                                        # jump to procedure recursive_sort

	lw      $a0,                  0($sp)
	lw      $a1,                  4($sp)
	lw      $a2,                  8($sp)
	addi    $sp,                  $sp,            12              # deallocate space on stacks after reloading the $a registers  
	j       rsort_done                                            # jump to rsort_done

rwrap_one_loop:
    # swap(A[l], A[r]); 
	sll     $t0,                  $s1,            2               # $t0 = 4 * $s1 ($t0 = 4 * l)
	add     $t1,                  $a0,            $t0             # $t1 = $a0 + $t0 ($t1 = &arr[l])
	sll     $t2,                  $s2,            2               # $t2 = 4 * $s2 ($t2 = 4 * r)   
	add     $t3,                  $a0,            $t2             # $t3 = $a0 + $t2 ($t3 = &arr[r])
	lw      $t4,                  0($t1)                          # $t4 = M[$t1] ($t4 = arr[l])
	lw      $t5,                  0($t3)                          # $t5 = M[$t3] ($t5 = arr[r])
	sw      $t4,                  0($t3)                          # M[$t3] = $t4
	sw      $t5,                  0($t1)                          # M[$t1] = $t5
	j       rsort_outer_loop                                      # jump to rsort_outer_loop (continue the loop)

rsort_done:
	lw      $s1,                  0($sp)
	lw      $s2,                  4($sp)
	lw      $s3,                  8($sp)
	lw      $ra,                  12($sp)
	addi    $sp,                  $sp,            16              # deallocate space on stack after reloading the reutrn address and $s registers 
	jr      $ra                                                   # jump to $ra (return to main)

recursive_search:
    # $a0 = base address of the array
    # $a1 = start
    # $a2 = end
    # $a3 = key
	addi    $sp,                  $sp,            -4              # allocate space on stack for saving return address
	sw      $ra,                  0($sp)
	bgt     $a1,                  $a2,            rsearch_end_f   # if $a1 > $a2 (start > end), jump to rsearch_end_f
	move    $t0,                  $a2                             # $t0 = $a2 ($t0 = end)
	sub     $t0,                  $t0,            $a1             # $t0 = $t0 - $a1 ($t0 = end - start)
	li      $t1,                  3                               # $t1 = 3
	div     $t0,                  $t1                             # $t0 / $t1
	mflo    $t2                                                   # $t2 = floor($t0 / $t1) ($t2 = floor((end - start)/3)
	add     $t3,                  $a1,            $t2             # #t3 = $a1 + $t2 ($t3 = start + (end - start)/2)
	sub     $t4,                  $a2,            $t2             # $t4 = $a2 - $t2 ($t4 = end - (end - start)/2)

	sll     $t0,                  $t3,            2               # $t0 = 4 * $t3
	add     $s1,                  $a0,            $t0             # $s1 = $a0 + $t0 ($s1 = &arr[mid1])
	sll     $t1,                  $t4,            2	              # $t1 = 4 * $t4
	add     $s2,                  $a0,            $t1             # $s2 = $a0 + $t1 ($s2 = &arr[mid2])
	lw      $s3,                  0($s1)                          # $s3 = M[$s1] ($s3 = arr[mid1])
	lw      $s4,                  0($s2)                          # $s4 = M[$s2] ($s4 = arr[mid2])

	beq     $a3,              	  $s3,            rsearch_end_m1  # if $a3 == $s3 (key == mid1), jump to rsearch_end_m1
	beq     $a3,              	  $s4,            rsearch_end_m2  # if $a3 == $s4 (key == mid2), jump to rsearch_end_m2
	blt     $a3,              	  $s3,            rsearch_end_p1  # if #a3 <  $s3 (key <  mid1), jump to rsearch_end_p1
	bgt     $a3,              	  $s4,            rsearch_end_p3  # if #a3 >  $s4 (key >  mid2), jump to rsearch_end_p3
	j       rsearch_end_p2                                        # jump to rsearch_end_p2

rsearch_end_f:
	li      $v0,                  -1                              # $v0 = -1 (return -1)
	j 		rsearch_end											  # jump to rsearch_end

rsearch_end_m1:
	move    $v0,                  $t3                             # $v0 = $t3 ($v0 = mid1, return mid1)
	j 		rsearch_end									          # jump to rsearch_end

rsearch_end_m2:
	move    $v0,                  $t4                             # $v0 = $t3 ($v0 = mid1, return mid1)
	j 		rsearch_end                                           # jump to rsearch_end
	
rsearch_end_p1:
	move    $a0,                  $s0                             # $a0 = $s0 ($a0 = base address of the array)
	addi    $a2,                  $t3,            -1              # $a2 = $t3 - 1 ($a2 = mid1 - 1)
	jal     recursive_search                                      # jump to procedure recursive_search
	j 		rsearch_end                                           # jump to rsearch_end

rsearch_end_p3:
	move    $a0,                  $s0                             # $a0 = $s0 ($a0 = base address of the array)
	addi    $a1,                  $t4,                    1       # $a1 = $t4 + 1 ($a2 = mid2 + 1)
	jal     recursive_search                                      # jump to procedure recursive_search
	j		rsearch_end                                           # jump to rsearch_end

rsearch_end_p2:
	move    $a0,                  $s0                             # $a0 = $s0 ($a0 = base address of the array) 
	addi    $a1,                  $t3,                    1       # $a2 = $t3 + 1 ($a2 = mid1 + 1)
	addi    $a2,                  $t4,                    -1      # $a2 = $t4 - 1 ($a2 = mid2 - 1)
	jal     recursive_search                                      # jump to procedure recursive_search
	j		rsearch_end                                           # jump to rsearch_end

rsearch_end:
	lw      $ra,                  0($sp)                          # load return address from stack
	addi    $sp,                  $sp,                    4       # deallocate space on stack after loading return address from it
	jr      $ra                                                   # jump to $ra (return to main)

exit:
	li      $v0,                  10                              # system call #10 - exit
	syscall                                                       # exit
