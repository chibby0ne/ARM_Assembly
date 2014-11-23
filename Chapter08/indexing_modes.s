.global main

main:
    /* non updating indexing modes */
    /* [rsource1, +#immediate] or [rsource1, -#inmediate */
    /* immediate has to be between 0 and 2^16 - 1 */
    mov r2, #3
    str r2, [r1, +#12]      /* *(r1 + 12) = 3 */
    
    /* [rsource1, +rsource2] or [rsource1, -rsource2] */
    /* useful when offset is > 2^16 - 1 */
    mov r2, #3
    mov r3, #12
    str r2, [r1, +r3]

    /* [rsource1, +rsource2, shift_oper #immediate] or [rsource1, -rsource2, shift_oper #immediate]
    /* useful when address must be multiplied by some fixed amount */

    /* for example to calculate addres in array in the item position r2 */
    add r3, r1, r2, LSL #2       /* r3 = r1 + r2 * 4 */ 
    str r2, [r3]                /* *(r3) = r2 */

    /* or like this */
    str r2, [r1, +r2, LSL #2]   /* *(r1 + r2 * 4) = r2 */

        
    /* updating indexing modes  */
    
    /* pre updating */

    /* post updating */


