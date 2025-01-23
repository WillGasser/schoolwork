.data
A: .word 7, 42, 0, 27, 16, 8, 4, 15, 31, 45
.text
    	la $s0, A                   # $s0 = address of A[]
    	li $s1, 10                  # $s1 = size of A[]
    	jal sort                    # Call sort function
    	li $t0, 0                   # Reset counter i to 0
    	j print                     # Jump to print_array
exit:
    	li $v0, 10                  # Exit program
    	syscall
swap:
    	sll $t3, $s1, 2             # Calculate index of second element
    	add $t3, $s2, $t3           # Address of second element
    	lw $t4, 0($t3)              # Load second element
    	lw $t5, 4($t3)              # Load first element
   	sw $t5, 0($t3)              # Store first element at second index
    	sw $t4, 4($t3)              # Store second element at first index
    	jr $ra                      # Return
sort:
    	addi $sp, $sp, -20          # Allocate stack space
    	sw $ra, 16($sp)             # Save return address
    	sw $s3, 12($sp)             # Save $s3
    	sw $s2, 8($sp)              # Save $s2
    	sw $s1, 4($sp)              # Save $s1
    	sw $s0, 0($sp)              # Save $s0

   	move $s2, $s0               # $s2 = v (address of array)
    	move $s3, $s1               # $s3 = n (size of array)
    	move $s0, $zero             # Initialize $s0 = 0
loop1:
    	slt $t0, $s0, $s3           # Check if i < n
    	beq $t0, $zero, loop1x       # If not, exit loop
    	addi $s1, $s0, -1           # $s1 = i - 1
loop2:
    	slti $t0, $s1, 0            # Check if j < 0
    	bne $t0, $zero, loop2x       # If so, exit loop
    	sll $t1, $s1, 2             # Calculate index of jth element
    	add $t2, $s2, $t1           # Address of jth element
    	lw $t3, 0($t2)              # Load jth element
    	lw $t4, 4($t2)              # Load (j+1)th element
    	slt $t0, $t4, $t3           # Compare jth and (j+1)th elements
    	beq $t0, $zero, loop2x       # If jth <= (j+1)th, exit loop
    	move $a0, $s2               # $a0 = address of array
    	move $a1, $s1               # $a1 = j
    	jal swap                    # Call swap function
    	addi $s1, $s1, -1           # Decrement j
    	j loop2                     
loop1x:
    	lw $ra, 16($sp)             # Restore return address
    	lw $s2, 8($sp)              # Restore $s2
    	lw $s1, 4($sp)              # Restore $s1
    	lw $s0, 0($sp)              # Restore $s0
    	addi $sp, $sp, 20           # Deallocate stack space
    	jr $ra                      # Return
loop2x:
    	addi $s0, $s0, 1            # Increment i
    	j loop1                     # Loop back
    	
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