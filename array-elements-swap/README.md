
# Assembly Language Array Element Swapper

This program swaps two elements in a predefined array based on user-provided indices.

## Description

This assembly language program for the RISC-V architecture initializes an array of five integers. It prompts the user to enter two indices and then swaps the elements at those positions in the array. Finally, it prints the modified array to the console.


## Requirements

To run this program, you will need a RISC-V simulator that supports the standard system calls, such as RARS (RISC-V Assembler and Runtime Simulator).

## How to Use

1.  **Assemble the code:** Load the `array-elements-swap.S` file into a compatible RISC-V simulator.
2.  **Run the program:** Execute the assembled code.
3.  **Provide input:** The program will prompt you to enter two indices.
    *   "Enter the first index to swap: "
    *   "Enter the second index to swap: "
4.  **View the output:** After you provide the indices, the program will display the "Result: " followed by the array with the swapped elements.


### Example

If you input `0` and `4` as the indices, the program will swap the first and the last elements of the array.

**Initial Array:** `[5, 10, 15, 20, 25]`

**User Input:**

```
Enter the first index to swap: 0

Enter the second index to swap: 4

```

**Output:** 

`[25, 10, 15, 20, 5]`

