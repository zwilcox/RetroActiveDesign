LUI 55 r0	# Make the address for where init function starts
ORI 182 r0
JAL r1 initlevel
LUI 61 r0
ORI 255 r0
SUBI 53 r0
SUBI 53 r0
SUBI 31 r0
MOVI 0 r3
MOVI 0 r1
loopa:
CMPI 37 r1
BEQ 14  #endloopa
MOVI 0 r2
loopb:
CMPI 17 r2
BEQ 9   #endloopb
MOV r1 r4
MULI 53 r4
ADD r2 r4
MULI -1 r4
ADD r0 r4
STOR r3 r4
ADDI 1 r3
ADDI 1 r2
endloopb:
ADDI 1 r1
BUC -11
endloopa:
BUC 0
initlevel:
MOV r0 r3	# r3 current address of where we are reading from memory	 
LUI 63 r1	# make address for writting location in frame buffer
ORI 255 r1
SUBI 53 r1	# Offset by one row
SUBI 1 r1	# Offset by one column
MOVI 0 r6
loopi:
CMPI 31 r6
BEQ 16 #this should support labels, jump endloopi
MOVI 0 r7
loopj:
CMPI 28 r7
BEQ 11 #jump to endloopj
MOV r6 r4
MULI 53 r4
ADD r7 r4
MULI -1 r4
ADD r1 r4
LOAD r5 r3
STOR r5 r4
SUBI 1 r3
ADDI 1 r7
BUC -11
endloopj:
ADDI 1 r6
BUC -16
endloopi:
RETX ra