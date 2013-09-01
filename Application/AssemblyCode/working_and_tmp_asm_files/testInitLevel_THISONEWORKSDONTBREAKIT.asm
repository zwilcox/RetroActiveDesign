//initialize lives left
LUI 51 r4		//lives left addr
ORI 244 r4 		//lives left addr
MOVI 4 r0
STOR r0 r4

top:
JAL r1 drawLivesLeft
JAL r1 initlevel
JUC r1 top

initlevel:
LUI 55 r0	// Make the address for where init function starts
ORI 182 r0	//
MOV r0 r3	// r3 current address of where we are reading from memory	 
LUI 63 r1	# make address for writting location in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -5 r8
ADD r8 r1	# Offset by rows
ADDI -13 r1	# Offset by columns
MOVI 0 r6
loopi:
CMPI 31 r6
BEQ endloopi #this should support labels, jump endloopi
MOVI 0 r7
loopj:
CMPI 28 r7
BEQ endloopj #jump to endloopj
MOV r6 r4
MULI 53 r4
ADD r7 r4
MULI -1 r4
ADD r1 r4
LOAD r5 r3
STOR r5 r4
SUBI 1 r3
ADDI 1 r7
BUC loopj
endloopj:
ADDI 1 r6
BUC loopi
endloopi:
RETX

drawLivesLeft:
LUI 63 r1	# make address for writting location in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -37 r8
ADD r8 r1	# Offset by rows
ADDI -14 r1	# Offset by columns
//zero out space where lives drawn
MOVI 5 r8
MOVI 0 r0   // number of lives drawn
MOVI 0 r2   // blank glyph
livesClearLoop:
CMP 5 r0
BEQ endlivesClearLoop
STOR r2 r1
ADDI -1 r1
ADDI 1 r0
BUC livesClearLoop
endlivesClearLoop:
ADDI 5 r1	//reset address
LUI 51 r8		//lives left addr
ORI 244 r8 		//lives left addr
LOAD r8 r8
MOVI 0 r0
MOVI 226 r2		//pman glyph
livesLoop:
CMP r0 r8
BEQ endlivesLoop
STOR r2 r1
ADDI -1 r1
ADDI 1 r0
BUC livesLoop
endlivesLoop:
RETX