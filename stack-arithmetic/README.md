# RISC-V Assembly Implementation of a C Function

This repository contains a RISC-V assembly language program that demonstrates the implementation of a C function, focusing on correct stack management for register saving and restoration.

## C Function Prototype

The assembly program provides a low-level implementation of the following C code, which defines an `example` function and a `main` function to call it.
```
int example(int i, int j, int g, int h) {
int f = 0;
f = (g+h) – (i+j);
return f;
}

main(){
int g,h,i,j;
// readin values for i, j, g, and h from the user
// output the value returned by example(i, j, g, h);
}
```
## Assembly Code Details

The file `stack-arithmetic.S` contains the RISC-V assembly code corresponding to the C functions.

### `main` Function

*   **Entry Point**: The `main` label marks the start of the program.
*   **Argument Setup**: It initializes registers `a0` through `a3` with constant values (`2`, `4`, `5`, `7`) to serve as arguments for the `example` function.
*   **Function Call**: The `call example` instruction transfers control to the `example` function.

### `example` Function

This function computes `(g+h) – (i+j)` and adheres to RISC-V calling conventions.

#### Stack Management

To preserve the caller's state, the function performs the following stack operations.

> 1.  **Allocate Stack Frame**: The stack pointer (`sp`) is decremented to reserve space.
> 2.  **Save Registers**: The return address (`ra`) and the saved register `s0` are pushed onto the stack.
> 3.  **Restore Registers**: Before returning, the saved values for `ra` and `s0` are popped from the stack.
> 4.  **Deallocate Stack Frame**: The stack pointer is incremented to its original position.

#### Arithmetic Logic

*   The arguments `i`, `j`, `g`, and `h` are passed in registers `a0`, `a1`, `a2`, and `a3`.
*   The code uses `add` and `sub` instructions to perform the calculation.
*   The final result is placed in the `a0` register for the return value.

