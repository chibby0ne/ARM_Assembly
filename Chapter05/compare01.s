.text
.global main
main:
    mov r1, #2
    mov r2, #2
    cmp r1, r2          /* update CPRS condition condes with the value of r1-r2 */
    beq case_equal      /* branch to 'case_equal' if Z = 1 */
case_different:
    mov r0, #2
    b end
case_equal:
    mov r0, #1
end:
    bx lr
