// simulate caller
LUI 51 r1
ORI 246 r1	// current score address
MOVI 0 r5	// set current score to 0
STOR r5 r1
MOVI 50 r12
MOVI 169 r10
//JAL r9 init_score

init_score:

	// find location to write
	LUI 63 r0	// top left most glyph address
	ORI 255 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0	// offset rows by 4 down
	ADDI -22 r0	// and 22 columns
	
	// initialize 5 places to 0
	MOVI 169 r1	// 10,000
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// 1,000
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// 100
	STOR r1 r0
	ADDI -1 r0
	MOVI 169 r1	// 10
	STOR r1 r0
	MOV r0 r11	//[for testing] save glylph address
	ADDI -1 r0
	MOVI 169 r1	// 1
	STOR r1 r0
	ADDI 5 r0
	
	LUI 255 r2	// set timer
	ORI 235 r2
	MOVI 250 r0
	STOR r0 r2
	
	
// tsting function	
check_start:
	LUI 255 r2	//check timer
	ORI 234 r2
	LOAD r2 r2
	CMPI 1 r2
	BEQ update_score
	BUC check_start

update_score: //save score addifier to r12 (50, 100, 1000)
	// used to simulate caller
	LUI 255 r2	//reset timer
	ORI 235 r2
	MOVI 250 r0
	STOR r0 r2
	//
	LUI 51 r3
	ORI 246 r3	// current score address
	LOAD r5 r3	// load current score from memory to increment
	ADD r12 r5	// add addifier to current score 
	STOR r5 r3	// store new score to memory
	CMPI 50 r12	// if r12 is 50, toggle 10's (5/0)
	BEQ toggle_tens

toggle_tens:
	// load glyph and check value
	LUI 63 r4	// top left most glyph address
	ORI 255 r4
	ADDI -106 r4
	ADDI -106 r4
	ADDI -106 r4
	ADDI -106 r4	// offset rows by 4 down
	ADDI -22 r4	// and 22 columns
	ADDI -3 r4	// 10's place
	LOAD r6 r11
	CMP r10 r6
	BEQ load_five
	BUC load_zero

load_five:
	MOVI 174 r8
	STOR r8 r11
	BUC check_start
	
load_zero:
	STOR r10 r11
	BUC check_start
	
