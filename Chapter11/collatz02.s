.data 

message: .asciz "Type a number: "
scan_format: .asciz "%d"
message2: .asciz "Length of the Haulstone sequence for %d is %d\n"

.text

collatz:
    /* r0 contains the first argument */
    /* Only r0, r1 and r2 are modified
    so we do not need to keep anything 
    in the stack */
    /* Since we do not do any call we 
i   do no have to keep lr either */
    mov r1, r0          /* r1 = r0 */
    mov r0, #0          /* r0 = 0 */
collatz_loop:
    cmp r1, #1          /* compare r1 and 1 */
    beq collatz_end     /* compare r1 and 1 */
    and r2, r1, #1      /* r2 = r1 & 1 */
    cmp r2, #0          /* r2 == 0 */
    bne collatz_odd     /* if r2 != 0, jump collatz_odd*/
collatz_even:
    mov r1, r1, ASR #1  /* r1 = r1 / 2 */
    b collatz_end_loop  /* jmp to collatz_end */
collatz_odd:
    add r1, r1, r1, LSL #1   /* r1 = 3 * r1 */
    add r1, r1, #1          /* r1 = r1 + 1 */
collatz_end_loop:
    add r0, r0, #1      /* r0 = r0 + 1 */
    b collatz_loop      /* jmp collatz_loop */
collatz_end:
    bx lr

.global main
main:
    push {lr}           /* keep lr */
    sub sp, sp, #4      /* make room 4 bytes in the stack */

    ldr r0, addr_of_message     /* load first param for printf: &message */
    bl printf                   /* call prtinf */
    
    ldr r0, addr_of_scan_format /* load first param for scanf: &san_format */
    mov r1, sp                  /* load second param for scanf: &sp */
    
    bl scanf                    /* call scanf */
    
    ldr r0, [sp]                /* r0 = *sp */

    bl collatz                  /* call collatz */
    
    mov r2, r0                  /* r2 = r0 (result of collatz) */
    
    ldr r1, [sp]                /* r1 = stop of stack * value entedred  in scanf */
    ldr r0, addr_of_message2    /* r0 = &mesage1 */
    bl printf                   /* call printf */

    add sp, sp, #4              /* discard top of sp (scanf value entered) */
    pop {lr}                    /* restore lr */
    bx lr       

addr_of_message: .word message
addr_of_scan_format: .word scan_format
addr_of_message2: .word message2
    
