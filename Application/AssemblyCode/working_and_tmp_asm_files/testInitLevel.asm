JAL r1 initlevel # maybe macro to JAL initlevel 
LUI 255 r0
ORI 247 r0
MOVI 8 r1
STOR r1 r0
BUC 0

initlevel:
LUI 55 r0	# Make the address for where init function starts
ORI 182 r0	#
MOV r0 r3	# r3 current address of where we are reading from memory	 
LUI 63 r1	# make address for writting location in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -5 r8
ADD r8 r1	# Offset by rows
ADDI -13 r1	# Offset by columns
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