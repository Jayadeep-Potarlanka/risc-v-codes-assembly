# RISC-V Number Base Converter

This is a simple yet effective command-line program written in RISC-V assembly language. It is designed to convert positive 32-bit integers between their binary, decimal, and octal representations. The program runs in a continuous loop, prompting the user for new conversions until explicitly instructed to exit.

## Features

*   **Multiple Number Systems**: Supports conversion from binary and decimal input systems.
*   **Comprehensive Output**: For any given input, the program outputs the number in decimal, octal, and binary formats.
*   **User-Friendly Interface**: A clear and simple command-line interface that continuously prompts for input.
*   **Graceful Exit**: The program can be terminated easily by entering `e`.
*   **Input Validation**: Includes basic checks for invalid input formats.

## How to Run

To run this program, you will need a RISC-V assembler and simulator that supports the necessary system calls for I/O (like `printf`, `fgets`, and `sscanf`). The RARS (RISC-V Assembler and Runtime Simulator) is an excellent tool for this purpose.

1.  **Save the Code**: Save the provided assembly code into a file named `dec-oct-bin.s`.
2.  **Open in RARS**: Launch RARS and open the `dec-oct-bin.s` file.
3.  **Assemble**: Assemble the code by navigating to `Run -> Assemble` in the menu or by pressing `F3`.
4.  **Run**: Execute the program by selecting `Run -> Go` in the menu or by pressing `F5`.
5.  **Interact**: The program will now be running in the RARS console, where you can provide input.

## Usage

The program will prompt you with the following message:
```
What would you like to convert?
```

You should provide input in the format `<base> <number>`, where:
*   `<base>` is the identifier for the input number system (`bin` for binary or `dec` for decimal).
*   `<number>` is the integer value you want to convert.

To exit the program, simply type `e` and press Enter.

### Example Session

Here is an example of how to use the program:

```
What would you like to convert?
bin 101010
Decimal: 42
Octal: 52
Binary: 00000000000000000000000000101010
What would you like to convert?
dec 19
Decimal: 19
Octal: 23
Binary: 00000000000000000000000000010011
What would you like to convert?
e
Goodbye.
```
```

