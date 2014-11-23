/* while (E)
    S
*/

while_condition:
    bXX end_of_loop         /* if E is false, then leave loop */
    /*assembler of S */
    b while_condition
end_of_loop

/* for (i = L; i < N; i += K)
    S

is the same as

i = L
while (i < N) {
    S;
    i += K;
}
*/

ld r1, addr_of_L
ld r1, [r1]
while_condition:
    cmp r1, #N
    bge end_of_loop
    /* assembler of S*/
    add r1, r1, #K
    b while_condition
end_of_loop:
