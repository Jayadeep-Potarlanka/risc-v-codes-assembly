# RISC-V program for conversion between decimal and hexadecimal

.section .text
.globl main

# print string
print_string:
    li t0, 4
    mv t1, a0
    li t2, 0
loop:
    lbu t3, 0(t1)
    beqz t3, done
    sb t3, 0(x31)
    addi t1, t1, 1
    addi t2, t2, 1
    bnez t3, loop
done:
    li t3, 1
    sb t3, 0(x31)
    li a0, 1
    mv a1, x31
    li a2, 32
    ecall
    jr x0

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

# convert decimal to hexadecimal
dec_to_hex:
    li t5, 0
    li t6, 0
loop_dec_to_hex:
    remu t4, a0, 16
    addi t5, t5, 1
    add t6, t6, t4
    blt t4, 10, digit
    addi t4, t4, 87
digit:
    sb t4, t5(x31)
    divu a0, a0, 16
    bnez a0, loop_dec_to_hex
done_dec_to_hex:
    li t4, 'x'
    sb t4, 0(x31)
    li t4, '0'
    sb t4, 1(x31)
    addi t5, t5, 2
    j reverse
    jr x0

# convert hexadecimal to decimal
hex_to_dec:
    li t5, 0
    li