cmp is not the only way to update CPSR.
By default an instruction doesn't update CPSR undless we append the suffix -s.

For example:

``` c
/* for (int i = 100 ; i >= 0; i--) */
mov r1, #100
loop:
  /* do something */
  sub r1, r1, #1      /* r1 ← r1 - 1 */
  cmp r1, #0          /* update cpsr with r1 - 0 */
  bge loop            /* branch if r1 >= 100 */
```
could also be written as

/* for (int i = 100 ; i >= 0; i--) */
mov r1, #100
loop:
  /* do something */
  subs r1, r1, #1      /* r1 ← r1 - 1 and update CPRS with final R1 */
  bpl loop            /* branch if previous sub computed a positive number (N flag is 0) */

Thats because subs will update CPSR with the result of the substraction. This means that the flags N, Z, C and V will be updated, so we can use a branch right after subs.

NOTE: we assume that the result is compared against 0, so that if instead of bpl we ask bne (what we are really saying is if it is not equal to 0)

for example:
``` c
/* for (int i = 100 ; i > 0; i--). Note here i > 0, not i >= 0 as in the example above */
mov r1, #100
loop:
  /* do something */
  subs r1, r1, #1      /* r1 ← r1 - 1  and update cpsr with the final r1 */
  bne loop             /* branch if the previous sub computed a number that is not zero (Z flag in cpsr is 0) */
````

As a rule of thumb we may want to apply the use of the -s suffix in codes in the following forms:
s = ....
if (s @ 0)
where @ means any comparison operator
