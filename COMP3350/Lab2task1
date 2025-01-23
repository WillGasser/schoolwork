.data
A: .word 21, 50, 63, 72, 0, 95, 11, 28, 4, 5, 16, 7
.text
 	li $t0, 1                   # Initialize counter i with 1
 	la $s0, A                   # Initialize $s0 with the address of array A
 	li $s1, 12           	    # Initialize the array size with 12
loop1:
 	bge $t0, $s1, reset         # Exit if i >= array size
 	sll $t1, $t0, 2             # Calculate offset for A[i]
 	add $t2, $s0, $t1           # Calculate address of A[i]
    	lw $t3, ($t2)               # Load value of A[i] into $t3
    	addi $t4, $t0, -1           # Set j to i - 1

loop2:
    	bltz $t4, loop1x            # Exit if j < 0
    	sll $t5, $t4, 2             # Calculate offset for A[j]
    	add $t6, $s0, $t5           # Calculate address of A[j]
    	lw $t9, ($t6)               # Load value of A[j] into $t9
    	blt $t9, $t3, loop1x        # Exit if A[j] < A[i]
    	addi $t5, $t5, 4            # Calculate offset for A[j + 1]
    	add $t6, $s0, $t5           # Calculate address of A[j + 1]
    	sw $t9, ($t6)               # Store A[j] into A[j + 1]
    	addi $t4, $t4, -1           # Decrement j
    	j loop2                     # Repeat the inner loop

loop1x:
    	addi $t5, $t4, 1            # Increment j
    	sll $t5, $t5, 2             # Calculate offset for A[j + 1]
    	add $t6, $s0, $t5           # Calculate address of A[j + 1]
    	sw $t3, ($t6)               # Store A[i] into A[j + 1]
    	addi $t0, $t0, 1            # Increment i
    	j loop1                     # Repeat the outer loop

reset:
    	li $t0, 0                   # Reset counter i to 0
    	j print                     # Jump to print_array

print:
    	bge $t0, $s1, exit          # Exit if i >= array size
   	lw $a0, 0($s0)              # Load value of A[i] into $a0 for printing
    	li $v0, 1                   # System call to print integer
    	syscall
    	li $v0, 11                  # System call to print character
    	li $a0, ' '                 # Load ASCII value for space
    	syscall
    	addi $s0, $s0, 4            # Move to next element in the array
    	addi $t0, $t0, 1            # Increment i
    	j print                     # Repeat the printing loop

exit:
    	li $v0, 10                  # System call to exit
    	syscall
