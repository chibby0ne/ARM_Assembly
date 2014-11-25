.data

/* First message */
.balign 4
message1: .asciz "Hey, type a number: "

/* Second message */
.balign 4
message2: .asciz "I read the number %d\n"

/* Format pattern for scanf */
.balign 4
scan_pattern: .asciz "%d"

/* When scanf will store the number read */
.balign 4
number_read: .word 0

.balign 4
return: .word 0


.text

.global main
main:
    ldr r1, addr_of_return      /* r1 = &addr_of_return */
    str lr, [r1]                /* *r1 = lr */
    
    ldr r0, addr_of_message1    /* r0 = &addr_of_message1 */
    bl printf                   /* call printf with message1 */

    ldr r0, addr_of_scan_pattern    /* r0 = s &scan_pattern */
    ldr r1, addr_of_number_read     /* r1 = &number_read */
    bl scanf
    
    ldr r0, addr_of_message2        /* r0 = &message2 */
    ldr r1, addr_of_number_read     /* r1 = &number_read */
    ldr r1, [r1]                    /* r1 = *r1 */
    bl printf
    
    ldr r0, addr_of_number_read     /* r0 = &number_read */
    ldr r0, [r0]                    /* r0 = *r0 */

    ldr lr, addr_of_return          /* lr = &addr_of_return */
    ldr lr, [lr]                    /* lr = *lr */
    bx lr



/* labels for date segment */
addr_of_message1: .word message1
addr_of_message2: .word message2
addr_of_scan_pattern: .word scan_pattern
addr_of_number_read: .word number_read
addr_of_return: .word return


/* global functions */
.global printf
.global scanf
