LUI 63 r1
MOVI 255 r2
OR r1 r2
LUI	55 r1
MOVI 183 r3
OR r1 r3
MOVI 1 r4
CMP	r3 r2
BEQ 4
STOR r4 r2
ADDI -1 r2
BUC -4
MOVI	0 r5
JUC	r5