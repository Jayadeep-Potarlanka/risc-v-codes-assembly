.section .data
buffer: .space 32

.section .text
.globl main

# read string input
read_string:
    li a0, 0
    la a1, buffer
    li a2, 32
    li t0, 0
    li t1, 0
    li t2, 10
loop_read:
    beq t0, a2, done_read
    li a0, 8
    li a7, 4
    ecall
    lbu t3, 0(x31)
    beqz t3, done_read
    beq t3, t2, done_read
    sb t3, 0(t1)
    addi t1, t1, 1
    addi t0, t0, 1
    j loop_read
done_read:
    sb x0, 0(t1)

# check if string is palindrome
is_palindrome:
    la t4, buffer
    add t5, x0, t1
    addi t5, t5, -2
loop_palindrome:
    bge t4, t5, palindrome
    lbu t6, 0(t4)
    lbu t7, 0(t5)
    bne t6, t7, not_palindrome
    addi t4, t4, 1
    addi t5, t5, -1
    j loop_palindrome
palindrome:
    li a0, 1
    j end_palindrome
not_palindrome:
    li a0, 0
end_palindrome:
    jr ra

# print result
print_result:
    li t3, '0'
    add t4, x0, a0
    beqz a0, not_palindrome_string
    li t3, '1'
not_palindrome_string:
    sb t3, 0(x31)
    li t3, 0x0a
    sb t3, 1(x31)
    li a0, 4
    la a1, x31
    li a2, 2
    ecall
    jr x0

# main function
main:
    # read string input
    la a0, buffer
    jal read_string
    # check if string is palindrome
    jal is_palindrome
    # print result
    jal print_result
    jr x0