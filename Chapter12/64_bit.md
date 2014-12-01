ARMv6 and v7 is are 32bit architectures, so in order to represent 64 bit numbers it uses two 32-bit numbers, representing the lower and uppper part of the number
nhigher and nlower, where n = nhigher * 2^32 + nlower.

When we are keeping a 64 bit number in registers we use two consecutive registers e.g r1, r2 that we will write as {r1, r2}, where the most significant half in the higher numbered register e.g r2 has the MSB of the 64 bit number

When storing the a 64 bit number in memory we will store in two consecutive addresses the two parts, being the lower one in the lower address.

Addition

supposer two 64 bit numbers are stored in {r2, r3} and {r4, r5} respectively and their sum is stored in {r0, r1}

The optimal method of doing the addtion is:

adds r0, r2, r4     /* add lower halves and update CPRS */
adc  r1, r3, r5     /* add upper halves and add carry if generated in previous addition */


Substraction

Analogous to addition.
When substracting, if we need to borrow (when operand2 > operand1) then C will be disabled (C = 0)
otherwise if we don't need to borrow, then C = 1
subc performs nomal substraction if C = 1, else (C = 0) it substracts one more

subs r0, r2, r4     /* substract lower halves and update CPRS */
subc r1, r3, r5     /* substract upper halves plus the NOT of the carry from the lower halves */


Multiplication

Multiplication of 64 bit numbers can required up to 128 bits!
For simplicity let's assume that doesn't happen. 
ARM assembly has several instructions for multplication, the three most imprtant ones are:

Out 64bit numbers are arctually 2 32bit numbers, which translate as a 64 bit number x = 2^32 * x1 + x0, where x0 and x1 are 32 bits numbers. if another number y is y = 2^32 * y1 + y0
Multiplying them x * y = 2^64 (x1 * y1) + 2^32 (x1 * y0 + x0  * y1) + x0 * y0


mul Rd, Rsourc21, Rsource2 ------ used when we don't care if the result doesn't fit in 32 bits.. It is the fastest multiplication. Unfourtunately it doesn't update CPSR (useful to indicate overflow)

The others are smull and umull, that differ on whether the operandas are in signed (two's complement) or  unsigned (not 2's complement)

{s,u}mull Rlowerhalf, Rupperhalf, Rsource1, Rsource2 -----  Rlowerhalf is the lower half of the 64bit result

So for multiplying two 64 bits numbers and getting a 64 bit result (assuming it won't require more bits) then we must multply x0 * y0 and x0 * y1 + x1 * y0
Assuming {r2, r3} is first number and {r4, r5} is the second number then:

umull r0, r6, r2, r4        /* x0 * y0 */
umull r7, r8, r2, r5        /* x0 * y1 */
umull r4, r5, r3, r4        /* x1 * y1  (we can replace {r4, r5} because we won't be using those values anymore */

adds r2, r7, r4             /* (x0 * y1 + x1 * y0) */
adc r1, r2, r6              /* 2^32 (x0 * y1 + x1 * y0) */




NOTE:

To pass 64bit parameters, the lower half must be on a even number register
If we run out of registers for parameter passing we use the stack. There are two rules for using the stack:
1. Stack must be aligned with the data it is passing (this is done by adjusting before), also always keep the stack 8-byte aligned
2. An argument with a lower position number must have a lower address in the stack, so we have to pass arguments in the opposite order as we normally would in C





