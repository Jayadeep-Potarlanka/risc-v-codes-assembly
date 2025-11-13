# Vector Compression program
# Accepts a vector of integers from the user
# Prints two vectors - one with non-zero elements, the other with their indices

.data
vector: .word 0:32      # Vector of integers
non_zero: .word 0:32   # Vector of non-zero integers
indices: .word 0:32    # Vector of indices

.text
.globl main
main:
    # Prompt user to enter size of vector
    la a0, msg_size
    li a7, 4
    ecall

    # Read size of vector
    li t0, 0     # Counter to keep track of size
    la t1, vector
    li t2, 10    # ASCII code for newline character

read_size:
    li a7, 12    # Syscall to read character
    ecall
    beq a0, t2, done_size   # Check for newline to exit loop
    addi t0, t0, 1         # Increment counter
    sw a0, 0(t1)           # Store integer in vector
    addi t1, t1, 4         # Move to next memory location
    j read_size

done_size:
    # Compute non-zero vector and indices
    li t3, 0     # Counter for non-zero elements
    la t4, non_zero
    la t5, indices
    la t6, vector
    addi t7, x0, 0     # Counter for index

loop:
    beq x0, t0, print_vectors   # Exit loop if all elements processed
    lw t8, 0(t6)               # Load element from vector
    beq t8, x0, skip           # Skip if element is zero
    sw t8, 0(t4)               # Store non-zero element in non_zero vector
    sw t7, 0(t5)               # Store index in index vector
    addi t3, t3, 1             # Increment counter for non-zero elements
    addi t4, t4, 4             # Move to next memory location
    addi t5, t5, 4             # Move to next memory location
    addi t7, t7, 1             # Increment counter for index

skip:
    addi t6, t6, 4             # Move to next memory location
    addi t0, t0, 1             # Increment counter for vector
    j loop

print_vectors:
    # Print non-zero vector
    la a0, msg_nonzero
    li a7, 4
    ecall

    la t4, non_zero
    li t3, 0

print_nonzero:
    beq x0, t3, print_indices   # Exit loop if all non-zero elements printed
    lw a0, 0(t4)               # Load element from non-zero vector
    li a7, 1                   # Syscall to print integer
    ecall
    la a0, msg_space           # Print space
    li a7, 4
    ecall
    addi t3, t3, 1             # Increment counter
    addi t4, t4, 4             # Move to next memory location
    j print_nonzero

print_indices:
    # Print index vector
    la a0, msg_indices
    li a7, 4
    ecall