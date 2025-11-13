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
    blt t3, 48, done_read
    bge t3, 58, done_read
    mul t1, t1, t2
    subi t3, t3, 48
    add t1, t1, t3
    addi t0, t0, 1
    j loop_read
done_read:
    mv a0, t1
    jr ra

# print integer
print_int:
    mv t6, a0
    li t7, 10
    li t8, 0
    blt t6, x0, neg
    bge t6, t7, not_single_digit
    addi t8, t8, 1
    j done_int
not_single_digit:
    divu t9, t6, t7
    addi t8, t8, 1
    mv t6, t9
    j not_single_digit
neg:
    li t3, '-'
    sb t3, 0(x31)
    neg t6, t6
    j not_single_digit
done_int:
    addi t8, t8, 1
    li t3, 0x0a
    sb t3, t8(x31)
loop_int:
    addi t8, t8, -1
    blez t8, end_int
    remu t4, t6, t7
    addi t4, t4, 0x30
    sb t4, t8(x31)
    divu t6, t6, t7
    j loop_int
end_int:
    li a0, 1
    mv a1, x31
    mv a2, t8
    ecall
    jr x0

# main function
main:
    # read string input
    la a0, buffer
    jal read_string
    # print integer
    jal print_int
    jr x0