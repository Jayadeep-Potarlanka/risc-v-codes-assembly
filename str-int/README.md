# Assembly Code to Read a number as a string and Print Integer

This is a simple assembly program that reads a string of digits from the standard input, converts it to an integer, and then prints the integer to the standard output.

## Description

The program is written in RISC-V assembly language. It consists of three main parts:

*   **`read_string`**: A function that reads a string of characters from the input and converts it into an integer. It stops reading when it encounters a non-digit character, a newline, or the end of the input.
*   **`print_int`**: A function that takes an integer and prints its decimal representation to the standard output. It can handle both positive and negative numbers.
*   **`main`**: The main function that orchestrates the program flow. It calls `read_string` to get the input and then calls `print_int` to display the result.

## How to run

To run this program, you will need a RISC-V assembler and simulator. You can use the following steps:

1.  **Assemble the code:**
    ```
    riscv64-unknown-elf-as -o str-int.o str-int.S
    ```

2.  **Link the object file:**
    ```
    riscv64-unknown-elf-ld -o str-int str-int.o
    ```

3.  **Run in a simulator (like Spike):**
    ```
    spike pk str-int
    ```

When you run the program, it will wait for you to type a number and press Enter. Then, it will print the number you entered.

