.global main
.func main

main:
	# there's no shift left in ARM
	# so to shift left
	mov r1, r2, LSL #1
	
	mov r1, r2, LSL #1      /* r1 = (r2 * 2) */
	mov r1, r2, LSL #2      /* r1 = (r2 * 4) */
	mov r1, r3, ASR #3      /* r1 = (r3 / 8) */
	mov r3, #4
	mov r1, r2, LSL r3      /* r1 = (r2 * 16) */
	
	
	add r1, r2, r2, LSL #1      /* r1 =  r1 + r1 * 2 equivalent to r1 = r2 * 3 */
	add r1, r2, r2, LSL #2      /* r1 =  r1 + r1 * 4 equivalent to r1 = r2 * 5 */
	
	
	sub r1, r2, r2, LSL #3     /* r1 = r2 - r2 * 8 equivalent to r1 = r2 * (-7) */
	
	rsb r1, r2, r2, LSL #3      /* r1 = r2 * 8 - r1 equivalent to r1 = r2 * 7 */
	
	
	/*  Complicated way to multiply the intitial value of r1 by 42 = 7 * 3 * 2 */
	rsb r1, r1, r1, LSL #3      /* r1 = r1 * 8 - r1 equivalent to r1 = r1 * 7 */
	add r1, r1, r1, LSL #1      /* r1 = r1 + r1 * 2 equivalent to r1 = r1 * 3 */
	add r1, r1, r1              /* r1 = r1 + r1 equivalent to r1 = r1 * 2 */
	
