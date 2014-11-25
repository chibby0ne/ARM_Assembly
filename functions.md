AAPCS Procedure call standard for the ARM Architecture
r15: pc (program counter: holds address of current instruction )
r14: lr (link register: holds address of next instruction that follows the one that called the current fucntion */
r13: sp (holds address of the top of the stack)

Function Parameters
The first 4 parameters must be stored sequentially in the registers r0, r1, r2 and r3. To pass more use the stack.

Well behaved Functions
A function should not make any assumption on the contents of CPSR (Control Program Status Register)
A function can freely modify registers r0, r1, r2 and r3
A function cannot assume anything on the contents of r0, r1, r2 and r3 unless they are being used as parameters
A function can freely modify lr but the value upon entering the function will be needed when exiting the function, so it must be stored somewhere (normally the stack) */
A function can modify all the remaining registers as long as their values are restored upon leaving the function i.e registers r4 - r12. This means that after calling a function and returning we have to assume that only registers r0, r1, r2, r3 and lr have been overwritten */

Calling a function
we can use bl label, where label must be a label defined in the .text section
or we can store the address of the function in a register and use blx rsource1

In any case the behaviour is as follows: the address of the function (inmmediately enconded in the bl or using the value of the register in blx) is stored in pc The address of the instruction following the bl or blx instruction is then stored in lr.

Leaving a function 
We will retrive the value of the initial lr and put it into some register and use bx rsource1
We could also use blx but it would update lr which is useless here

Returnning data form functions
Functions must use r0 for data that fits in 32bits or less. 
For basic types of 64bits, they will be returned in r1 and r0. Any other data is returned through the stack unless it is 32bit or less, where it will be return in r0

The sp is always 4 byte aligned. But it has to be 8 byte aligned otherwise funny things happen when we call what the AAPCS calls public interfaces (code written by other people)
The value of sp  when leaving a function should be the same value it had upon entering it

