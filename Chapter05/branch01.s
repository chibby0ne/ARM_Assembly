.text
.global main
main: 
    mov r0, #2
    b end           /* branch to 'end' */
    mov r0, #3
end:
    bx lr
