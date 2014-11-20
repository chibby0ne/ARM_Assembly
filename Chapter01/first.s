/* -- first.s */
/* This is a comment */
.global main /* 'main' is our entry point and must be global. For the C runtime to be able to call it,otherwise it will fail */
.func main   /* 'main' is a function. It specifies between code and data */
 
main:          /* This is main */
    mov r0, #2 /* Put a 2 inside the register r0, r0 contains the error code of the function main */
    bx lr      /* Return from main */
