# Vector Compression Program  RISC V

## Description

This program is a vector compression utility. It accepts a vector of integers from the user and then creates two new vectors. The first output vector contains only the non-zero elements from the original vector, and the second contains the indices where those non-zero elements were located.

## How to Use

To run the program, you will need to provide a vector of integers as input. The program will then print two resulting vectors: one with the non-zero values and the other with their original index positions.

## Usage Example

Here is an example of the program's execution flow and output.

```
Enter the size of the vector:
8
Enter the vector elements, one integer per line:
1
0
0
9
0
0
4
0
The non-zero vector is:
1 9 4

The non-zero indices are:
0 3 6
```
