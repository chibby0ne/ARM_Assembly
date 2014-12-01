/* 
int factorial(n) {
    if (n == 0)
        return 0;
    else
        return n * factorial(n - 1);
}
*/ 
.data

message1: .asciz "Type a number: "
format: .asciz "%d"
message2: .asciz "The factorial of %d is %d\n"

.text

factorial:
    push {r4, lr}

    mov r4, r0              /* keep a copy of the initial value of r0 in r4 */
    
    cmp r0, #0              /* if (n != 0) */
    bne is_nonzero          /* return n * factorial(n - 1) */
    mov r0, #1              /* else n = 0, return 1 */
    b end               
is_nonzero:

    sub r0, r0, #1          /* n = n - 1 */
    bl factorial 
    
    mov r1, r4
    mul r0, r0, r1

end:
    pop {r4, lr}
    bx lr                   /* leave func */
    
.global main
main:
    str lr, [sp, #-4]!      /* push lr onto the top of the stack */
    sub sp, sp, #4          /* create sapce for one int, where to keep the number entered by user */

    ldr r0, addr_of_message1
    bl printf

    ldr r0, addr_of_format  /* set format as first parameter of scanf */
    mov r1, sp              /* set the top of the stack as the second parameter (to store the value input in the space created before */
    bl scanf

    ldr r0, [sp]            /* load the inputed value to r0 */
    bl factorial

    mov r2, r0              /* store return value of factorial (result of factorial) as third parameter to printf */
    
    ldr r1, [sp]            /* store value input to factorial function as second parameter to printf */
    ldr r0, addr_of_message2    /* set &message as first parameter to printf */
    bl printf

    add sp, sp, #+4         /* discard return value by scanf */
    ldr lr, [sp], #+4       /* revert lr from stack to lr */
    bx lr                   /* leave main */
    
    
addr_of_message1: .word message1
addr_of_message2: .word message2
addr_of_format: .word format
