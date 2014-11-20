/* better loop */

.text
.global main

main:
    mov r1, #0
    mov r2, #0
    b check_loop

loop:
    add r1, r1, r2
    add r2, r2, #1

check_loop:
    cmp r2, #22
    ble loop

end: 
    mov r0, r1
    bx lr

/* better: only 4 instructions inside loop instead of 5,
only one branch (conditional) inside inside loop

requirements:
invert brach condition (test for what keeps it looping)
test at the end of loop
enter loop with unconditional jump to the test part
