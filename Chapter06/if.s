/*
 if (E) then
    S1
else 
    S2
*/

if_eval:
    /*  Assembler that evaluates E and updates CPSR accordingly */
    bXX else /* XX is the apropiate condition */
then_part:
    /* assembler for S1, the 'then' part */
    b end_of_if
else:
    /* assembler for S2, the 'else' part */
end_of_if:


/* if (E) then
    S1
*/

if_eval:
    bXX end_if
then_part:
    

end_if:
