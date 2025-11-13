# declare an array of size 5
.section .data
array: .word 5, 10, 15, 20, 25
prompt1: .asciiz "Enter the first index to swap: "
prompt2: .asciiz "Enter the second index to swap: "
prompt3: .asciiz "Result: "

.section .text
.globl main
main:

    # print prompts and read inputs n and k
    la t0, prompt1
    li a0, 4
    mv a1, t0
    ecall
    
    li a0, 5
    li a2, 0
    li a3, 0
    ecall
    
    la t0, prompt2
    li a0, 4
    mv a1, t0
    ecall
    
    li a0, 5
    li a2, 0
    li a3, 0
    ecall
    
    # perform the swap
    lw t0, 0(a0)
    lw t1, 0(a1)
    sw t0, 0(a1)
    sw t1, 0(a0)
    
    # print the result
    la t0, prompt3
    li a0, 4
    mv a1, t0
    ecall
    
    la t0, array
    li a0, 1
    li a1, 20
    li a7, 0
    mv a2, t0
    ecall
    
    # exit
    li a0, 10
    ecall