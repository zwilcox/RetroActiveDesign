LUI 55 r0	# Make the address for where init function starts
ORI 182 r0	#
WAIT
initlevel:
MOV r0 r3	# r3 current address of where we are reading from memory	 
LUI 63 r1	# make address for writting location in frame buffer
ORI 255 r1
SUBI 53 r1	# Offset by one row
SUBI 1 r1	# Offset by one column
MOVI 0 r6
WAIT

loopi:
WAIT
CMPI 31 r6
BEQ endloopi #this should support labels, jump endloopi
MOVI 0 r7
WAIT

loopj:
WAIT
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
BUC -11
WAIT

endloopj:
WAIT
ADDI 1 r6
BUC -16
WAIT

endloopi:
WAIT
// Draw Pacman on Map
// r11, r12 -> FB address, glyph number
// r1, r2, r3, r4, r5, r6, r7, r8 -> I/O address
// r9, r10 -> temp
//
//

MOVI 53 r11	# Create initial FB address where we want to write
MULI 16 r11	# 16 rows up
ADDI 39 r11	# 39 columns from the right
MOVI 207 r12	# PM_right open mouth
WAIT

GameUpdate:
WAIT
LUI 255 r6
ORI 242	r6
MOVI 65 r5	
STOR r5 r6
ADDI -1 r6
LOAD r7 r6
CMPI 1 r7
BNE GameUpdate
STOR r12 r11	# store Pacman glyph to target location on FB
ANDI 0 r12	# Trash glyph register for use on next iteration

// do this for all input buttons on NES controller
// UP & DOWN
WAIT
NES_y:
WAIT
LUI 255 r9	# Create address for "UP" location in memory address 65528
ORI 251 r9
LOAD r1 r9	# Load "UP" value 
LUI 255 r10	# Create address for "DOWN" location in memory
ORI 250 r10	
LOAD r2 r10	# Load "DOWN" value 
CMP r1 r2	
BEQ NES_x	# If they are equal do nothing
CMPI 1 r1	# At this point we know one has been asserted
BEQ PMUupdate	# If r1 is asserted, Pacman tries to go up
BUC PMDupdate	# Else, Pacman tries to go down

WAIT
NES_x:
WAIT
MOVI 0 r9	# zero out these registers
MOVI 0 r10
LUI 255 r9	# Create address for "RIGHT" location in memory
ORI 248 r9
LOAD r3 r9	# Load "RIGHT" value 
LUI 255 r10	# Create address for "LEFT" location in memory
ORI 249 r10	
LOAD r4 r10	# Load "LEFT" value 
CMP r3 r4	
BEQ GameUpdate	# If they are equal do nothing
CMPI 1 r3	# At this point we know one has been asserted
BEQ PMRupdate	# If r1 is asserted, Pacman tries to go up
BUC PMLupdate	# Else, Pacman tries to go down

WAIT
PMUupdate:
WAIT
// Check value of glyph in the row above
MOV r11 r5
ADDI 53 r5 	# glyph above is 53 adress spaces higher in memory, 
LOAD r9 r5	# LOAD glyph number
CMPI 800	r9	# Wall glyphs are numbers 800+
BLT Incr_y	# No Wall, move up
BUC GameUpdate	# Wall, listen for inputs again

WAIT
PMDupdate:
WAIT
// Check value of glyph in the row below
MOV r11 r5
ADDI -53 r5 	# glyph below is 53 adress spaces lower in memory, 
LOAD r9 r5	# LOAD glyph number
CMPI 800	r9	# Wall glyphs are numbers 800+
BLT Decr_y	# No Wall, move down
BUC GameUpdate	# Wall, listen for inputs again

WAIT
PMRupdate:
WAIT
// Check value of glyph in the column to the right
MOV r11 r5
ADDI -1 r5 	# glyph to the right is 1 adress space lower in memory, 
LOAD r9 r5	# LOAD glyph number
CMPI 800	r9	# Wall glyphs are numbers 800+
BLT Incr_x	# No Wall, move right
BUC GameUpdate	# Wall, listen for inputs again

WAIT
PMLupdate:
WAIT
// Check value of glyph in the column to the left
MOV r11 r5
ADDI 1 r5 	# glyph to the left is 1 adress space higher in memory, 
LOAD r9 r5	# LOAD glyph number
CMPI 800	r9	# Wall glyphs are numbers 800+
BLT Decr_x	# No Wall, move left
BUC GameUpdate	# Wall, listen for inputs again

WAIT
Incr_x:
WAIT
// Check which glyph exists rightnow
MOVI 0 r0
STOR r0 r11
ADDI -1 r11 		# glyph above is 1 adress space lower in memory, 
MOVI 207 r12	# Load glyph of Pacman facing right
BUC GameUpdate

WAIT
Incr_y:
WAIT
MOVI 0 r0
STOR r0 r11
ADDI 53 r11 	# glyph above is 53 adress spaces higher in memory, 
MOVI 214 r12	# Load glyph of Pacman facing up
BUC GameUpdate

WAIT
Decr_x:
WAIT
MOVI 0 r0
STOR r0 r11
ADDI 1 r11
MOVI 200 r12	# Load glyph of Pacman facing left
BUC GameUpdate

WAIT
Decr_y:
WAIT
MOVI 0 r0
STOR r0 r11
ADDI -53 r11
MOVI 193 r12	# Load glyph of Pacman facing down
BUC GameUpdate
