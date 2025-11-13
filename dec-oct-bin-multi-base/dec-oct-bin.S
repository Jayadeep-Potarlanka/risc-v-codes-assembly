.section .data
prompt:
    .asciiz "What would you like to convert?\n"
input_format:
    .asciiz "%s %s"
output_format_dec:
    .asciiz "Decimal: %d\n"
output_format_oct:
    .asciiz "Octal: %o\n"
output_format_bin:
    .asciiz "Binary: %s\n"
goodbye_msg:
    .asciiz "Goodbye.\n"
binary_prefix:
    .asciiz "bin"
decimal_prefix:
    .asciiz "dec"
octal_prefix:
    .asciiz "oct"
error_msg:
    .asciiz "Invalid input.\n"

.section .bss
input_buffer:
    .space 34  # To accommodate "dec " and a 32-bit number
base_buffer:
    .space 4   # For "bin", "dec", or "oct"
number_buffer:
    .space 33  # For a 32-bit binary number and null terminator

.section .text
.globl main

main:
    # Main loop to prompt for and process user input
convert_loop:
    # Print prompt
    li a0, prompt
    jal ra, printf

    # Read user input
    li a0, 0
    la a1, input_buffer
    li a2, 34
    jal ra, fgets

    # Check for EOF or error from fgets
    beqz a0, exit

    # Check if the user wants to exit
    lbu t0, input_buffer
    li t1, 'e'
    beq t0, t1, exit

    # Parse the input string
    la a0, input_buffer
    la a1, input_format
    la a2, base_buffer
    la a3, number_buffer
    jal ra, sscanf

    # Check the number of items parsed by sscanf
    li t0, 2
    blt a0, t0, invalid_input

    # Load the base and number into registers
    la t0, base_buffer
    la t1, number_buffer

    # Convert the input number string to an integer
    li t2, 0 # This will hold the integer value of the number

    # Check the input base
    la t3, binary_prefix
    jal ra, strcmp
    beqz a0, convert_from_binary

    la t3, decimal_prefix
    jal ra, strcmp
    beqz a0, convert_from_decimal

    la t3, octal_prefix
    jal ra, strcmp
    beqz a0, convert_from_octal

    j invalid_input # If base is not "bin", "dec", or "oct"

convert_from_binary:
    li t4, 2 # Base 2
    jal ra, string_to_int
    j print_results

convert_from_decimal:
    li t4, 10 # Base 10
    jal ra, string_to_int
    j print_results

convert_from_octal:
    li t4, 8 # Base 8
    jal ra, string_to_int
    j print_results

# Converts a string to an integer
# a0: pointer to the string
# a1: base
# Returns: a0: the integer
string_to_int:
    mv t0, a0 # t0 = current char pointer
    li t1, 0  # t1 = result
string_to_int_loop:
    lbu t2, (t0) # t2 = current char
    beqz t2, string_to_int_done # If null terminator, done

    # Convert char to digit
    li t3, '0'
    blt t2, t3, invalid_input
    li t3, '9'
    bgt t2, t3, check_alpha
    sub t2, t2, '0' # Convert from ASCII
    j check_digit

check_alpha:
    li t3, 'a'
    blt t2, t3, invalid_input
    li t3, 'f'
    bgt t2, t3, invalid_input
    sub t2, t2, 'a'
    addi t2, t2, 10
    j check_digit

check_digit:
    blt a1, t2, invalid_input # Check if digit is valid for the base
    mul t1, t1, a1
    add t1, t1, t2
    addi t0, t0, 1
    j string_to_int_loop
string_to_int_done:
    mv a0, t1
    ret

print_results:
    mv t2, a0 # Keep the converted integer in t2
    # Print in decimal
    li a0, output_format_dec
    mv a1, t2
    jal ra, printf

    # Print in octal
    li a0, output_format_oct
    mv a1, t2
    jal ra, printf

    # Print in binary
    jal ra, print_binary

    j convert_loop

# Prints an integer in binary
# a0: integer to print
print_binary:
    mv t0, a0 # t0 = number
    li t1, 31 # t1 = bit position
    la t2, number_buffer # t2 = buffer pointer
print_binary_loop:
    srl t3, t0, t1 # t3 = current bit
    andi t3, t3, 1
    addi t3, t3, '0' # Convert to ASCII
    sb t3, (t2)
    addi t2, t2, 1
    addi t1, t1, -1
    bgez t1, print_binary_loop

    sb zero, (t2) # Null terminate the string

    li a0, output_format_bin
    la a1, number_buffer
    jal ra, printf
    ret

invalid_input:
    li a0, error_msg
    jal ra, printf
    j convert_loop

exit:
    li a0, goodbye_msg
    jal ra, printf
    li a7, 93 # exit syscall
    ecall
