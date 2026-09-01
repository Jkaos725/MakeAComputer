// ALU test program - uses only implemented opcodes: nop, add, sub, nor, and, xor, rsh, ldi
// Each result lands in its own register. Check reg file against expected values below.

// Load test values
ldi r1 5          // r1 = 5   (0000 0101)
ldi r2 2          // r2 = 2   (0000 0010)

// Basic add/sub
add r1 r2 r3      // r3 = 5 + 2 = 7
sub r1 r2 r4      // r4 = 5 - 2 = 3

// Bitwise tests, values with overlapping bits
ldi r5 12         // r5 = 12  (0000 1100)
ldi r6 10         // r6 = 10  (0000 1010)

and r5 r6 r7      // r7  = 12 & 10  = 8    (0000 1000)
xor r5 r6 r8      // r8  = 12 ^ 10  = 6    (0000 0110)
nor r5 r6 r9      // r9  = !(12|10) = 241  (1111 0001)
rsh r5 r10        // r10 = 12 >> 1  = 6    (0000 0110)

// Edge cases
ldi r11 255       // r11 = 255 (1111 1111)
ldi r12 1         // r12 = 1

add r11 r12 r13   // r13 = 255 + 1 = 0   (overflow wraps, carry out)
sub r2 r1 r14     // r14 = 2 - 5   = 253 (1111 1101, -3 in 2s comp)
rsh r11 r15       // r15 = 255 >> 1 = 127 (0111 1111)

nop
