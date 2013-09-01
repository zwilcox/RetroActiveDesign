
init_score:
	// find location to write
	LUI 63 r0	// top left most glyph address
	ORI 255 r0
	ADDI -53 r0
	ADDI -106 r0	// offset rows by 4 down
	ADDI -35 r0	// and 22 columns
	
	// initialize 5 places to 0
	MOVI 169 r1	// 10,000s
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// 1,000s
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// 100s
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// 10s
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// 1s
	STOR r1 r0
	RETX
		
update_score: // increments score by 50
	LUI 51 r3
	ORI 246 r3	// current score address
	LOAD r5 r3	// load current score from memory to increment
	ADDI 50 r5	// add 50 to current score 
	STOR r5 r3	// store new score to memory
	BUC toggle_tens

toggle_tens:
	// find location to write
	LUI 63 r4	// top left most glyph address
	ORI 255 r4
	ADDI -53 r4
	ADDI -106 r4	// offset rows by 4 down
	ADDI -35 r4	// and 22 columns
	ADDI -3 r4	// 10's place
	LOAD r6 r4
	MOVI 169 r2
	CMP r2 r6
	BEQ load_five
	BUC nine_zero

load_five:
	MOVI 174 r8		
	STOR r8 r4	// write 5 to ten's
	RETX
	
nine_zero:
	STOR r10 r4	// write 0 to current location
	ADDI 1 r4	// get next highest location
	LOAD r0 r4
	MOVI 178 r1
	CMP r0 r1
	BEQ nine_zero
	ADDI 1 r0
	STOR r0 r4
	RETX
	
	

	