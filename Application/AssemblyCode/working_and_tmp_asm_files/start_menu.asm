//***************************************
//************Start Menu*****************
//***************************************


// A(114) - Z(139)
// !(140)
// 0(169) - 9(178)

start_menu:
// zero out map
	JAL clearscreen
	MOVI 0 r8	// zero out r8 for toggle
	LUI 63 r0	// top left most glyph address
	ORI 255 r0
	ADDI -212 r0	// offset rows by 4 down
	ADDI -212 r0	// offset rows by 4 down
	ADDI -22 r0	// and 22 columns
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 0 r1	// Store ' '
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0	
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI 6 r0	// offset column
	ADDI -212 r0	// offset rows by 4 down
	ADDI -212 r0	// offset rows by 4 down
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI 6 r0
	ADDI -212 r0
	ADDI -212 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 0 r1	// Store ' '
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI 5 r0
	ADDI 212 r0
	MOV r0 r7	// calulate fb pointer
start_loop:
	// check if start button has been pressed on NES controller
	MOV r15 r14
	JAL checkstart
	MOV r14 r15
	
checkstart:
	MOVI 0 r2	// Check 'START'
	LUI 255 r2
	ORI 252 r2
	LOAD r2 r2
	CMPI 1 r2
	BEQ dead_menu	// if start asserted, start game 
	RETX
	LUI 255 r3	// calculate timer return address
	ORI 230 r3
	LOAD r3 r3	// load timer rv into r3	
	CMPI 1 r3
	BNE choose_draw
	MOV r15 r14
	JAL toggle
	MOV r14 r15
choose_draw:
	CMP 1 r8
	BNE draw_blank
draw_start:
	MOVI 114 r1	// Store 'A'
	STOR r1 r7
	ADDI -1 r7	
	MOVI 114 r1	// Store 'A'
	STOR r1 r7
	ADDI -1 r7
	MOVI 114 r1	// Store 'A'
	STOR r1 r7
	ADDI -1 r7
	MOVI 114 r1	// Store 'A'
	STOR r1 r7
	ADDI -1 r7
	MOVI 114 r1	// Store 'A'
	STOR r1 r7
	MOV r0 r7	// reset address
	JUC start_loop
	
draw_blank:	
	MOVI 0 r1	// otherwise draw nothing
	STOR r1 r7
	ADDI -1 r7
	MOVI 0 r1
	STOR r1 r7
	ADDI -1 r7
	MOVI 0 r1
	STOR r1 r7
	ADDI -1 r7
	MOVI 0 r1
	STOR r1 r7
	ADDI -1 r7
	MOVI 0 r1
	STOR r1 r7
	MOV r0 r7	// reset fb pointer
	JUC start_loop
	
toggle:
	XORI 1 r8	// toggle rv	
	LUI 255 r4	// reset timer 
	ORI 231 r4
	MOVI 65 r5
	STOR r5 r4
	RETX
	
dead_menu:
// zero out map
	JAL clearscreen
	MOVI 0 r8	// zero out r8 for toggle
	LUI 63 r0	// top left most glyph address
	ORI 255 r0
	ADDI -212 r0	// offset rows by 4 down
	ADDI -212 r0	// offset rows by 4 down
	ADDI -22 r0	// and 22 columns
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 0 r1	// Store ' '
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0	
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI 6 r0	// offset column
	ADDI -212 r0	// offset rows by 4 down
	ADDI -212 r0	// offset rows by 4 down
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI 6 r0
	ADDI -212 r0
	ADDI -212 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 0 r1	// Store ' '
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI -1 r0
	MOVI 139 r1	// Store 'Z'
	STOR r1 r0
	ADDI 5 r0
	ADDI 212 r0
	MOV r0 r7	// calulate fb pointer
	MOVI 0 r8
	JUC start_loop
	
	clearscreen:
	LUI 63 r2	
	ORI 255 r2	# r2 is current fb index
	LUI	55 r3
	ORI 183 r3	# r3 is last square outside of fp
	MOVI 1 r4   # load fb with glyph 0
	CMP	r3 r2
	BEQ 4
	STOR r4 r2
	ADDI -1 r2
	BUC -4
	RETX