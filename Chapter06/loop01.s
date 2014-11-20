/* loop */

.text
.global main

main:
    mov r1, #0
    mov r2, #1
loop:
    cmp r2, #22
    bgt end 
    add r1, r1, r2
    add r2, r2, #1
    b loop
end:
    mov r0, r1
    bx lr

/* with 22 answer: 253
with 100 answer: 5050 but this requires more than 8 bits to represent and so 
only lower 8 bits are shown */

