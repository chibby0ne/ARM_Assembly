/* ---  Data section */
.data

/* ensure variable is 4-byte alignes */
.balign 4
/* define storage for myvar1 */
myvar1:
    /* Contents of myvar1 is just 4 bytes containing value '3' */
    .word 0

.balign 4
myvar2:
    .word 0

/*  --- Code section */
.text

.balign 4 
.global main
main:

    ldr r1, addr_of_myvar1
    mov r3, #3                  
    str r3, [r1]                /* *r1 = r3 */
    ldr r2, addr_of_myvar2
    mov r3, #4
    str r3, [r2]                
    


    ldr r1, addr_of_myvar1      /* r1 = &myvar1 */
    ldr r1, [r1]                /* r1 = *r1 */
    ldr r2, addr_of_myvar2      
    ldr r2, [r2]
    add r0, r1, r2
    bx lr


/* Labels needed to acess data */
addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2
