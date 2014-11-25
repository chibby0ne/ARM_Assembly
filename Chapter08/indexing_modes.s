.global main

main:

    /* non updating indexing modes */

    /* [rsource1, +#immediate] or [rsource1, -#inmediate */
    mov r2, #3
    str r2, [r1, +#12]      /* *(r1 + 12) = 3 */
    
    /* [rsource1, +rsource2] or [rsource1, -rsource2] */
    mov r2, #3
    mov r3, #12
    str r2, [r1, +r3]

    /* [rsource1, +rsource2, shift_oper #immediate] or [rsource1, -rsource2, shift_oper #immediate] */

    /* for example to calculate addres in array in the item position r2 */
    add r3, r1, r2, LSL #2       /* r3 = r1 + r2 * 4 */ 
    str r2, [r3]                /* *(r3) = r2 */

    /* or like this */
    str r2, [r1, +r2, LSL #2]   /* *(r1 + r2 * 4) = r2 */

        
    /* updating indexing modes  */
    
    /* post indexing (post updating) */
    /* [rsource1], #+immediate or [rsorce1], #-immmediate */

loop:
    cmp r2, #100        /* have we reached 100? */
    beq end             /* if so jump to end, else continue */
    str r2, [r1], #+4    /* *(r1) = r2 and then r1 = r1 + 4 */
    add r2, r2, #1      /* r2++ */
    b loop
end:

    /* [rsource1], +rsource2 or [rsource1], -rsource2 */

    mov r3, #4
loop1:
    cmp r2, #100        /* have we reached 100? */
    beq end1             /* if so jump to end, else continue */
    str r2, [r1], r3    /* *(r1) = r2 and then r1 = r1 + r3 */
    add r2, r2, #1      /* r2++ */
    b loop1
end1:

    
    /* [rsource1], +rsource2, shift_operation #immediate or [rsource1], -rsource2, shift_operation #immediate */
        
    mov r3, #1
loop2:
    cmp r2, #100                /* have we reached 100? */
    beq end2                     /* if so jump to end, else continue */
    str r2, [r1], r3, LSL #2    /* *(r1) = r2 and then r1 = r1 + r3 * 4 */
    add r2, r2, #1              /* r2++ */
    b loop2
end2:



    /* pre indexing (pre updating) */
    
    /* [rsource1, #+immediate]! or [rsource1, #-immediate]! */
    ldr r2, [r1, #+12]!     /* r1 = r1 + 12  and then r2 = *r1 */
    add r2, r2, r2         /* r2 += r2 */
    str r2, [r1]            /* *r1 = r2 */
        
    /* [rsource1, +rsource2]! or [rsource1, #-rsource2]! */
    ldr r2, [r1, #+12]!     /* r1 = r1 + 12  and then r2 = *r1 */
    add r2, r2, r2         /* r2 += r2 */
    str r2, [r1]            /* *r1 = r2 */

    /* [rsource1, +rsource2, shift_operation #immediate]! or [rsource1, -rsource2, shift_operation # immemdaite]! */
    ldr r2, [r1, #+12]!     /* r1 = r1 + 12  and then r2 = *r1 */
    add r2, r2, r2         /* r2 += r2 */
    str r2, [r1]            /* *r1 = r2 */



    /* b.f1 = b.f1 + 7 */
    
    /* suppose r1 contains address of b */
    ldr r2, [r1, #+4]!
    add r2, r2, #7
    str r2, [r1]











