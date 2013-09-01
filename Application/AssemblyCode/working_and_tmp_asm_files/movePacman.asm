#load base address 16383
LUI 63 r1
MOVI 255 r2
OR r1 r2
#load ending address frame buffer
LUI	55 r1
MOVI 4 r3
OR r1 r3
#make controller adresses
#up is r7
#down is r8
# left is r9
# right is r10
MOVI 254 r7
OR r1 r7
MOVI 253 r8
OR r1 r8
MOVI 252 r9
OR r1 r9
MOVI 251 r10
OR r1 r10
# old position is in r4 PACMAN OLDPOS
MOV r2 r4
# new position is in r5 PACMAN NEWPOS
MOV r2 r5
#get controller positions
start:
LOAD r2 r7 # check up
CMPI 1 r2	#if pushed
BNE 2
ADDI 53 r5

LOAD r2 r8 # check down
CMPI 1 r2
BNE 2
ADDI -53 r5

LOAD r2 r9 #left
CMPI 1 r2
BNE 2
ADDI 1 r5

LOAD r2 r10 #right
CMPI 1 r2
BNE 2
ADDI -1 r5

#update position in frame buffer
MOVI 0 r0
STOR r0 r4
MOVI 20 r0
STOR r0 r5

#copy new position to old position
MOV r5 r4

#wait for 1024 instructions
LUI 8 r0
ADDI -1 r0
CMPI 0 r0
BNE -3
#jump to top
BUC start