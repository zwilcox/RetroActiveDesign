//***************************************
//************Start Menu*****************
//***************************************


// A(114) - Z(139)
// !(140)
// 0(169) - 9(178)

start_menu:
// zero out map
	MOVI 0 r8	// zero out r8 for toggle return address
	LUI 63 r0	// top left most glyph address
	ORI 255 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0	// offset rows by 4 down
	ADDI -22 r0	// and 22 columns
	MOVI 129 r1	// Store 'P'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOV r0 r10	// save this location to draw closed mouth too
	MOVI 245 r1	// Store 'pacman0'
	STOR r1 r0
	ADDI -1 r0
	MOVI 126 r1	// Store 'M'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOVI 127 r1	// Store 'N'
	STOR r1 r0
	ADDI -1 r0
	MOVI 0 r1	// Store ' '
	STOR r1 r0
	ADDI -1 r0
	MOVI 171 r1	// Store '2'
	STOR r1 r0	
	ADDI -1 r0
	LUI 1 r1	// Store 'pill'
	ORI 15 r1
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// Store '0'
	STOR r1 r0
	ADDI 6 r0	
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0	// offset rows by 4 down
	MOVI 129 r1	// Store 'P'
	STOR r1 r0
	ADDI -1 r0
	MOVI 131 r1	// Store 'R'
	STOR r1 r0
	ADDI -1 r0
	MOVI 118 r1	// Store 'E'
	STOR r1 r0
	ADDI -1 r0
	MOVI 132 r1	// Store 'S'
	STOR r1 r0
	ADDI -1 r0
	MOVI 132 r1	// Store 'S'
	STOR r1 r0
	ADDI 6 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0
	MOVI 133 r1	// Store 'T'
	STOR r1 r0
	ADDI -1 r0
	MOVI 128 r1	// Store 'O'
	STOR r1 r0
	ADDI -1 r0
	MOVI 0 r1	// Store ' '
	STOR r1 r0
	ADDI -1 r0
	MOVI 115 r1	// Store 'B'
	STOR r1 r0
	ADDI -1 r0
	MOVI 118 r1	// Store 'E'
	STOR r1 r0
	ADDI -1 r0
	MOVI 120 r1	// Store 'G'
	STOR r1 r0
	ADDI -1 r0
	MOVI 122 r1	// Store 'I'
	STOR r1 r0
	ADDI -1 r0
	MOVI 127 r1	// Store 'N'
	STOR r1 r0
	ADDI 5 r0
	ADDI 106 r0
	ADDI 106 r0
	LUI 255 r4	// start timer 
	ORI 231 r4
	MOVI 250 r5	// .5 seconds (500 milliseconds)
	ADDI 125 r5
	ADDI 125 r5
	STOR r5 r4	
start_loop:
	MOV r0 r7
	//check if start button has been pressed on NES controller
	//MOV r15 r14
	//JAL r9 checkstart
	//MOV r14 r15
	LUI 255 r3	// calculate timer return value address
	ORI 230 r3
	LOAD r3 r3	// load timer rv into r3	
	CMPI 1 r3
	BNE choose_draw
	MOV r15 r14
	JAL r9 toggle
	MOV r14 r15
choose_draw:
	CMPI 1 r8
	BNE draw_blank
draw_start:
	MOVI 205 r1	// Draw closed pacmanRIGHT0
	STOR r1 r10
	MOVI 132 r1	// Store 'S'
	STOR r1 r7
	ADDI -1 r7	
	MOVI 133 r1	// Store 'T'
	STOR r1 r7
	ADDI -1 r7
	MOVI 114 r1	// Store 'A'
	STOR r1 r7
	ADDI -1 r7
	MOVI 131 r1	// Store 'R'
	STOR r1 r7
	ADDI -1 r7
	MOVI 133 r1	// Store 'T'
	STOR r1 r7
	JUC r9 start_loop
	
draw_blank:	
	MOVI 245 r1
	STOR r1 r10
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
	JUC r9 start_loop
	
toggle:
	XORI 1 r8	// toggle rv	
	LUI 255 r4	// reset timer 
	ORI 231 r4
	LUI 2 r5	// really close to 500, maybe 512
	STOR r5 r4
	RETX
	


//checkstart:
	//MOVI 0 r2	// Check 'START'
	//LUI 255 r2
	//ORI 252 r2
	//LOAD r2 r2
	//CMPI 1 r2
	//BEQ game_loop	// if start asserted, start game 
	//RETX
	
//game_loop:
	//LUI 63 r0	// top left most glyph address
	//ORI 255 r0
	//ADDI -106 r0	// offset rows by 4 down
	//ADDI -22 r0	// and 22 columns
	//MOVI 120 r1	// Store 'G'
	//STOR r1 r0
	//ADDI -1 r0
	//STOR r1 r0
	//JUC r9 start_menu