/* in C 
int a[100] */
.data 

.balign 4
a: .skip 400

/* in C 
struct my_struct {
    char f0;
    int f1;
} b;    */

.balign 4
b: .skip 8      /* 5 bytes are required but every addr must be a multiple of 4, so 8*/

/* in C
for (i = 0; i< 100; i++ )
    a[i] = i;
*/

.text

.global main
main:
    ldr r1, addr_of_a           /* r1 = &a */
    mov r2, #0
loop:
    cmp r2, #100                /* i < 100 */
    beq end
    add r3, r1, r2, LSL #2      /* calculating &a[i] = &a + i * 4 */
    str r2, [r3]                /* a[i] = i */
    add r2, r2, #1          /* i++ */
    b loop
end:
    bx lr


addr_of_a: .word a
