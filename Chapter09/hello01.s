.data

greeting:
    .asciz "Hello World"

.balign 4
return: .word 0

.text

.global main
main:
    ldr r1, addr_of_return
    str lr, [r1]
    
    ldr r0, addr_of_greeting

    bl puts
    
    ldr r1, addr_of_return
    ldr lr, [r1]
    bx lr






addr_of_greeting: .word greeting
addr_of_return: .word return

.global puts
