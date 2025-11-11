# RISC-V Decimal-Hexadecimal Interactive Converter

This repository contains a complete, interactive RISC-V assembly program that converts 32-bit positive integers between their decimal and hexadecimal representations.

## Description

This program provides a command-line interface that repeatedly prompts the user for a conversion task. The user specifies the input format, the desired output format, and the value to convert. The program then calculates and prints the result, and prompts for another conversion.

## Features

*   **Interactive Interface:** The program engages the user with a clear, continuous prompt.
*   **Bidirectional Conversion:** Supports both decimal-to-hexadecimal and hexadecimal-to-decimal conversions.
*   **Simple Input Format:** Accepts input in a straightforward format: `<source_format> <destination_format> <value>`.
*   **Graceful Exit:** The program terminates when the user enters 'e'.

## Input Format

The program expects input as a string with three parts, separated by spaces:

1.  **Source Format:** A single character, 'd' (decimal) or 'h' (hexadecimal).
2.  **Destination Format:** A single character, 'd' (decimal) or 'h' (hexadecimal).
3.  **Value:** The integer to be converted. Hexadecimal inputs should be prefixed with `0x`.

### Example Session

Here is an example of how to interact with the program:
```
What would you like to convert?

h d 0x23

35

What would you like to convert?

d h 42

0x2a

What would you like to convert?

e

Goodbye.
```
## How to Use

To run this program, you will need a RISC-V development toolchain, including a compiler (like GCC for RISC-V) and a simulator (like Spike).

1.  **Assemble the Code:**
    Use the RISC-V compiler to assemble the `.S` source file into an executable.
    ```
    riscv64-unknown-elf-gcc -o converter 1.S
    ```

2.  **Run the Executable:**
    Execute the program using a RISC-V simulator.
    ```
    spike pk converter
    ```
