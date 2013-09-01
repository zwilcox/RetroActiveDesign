//***************************************
//************Start Menu*****************
//***************************************


// A(114) - Z(139)
// !(140)
// 0(169) - 9(178)

start_menu:
// zero out map
	MOV r15 r14
	JAL r9 clear_screen
	MOV r14 r15
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
	BUC flash_start

dead_menu:
// zero out map
	MOV r15 r14
	JAL r9 clear_screen
	MOV r14 r15
	MOVI 0 r8	// zero out r8 for toggle return address
	LUI 63 r0	// top left most glyph address
	ORI 255 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0
	ADDI -106 r0	// offset rows by 4 down
	ADDI -22 r0	// and 22 columns
	MOVI 120 r1	// Store 'G'
	STOR r1 r0
	ADDI -1 r0
	MOVI 114 r1	// Store 'A'
	STOR r1 r0
	ADDI -1 r0
	MOV r0 r10	// save this location to draw closed mouth too
	MOVI 126 r1	// Store 'M'
	STOR r1 r0
	ADDI -1 r0
	MOVI 118 r1	// Store 'E'
	STOR r1 r0
	ADDI -1 r0
	MOVI 0 r1	// Store ' '
	STOR r1 r0
	ADDI -1 r0
	MOV r0 r10	// save this location to draw closed mouth too
	MOVI 245 r1	// Store 'pacman0'
	STOR r1 r0
	ADDI -1 r0
	MOVI 135 r1	// Store 'V'
	STOR r1 r0
	ADDI -1 r0
	MOVI 118 r1	// Store 'E'
	STOR r1 r0	
	ADDI -1 r0
	MOVI 131 r1	// Store 'R'
	STOR r1 r0
	ADDI -1 r0
	MOVI 140 r1	// Store '!'
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
	BUC flash_start
flash_start:
	MOV r0 r7
	//check if start button has been pressed on NES controller
	MOV r15 r14
	JAL r9 checkstart
	MOV r14 r15
	LUI 255 r3	// calculate timer return value address
	ORI 230 r3
	LOAD r3 r3	// load timer rv into r3	
	CMPI 1 r3
	BNE choose_draw 
	MOV r15 r14
	JAL r9 toggle
	MOV r14 r15
choose_draw:	// choose whether to draw 'start' or 'blank'
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
	JUC r9 flash_start
	
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
	JUC r9 flash_start
	
toggle:
	XORI 1 r8	// toggle rv	
	LUI 255 r4	// reset timer 
	ORI 231 r4
	LUI 2 r5	// really close to 500, maybe 512
	STOR r5 r4
	RETX
	


checkstart:
	MOVI 0 r2	// Check 'START'
	LUI 255 r2
	ORI 252 r2
	LOAD r2 r2
	CMPI 1 r2
	JEQ r9 next_screen	// if start asserted, start game 
	RETX
	
clear_screen:
	MOV r2 r10	//save this register
	MOV r3 r11	// save this register
	MOVI 0 r0	// zero-out temp
	LUI 63 r2	// create glyph address
	ORI 255 r2
	LUI 8 r3	// create counter constraint of 2120 (# of glyphs)
	ORI 72 r3	
	MOVI 0 r1	// glyph 0 to be drawn

loop:
	STOR r1 r2	// draw glyph
	ADDI -1 r2	// decrement address pointer
	ADDI 1 r0	//	increment counter
	CMP r0 r3	// check counter <= 2120
	BLT loop

	MOV r10 r2	// else restore the reg's
	MOV r11 r3
	RETX

//*** end start menu**///
next_screen:
JAL r6 initlevel

LUI 255 r0			//make timer reset address
ORI 243 r0
LUI 4 r1			//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0			

//set pacman state to right0
LUI 51 r4 
ORI 145 r4		
MOVI 64 r1
STOR r1 r4

//set pacman initial mouth toggle to 1
LUI 51 r4
ORI 146 r4
MOVI 1 r1
STOR r1 r4

//set pacman mouth toggle timer
LUI 255 r1
ORI	231 r1
MOVI 250 r2
STOR r2 r1 //store 250 ms on timer.								//TIMER SET

//put pacman on initial spot in map
LUI 51 r4 
ORI 144 r4	//store address in r4
LUI 63 r1	# make address for top corner in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -28 r8
ADD r8 r1	# Offset by rows
ADDI -26 r1	# Offset by columns
STOR R1 r4

//Initialize pill remaining counter in gamestate by MOVIng 244 Pills left on board to addr 13301
LUI 51 r4
ORI 245 r4
MOVI 244 r0
STOR r0 r4

//initialize lives left
LUI 51 r4		//lives left addr
ORI 244 r4 		//lives left addr
MOVI 4 r0
STOR r0 r4

JAL r6 drawLivesLeft

mainLoop:
JAL r6 PACMAN_UPDATE_STATE
JAL r6 PACMAN_DRAW_GLYPH
JUC r6 mainLoop

drawLivesLeft:
LUI 63 r1	# make address for writting location in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -37 r8
ADD r8 r1	# Offset by rows
ADDI -14 r1	# Offset by columns
//zero out space where lives drawn
MOVI 0 r0   // number of lives drawn
MOVI 0 r2   // blank glyph
livesClearLoop:
CMPI 5 r0
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

//:::PACMAN STATE MACHINE:::

//register usage: r14 used to save return address of this function.
//registers r0, r1 destroyed as general purpose, r4 used to store state address


// STATES:
// For the '0' states, the state feild will evaluate to 0 if masked with 0x0F (15).
// the ZERO ('0') states are where pacman is centered on a tile.
// In the 0 state pacman will continue MOVIng forward unless the player inputs a direction
// if pacman reaches any state0 and a ghost position is this tile, nextstate is dead1.
//
// 0x10: pacmanUP0  (16)	   --centered on tile, facing up.     nextstate will be up1, unless player input
// 0x20: pacmanDOWN0   (32)	   --centered on tile, facing down.   nextstate is player input direction, else down1
// 0x30: pacmanLEFT0   (48)	   --centered on tile, facing left.   nextstate is player input direction, else left1
// 0x40: pacmanRIGHT0	(64)   --centered on tile, facing right.  nextstate is player input direction, else right1

// The rest of the states are defined with the following pattern
// the number in parenthesis is the decimal value.
//
// 0x11 pacmanUP1 (17)	//nextstate up2, if player inputs down then nextstate down0
// 0x12 pacmanUP2 (18)	//nextstate up3, if player pushes down then nextstate down3
// 0x13 pacmanUP3 (19)  //nextstate up0, if player pushes down then nextstate down2
//
// 0x21 pacmanDOWN1 (33)  //nextstate down2, if player inputs up then nextstate up0
// 0x22 pacmanDOWN2 (34)  //nextstate down3, if player inputs up then nextstate up3
// 0x23 pacmanDOWN3 (35)  //nextstate down0, if player inputs up then nextstate up2
//
// 0x31 pacmanLEFT1 (49)  //nextstate left2, if player inputs right then nextstate right0
// 0x32 pacmanLEFT2 (50)  //nextstate left3, if player inputs right then nextstate right3
// 0x33 pacmanLEFT3 (51)  //nextstate left0, if player inputs right then nextstate right2
//
// 0x41 pacmanRIGHT1 (65) //nextstate right2, if player inputs right then nextstate left0
// 0x42 pacmanRIGHT2 (66) //nextstate right3, if player inputs right then nextstate left3
// 0x43 pacmanRIGHT3 (67) //nextstate right0, if player inputs right then nextstate left2
//
// 0x01 pacmanDEAD1 (1)	//nextstate dead2
// 0x02 pacmanDEAD2 (2)	//nextstate dead3
// 0x03 pacmanDEAD3 (3) //nextstate dead4
// 0x04 pacmanDEAD4 (4) //nextstate pacleft0, reset position, do magic to clear his board tile.



/////THIS FUNCTION UPDATES PACMAN STATEMACHINE BY ONE STEP.
//
//  The first thing it does is check the timer. If the timer is not active, it immediately leaves.
//    Otherwise:
//		check what state pacman is in
//	  	check controller input accordingly,
//	    update state & position variables  
//		reset timer
//		

PACMAN_UPDATE_STATE:

MOV r15 r14 				//store old return adress
LUI 255 r0					//check timer by making address
ORI 242 r0
LOAD r0 r0					//then loading its value and cmp to 1
CMPI 1 r0

JNE r6 endPacmanStateUpdate	//if timer was not active, do not update state.
//							//else, continue on to update pacman state:
//		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::GET CURRENT STATE ADDRESS::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		
//CURRENT STATE state address 13201, store address in r4 
LUI 51 r4 
ORI 145 r4			//store address in r4


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::ZERO STATES::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//  
//  If in a ZERO state:
//  check if on a ghost, if so die.
//  otherwise, check player input in all directions and start MOVIng.
//  if player has made no input selections, keep going in current direction.
//  CHECK IF PACMAN HIT GHOST: (Any ghost position is on pacmans square) 
//  	if hit, set nextstate to dead,
//      jump to reset timer to progress to next state.
//	
//  if position = AnyGhostPosition
//		nextstate = pacmanDEAD1
//		JUC endPacmanState_SetTimer

//Check if in a '0' state:

LOAD r1 r4				//read current state, address in r4
MOV r1 r0				//copy STATE into temp register.
ANDI 15 r0				//mask it by ANDing it with 0xF (15)
CMPI 0 r0   			//if masked value is not zero, check if it is in another state
JNE r6 UpStates 		//by branching to the next comparison, to check if it is an upstate

//check if up/down controls are pushed:
state0_updown:
JAL r6 CheckUP   		//CheckUP is a function that checks if controller up button is pushed
MOV r0 r1				//store the result of checkup in r1
JAL r6 CheckDOWN 		//CheckDOWN is a function that checks if controller down button is pushed
CMP r0 r1				//compare the results of both checkup and checkdown, by comparing r1 and r0
BEQ state0_leftright  	//if controller UP/DOWN are pushed together, input could be left or right
CMPI 1 r0				//Else, check if down was pushed. r0 will be 1 if down was pushed
BEQ pacmanTryMoveDOWN
BUC pacmanTryMoveUP

//check if left/right controls are pushed:
state0_leftright:
JAL r6 CheckRIGHT  		//CheckLEFT is a function that checks if controller up button is pushed
MOV r0 r1				//store the result of checkLEFT in r1
JAL r6 CheckLEFT 		//CheckRIGHT is a function that checks if controller right button is pushed
CMP r0 r1				//compare the results of both checkup and checkdown, by comparing r1 and r0
BEQ state0_NoInput		//if controller LEFT/RIGHT are pushed together and up/down was not processed exclusively, entire dpad pushed	
CMPI 1 r0				//Else, check if RIGHT was pushed. r0 will be 1 if right was pushed
BEQ pacmanTryMoveLEFT
BUC pacmanTryMoveRIGHT

state0_NoInput:
LOAD r1 r4 	//load state	

CMPI 16 r1						//check if in up0 state.
BEQ	pacmanMoveUP					//if not in up0 state, check if in down0 state

CMPI 32 r1						//check if in down0 state.
BEQ	pacmanMoveDOWN					//if not in down0 state, check if in left0 state, else:

CMPI 48 r1						//check if in left0 state.
BEQ pacmanMoveLEFT

CMPI 64 r1						//check if in right0 state.
BEQ pacmanMoveRIGHT				//if not in right0 state, do not update state.
JUC r6 endPacmanState_SetTimer

pacmanMoveUP:
JAL r6 pacman_isWallUP					
CMPI 1 r0						//check if wall is above
JEQ	r6 endPacmanState_SetTimer			//if there is wall, do not update state, reset timer. else:
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set pacman state to up1
JUC r6 endPacmanState_SetTimer

pacmanMoveDOWN:
JAL r6 pacman_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 endPacmanState_SetTimer			//if there is wall, do not update state, reset timer. else:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set pacman state 	
JUC r6 endPacmanState_SetTimer

pacmanMoveLEFT:
JAL r6 pacman_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 endPacmanState_SetTimer			//if there is wall, do not update state, reset timer. else:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set pacman state to left1
JUC r6 endPacmanState_SetTimer

pacmanMoveRIGHT:
JAL r6 pacman_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 endPacmanState_SetTimer			//if there is wall, do not update state, reset timer. else:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT1					// set pacman state 	
JUC r6 endPacmanState_SetTimer

pacmanTryMoveUP:
JAL r6 pacman_isWallUP					
CMPI 1 r0						//check if wall is above
JEQ	r6 state0_NoInput			
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set pacman state to up1
JUC r6 endPacmanState_SetTimer

pacmanTryMoveDOWN:
JAL r6 pacman_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 state0_NoInput			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set pacman state 	
JUC r6 endPacmanState_SetTimer

pacmanTryMoveLEFT:
JAL r6 pacman_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 state0_NoInput			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set pacman state to left1
JUC r6 endPacmanState_SetTimer

pacmanTryMoveRIGHT:
JAL r6 pacman_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 state0_NoInput			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT1					// set pacman state 	
JUC r6 endPacmanState_SetTimer

////:::::::::::::::::::::::End Zero States::::::::::::::::::::::::::

UpStates:

//if we are traveling up and not centered on a tile, we will
//continue to travel up, thus only the down button must be checked.

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanUP1:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

pacmanUP1:
LOAD r1 r4						//read current state, address in r4
CMPI 17	r1						//if state is pacmanUP1						
BNE pacmanUP2	
//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE UP1Cont

//UP1Rev:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN0					// set pacman state 	
//JUC r6 endPacmanState_SetTimer

UP1Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP2					// set pacman state 	
JUC r6 endPacmanState_SetTimer	
	
	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanUP2:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pacmanUP2:	
LOAD r1 r4						//read current state, address in r4
CMPI 18	r1						//if state is pacmanUP2						
BNE pacmanUP3	
//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN3					// set pacman state 
//JUC r6 endPacmanState_SetTimer
LUI 51 r0							//update pacman position by making position address in r0 
ORI 144 r0								
LOAD r1 r0								//then getting it in r1
ADDI 53 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP3					// set pacman state 
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanUP3:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pacmanUP3:
LOAD r1 r4						//read current state, address in r4
CMPI 19	r1						//if state is pacmanUP3						
BNE pacmanDOWN1					//
//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN2					// set pacman state 
//JUC r6 endPacmanState_SetTimer
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP0					// set pacman state 
JUC r6 endPacmanState_SetTimer	

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
DownStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanDOWN1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pacmanDOWN1:
LOAD r1 r4						//read current state, address in r4
CMPI 33	r1						//if state is pacmanDOWN1						
BNE pacmanDOWN2	
//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP0					// set pacman state 	
//JUC r6 endPacmanState_SetTimer
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN2					// set pacman state 	
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanDOWN2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pacmanDOWN2:

LOAD r1 r4						//read current state, address in r4
CMPI 34	r1						//if state is pacmanDOWN2					
BNE pacmanDOWN3	
//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP3					// set pacman state 							//and storing back to position address in r0
//JUC r6 endPacmanState_SetTimer
LUI 51 r0							//update pacman position by making position address in r0 
ORI 144 r0								
LOAD r1 r0								//then getting it in r1
ADDI -53 r1									//adding one
STOR r1 r0	
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN3					// set pacman state 
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanDOWN3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
pacmanDOWN3:
LOAD r1 r4						//read current state, address in r4
CMPI 35	r1						//check  state						
BNE pacmanLEFT1					//
//JAL r6 CheckUP					//check if down control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP2					// set pacman state 
//JUC r6 endPacmanState_SetTimer
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN0					// set pacman state 
JUC r6 endPacmanState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
LeftStates:


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanLEFT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pacmanLEFT1:
LOAD r1 r4						//read current state, address in r4
CMPI 49	r1						//check  state							
BNE pacmanLEFT2	
//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT0					// set pacman state 	
//JUC r6 endPacmanState_SetTimer
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT2					// set pacman state 	
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanLEFT2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pacmanLEFT2:

LOAD r1 r4						//read current state, address in r4
CMPI 50	r1						//check  state						
BNE pacmanLEFT3	
//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT3					// set pacman state 
//JUC r6 endPacmanState_SetTimer
LUI 51 r0							//update pacman position by making position address in r0 
ORI 144 r0								
LOAD r1 r0								//then getting it in r1
ADDI 1 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT3					// set pacman state 
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanLEFT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
pacmanLEFT3:
LOAD r1 r4						//read current state, address in r4
CMPI 51	r1						//check  state							
BNE pacmanRIGHT1					//
//JAL r6 CheckRIGHT					//check if down control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT2					// set pacman state 
//JUC r6 endPacmanState_SetTimer
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT0					// set pacman state 
JUC r6 endPacmanState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RightStates:
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanRIGHT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pacmanRIGHT1:
LOAD r1 r4						//read current state, address in r4
CMPI 65	r1						//check  state							
BNE pacmanRIGHT2	
//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT0					// set pacman state 	
//JUC r6 endPacmanState_SetTimer
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT2					// set pacman state 	
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanRIGHT2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pacmanRIGHT2:

LOAD r1 r4						//read current state, address in r4
CMPI 66	r1						//check  state					
BNE pacmanRIGHT3	
//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT3					// set pacman state 
//JUC r6 endPacmanState_SetTimer
LUI 51 r0							//update pacman position by making position address in r0 
ORI 144 r0								
LOAD r1 r0								//then getting it in r1
ADDI -1 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT3					// set pacman state 
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanRIGHT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
pacmanRIGHT3:
LOAD r1 r4						//read current state, address in r4
CMPI 67	r1						//check  state						
BNE pacmanDEAD1					//
//JAL r6 CheckLEFT					//check if LEFT control is pushed
//CMPI 1 r0
//BNE 4							//if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT2					// set pacman state 
//JUC r6 endPacmanState_SetTimer
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT0					// set pacman state 
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

DeadStates:	

pacmanDEAD1:	
LOAD r1 r4						//read current state, address in r4
CMPI 1	r1						//if state is pacmanDEAD1					
BNE pacmanDEAD2					//
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDEAD2					// set pacman state 
JUC r6 endPacmanState_SetTimer	

pacmanDEAD2:	
LOAD r1 r4						//read current state, address in r4
CMPI 1	r1						//if state is pacmanDEAD1					
BNE pacmanDEAD3					//
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDEAD3					// set pacman state 
JUC r6 endPacmanState_SetTimer	

pacmanDEAD3:	
LOAD r1 r4						//read current state, address in r4
CMPI 1	r1						//if state is pacmanDEAD1					
BNE pacmanDEAD4					//
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDEAD4					// set pacman state 
JUC r6 endPacmanState_SetTimer	
	
pacmanDEAD4:	
									
MOV r4 r0						// //default case, move state address to r0 to prepare for setState call
JAL r6 setStateLEFT0					// set pacman state 
JUC r6 endPacmanState_SetTimer	
LUI 51 r0							//update pacman position by making position address in r0 
ORI 144 r0								
LOAD r1 r0								//then getting it in r1
ADDI 1 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
	
endPacmanState_SetTimer:
LUI 255 r0			//make timer reset address
ORI 243 r0
MOVI 125 r1			//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0			

endPacmanStateUpdate:
MOV r14 r15 		//restore old return adress
RETX 				//return


//CHECK_DIRECTION functions. Use only register r0 and ra for safety. This way when calling these functions,
//only the r0 and ra registers must be preserved first if they are important.

CheckRIGHT:
LUI 255 r0	//make right address in r0
ORI 248 r0		
LOAD r0 r0	//save result back into r0
RETX
	
CheckLEFT:
LUI 255 r0	//make address in r0
ORI 249 r0
LOAD r0 r0	//save result back into r0
RETX		//return

CheckUP:
LUI 255 r0
ORI 251 r0
LOAD r0 r0
RETX

CheckDOWN:
LUI 255 r0
ORI 250 r0
LOAD r0 r0
RETX

pacman_isWallUP:
LUI 51 r0		//make address 13200 where pacman location is stored
ORI 144 r0			
LOAD r0 r0		//save result back into r0
ADDI 53 r0		//increment r0 to get location of square above pacman (53 adress spaces higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

pacman_isWallDOWN:
LUI 51 r0		//make address 13200 where pacman location is stored
ORI 144 r0			
LOAD r0 r0		//save result back into r0
ADDI -53 r0		//increment r0 to get location of square below pacman (53 adress spaces lower in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

pacman_isWallLEFT:
LUI 51 r0		//make address 13200 where pacman location is stored
ORI 144 r0			
LOAD r0 r0		//save result back into r0
ADDI 1 r0		//increment r0 to get location of square left of pacman (1 space higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

pacman_isWallRIGHT:
LUI 51 r0		//make address 13200 where pacman location is stored
ORI 144 r0			
LOAD r0 r0		//save result back into r0
ADDI -1 r0		//increment r0 to get location of square right of pacman (1 space lower in memory)
LOAD r0 r0
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

//::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::SET_STATES::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::Store states to memory::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::
// The following functions assume 'state address' has been moved to r0

//**actorUP**

setStateUP0:
MOVI 16 r1
STOR r1 r0
RETX

setStateUP1:
MOVI 17 r1
STOR r1 r0
RETX

setStateUP2:
MOVI 18 r1
STOR r1 r0
RETX

setStateUP3:
MOVI 19 r1
STOR r1 r0
RETX

//**actorDOWN**

setStateDOWN0:
MOVI 32 r1
STOR r1 r0
RETX

setStateDOWN1:
MOVI 33 r1
STOR r1 r0
RETX

setStateDOWN2:
MOVI 34 r1
STOR r1 r0
RETX

setStateDOWN3:
MOVI 35 r1
STOR r1 r0
RETX

//**actorLEFT**

setStateLEFT0:
MOVI 48 r1
STOR r1 r0
RETX

setStateLEFT1:
MOVI 49 r1
STOR r1 r0
RETX

setStateLEFT2:
MOVI 50 r1
STOR r1 r0
RETX

setStateLEFT3:
MOVI 51 r1
STOR r1 r0
RETX

//**actorRIGHT**

setStateRIGHT0:
MOVI 64 r1
STOR r1 r0
RETX

setStateRIGHT1:
MOVI 65 r1
STOR r1 r0
RETX

setStateRIGHT2:
MOVI 66 r1
STOR r1 r0
RETX

setStateRIGHT3:
MOVI 67 r1
STOR r1 r0
RETX

//**pacmanDEAD**

setStateDEAD1:
MOVI 1 r1
STOR r1 r0
RETX

setStateDEAD2:
MOVI 2 r1
STOR r1 r0
RETX

setStateDEAD3:
MOVI 3 r1
STOR r1 r0
RETX

setStateDEAD4:
MOVI 4 r1
STOR r1 r0
RETX


PACMAN_DRAW_GLYPH:	
//pacman's draw glyph 
//

// if opentimer == 1
// load open timer
// open timer in 65510  

//make of timer address in r1 
LUI 255 r1
ORI	230 r1
LOAD r1 r1 //store result back in r1
//check to see if is 1
CMPI 1 r1
//check condition code
BNE AFTER_MOUTH_TOGGLE
//if timer is 1, invert the mouth condition
//get the value of the mouth condition
//r2 has the mouth condition address
LUI 51 r2
ORI 146 r2
LOAD r4 r2
XORI 1 r4 		//MOUTH POSITION IN r4
//store back in memory
STOR r4 r2
//after toggling, reset timer to toggle again next time it activates:				//added mouth toggle timer reset~!
LUI 255 r1
ORI	231 r1
MOVI 125 r2
STOR r2 r1 //store 250 ms on timer.													//TIMER SET
AFTER_MOUTH_TOGGLE:

				//MOUTH POSITION IN r4											//cleaned up register usage a bit
//MAKE PACMAN 	LOCATION ADDRESS IN r2	
LUI 51 r2 
ORI 144 r2

//MAKE PACMAN STATE ADDRESS IN r3
LUI 51 r3 
ORI 145 r3

//load location of pacman INTO r0
LOAD r0 r2

//CHECK IF STATE UP0
drawUP0:
load r5 r3
CMPI 16 r5
BNE drawUP1	//else check if in state UP1
//check the condition of the mouth

//if open
CMPI 1 R4
BNE CLOSED_STATE_UP0
LUI 1 r1	//load PACMAN_OPEN_UP_0
ORI 8 r1
STOR r1 r0 
ADDI -53 r0	//get location below pacman
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

CLOSED_STATE_UP0:
LUI 0 r1	//load PACMAN_CLOSED_UP_0
ORI 212 r1
STOR r1 r0 
ADDI -53 r0	//get location below pacman
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

//CHECK IF STATE UP1
drawUP1:
LOAD R5 R3
CMPI 17 r5

BNE drawUP2 //else check if in state UP2
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4

BNE CLOSED_STATE_UP1
//GET PACMAN_OPEN_6...GLYPH NUM 270
MOVI 255 r1
ADDI 15 R1	//R1 SHOULD BE 270 NOW
STOR R1 R0	//LOAD GLYPH INTO POSITION
ADDI 53 R0 	// GET POSITION ABOVE PACMAN
//NOW NEED TO LOAD PACMAN_OPEN_UP5
//IT IS GLPYH NUM 269
MOVI 255 R1
ADDI 14 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_UP1:
//LOAD PACMAN_CLOSED_UP6
//IT'S GLYPH 218
MOVI 218 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI 53 R0 // GET POSITION ABOVE PACMAN										//fixed this, was negative, needed positive
//NOW NEED TO LOAD PMANCLOSED_UP_5
//IT'S GLYPH 217
MOVI 217 R1
STOR R1 R0 //LOAD INTO POSITION
RETX



//CHECK IF STATE UP2
drawUP2:
LOAD R5 R3
CMPI 18 r5
BNE drawUP3 //else check if in state UP3

//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_UP2

//GET PMANOPEN_UP_4
//THIS IS GLYPH 268
MOVI 255 r1
ADDI 13 R1	//R1 SHOULD BE 268 NOW
STOR R1 R0	//LOAD INTO POSITION
ADDI 53 R0 // GET POSITION ABOVE PACMAN
//NOW NEED TO LOAD PMANOPEN_Up_3
//ITS IN LOCATION 267
MOVI 255 R1
ADDI 12 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_UP2:
//LOAD PMANCLOSED_Up_4																//are these right?
//IT'S GLYPH 216
MOVI 216 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI 53 R0 // GET POSITION ABOVE PACMAN
//NOW NEED TO LOAD PMANCLOSED_Up_3
//IT'S GLYPH 215
MOVI 215 R1																			///wait what?
STOR R1 R0 //LOAD INTO POSITION
RETX

//CHECK IF STATE UP3
drawUP3:
LOAD R5 R3
CMPI 19 r5
BNE drawDOWN0 //else check if in state drawDOWN0

//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_UP3

//GET PMANOPEN_Up_1
//THIS IS GLYPH 265
MOVI 255 r1
ADDI 10 R1	//R1 SHOULD BE 265 NOW
STOR R1 R0	//LOAD POSITION
ADDI -53 R0 	// GET POSITION BELOW PACMAN
//NOW NEED TO PMANOPEN_Up_2
//ITS IN LOCATION 266
MOVI 255 R1
ADDI 11 R1 //R1 SHOULD BE 266
STOR r1 r0	//STORE POSITION BELOW PACMAN
RETX

CLOSED_STATE_UP3:					
//LOAD PMANCLOSED_Up_1
//IT'S GLYPH 213
MOVI 213 R1																		//wait what?
STOR R1 R0 //LOAD INTO POSITION
ADDI -53 R0 // GET POSITION BELOW PACMAN
//NOW NEED TO LOAD PMANCLOSED_Up_2
//IT'S GLYPH 266
MOVI 255 r1
ADDI 11 r1 //R1 should be 266
STOR r1 r0	//STORE POSITION BELOW PACMAN
RETX


//COPY AND PASTING FROM STATE 1

//CHECK IF STATE DOWN0
drawDOWN0:
LOAD R5 R3
CMPI 32 r5
BNE drawDOWN1	//else check if in state UP1
//check the condition of the mouth

//if open
CMPI 1 R4
BNE CLOSED_STATE_DOWN0
//load PMANOPEN_DOWN_0
//GLYPH 219
MOVI 219 R1
STOR r1 r0 
ADDI 53 r0	//get location ABOVE pacman
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

CLOSED_STATE_DOWN0:
LUI 0 r1	//load PMANCLOSED_DOWN_0
// GLYPH 179
MOVI 179 R1 
STOR r1 r0
ADDI 53 r0	//get location ABOVE pacman
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

//CHECK IF STATE DOWN1
drawDOWN1:
LOAD R5 R3
CMPI 33 r5

BNE drawDOWN2 //else check if in state DOWN2
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4

BNE CLOSED_STATE_DOWN1
//GET PMANOPEN_Down_1...in GLYPH 220
MOVI 220 r1
STOR R1 R0	//LOAD POSITION
ADDI -53 R0 	// GET POSITION BELOW PACMAN
//NOW NEED TO LOAD PMANOPEN_Down_2
//ITS IN LOCATION 221
MOVI 221 R1
STOR r1 r0	//STORE POSITION BELOW PACMAN
RETX

CLOSED_STATE_DOWN1:
//LOAD PMANCLOSED_Down_1
//IT'S GLYPH 180
MOVI 180 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI -53 R0 // GET POSITION BELOW PACMAN
//NOW NEED TO LOAD PMANCLOSED_Down_2
//IT'S GLYPH 181
MOVI 181 R1
STOR R1 R0 //LOAD INTO POSITION
RETX



//CHECK IF STATE DOWN2
drawDOWN2:
LOAD R5 R3
CMPI 34 r5
BNE drawDOWN3 //else check if in state DOWN2
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_DOWN2
//GET PMANOPEN_DOWN_3
//THIS IS GLYPH 222
MOVI 222 r1
STOR R1 R0	//LOAD POSITION
ADDI -53 R0 // GET POSITION BELOW PACMAN
//NOW NEED TO LOAD PMANOPEN_Down_4
//ITS IN LOCATION 223
MOVI 223 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_DOWN2:
//LOAD PMANCLOSED_DOWN_3
//IT'S GLYPH 182
MOVI 182 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI -53 R0 // GET POSITION BELOW PACMAN
//NOW NEED TO LOAD PMANCLOSE_Down_4
//IT'S GLYPH 183
MOVI 183 R1
STOR R1 R0 //LOAD INTO POSITION
RETX

//CHECK IF STATE DOWN3
drawDOWN3:
LOAD R5 R3
CMPI 35 r5
BNE drawLEFT0 //else check if in state drawDOWN0
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_DOWN3
//GET PMANOPEN_Down_6
//THIS IS GLYPH 225
MOVI 225 r1
STOR R1 R0	//LOAD POSITION
ADDI 53 R0 	// GET POSITION ABOVE PACMAN
//NOW NEED TO PMANOPEN_Down_5
//ITS IN LOCATION 224
MOVI 224 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_DOWN3:
//LOAD PMANCLOSED_Down_6
//IT'S GLYPH 185
MOVI 185 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI 53 R0 // GET POSITION ABOVE PACMAN
//NOW NEED TO LOAD PMANOPEN_Down_5 (SAME AS PMANCLOSED)
//IT'S GLYPH 224
MOVI 224 R1																//is this right? i guess its same as pmanclosed?
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX





// COPY AND PASTED FROM DOWN STATES




//CHECK IF STATE LEFT0
drawLEFT0:
LOAD R5 R3
CMPI 48 r5
BNE drawLEFT1	//else check if in state LEFT1
//check the condition of the mouth

//if open
CMPI 1 R4
BNE CLOSED_STATE_LEFT0
//load PMANOPEN_LEFT_0
//GLYPH 226
MOVI 226 R1
STOR r1 r0 
ADDI -1 r0	//get location TO THE RIGHT
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

CLOSED_STATE_LEFT0:
LUI 0 r1	//load PMANCLOSED_LEFT_0
// GLYPH 186
MOVI 186 R1 
STOR r1 r0
ADDI -1 r0	//get location TO THE RIGHT
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

//CHECK IF STATE LEFT1
drawLEFT1:
LOAD R5 R3
CMPI 49 r5

BNE drawLEFT2 //else check if in state LEFT2
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4

BNE CLOSED_STATE_LEFT1
//GET PMANOPEN_Left_6...in GLYPH 232
MOVI 232 r1
STOR R1 R0	//LOAD POSITION
ADDI 1 R0 	// GET POSITION TO THE LEFT OF PACMAN
//NOW NEED TO PMANOPEN_Left_5
//ITS IN LOCATION 231
MOVI 231 R1
STOR r1 r0	//STORE POSITION BELOW PACMAN
RETX

CLOSED_STATE_LEFT1:
//LOAD PMANCLOSED_Left_6
//IT'S GLYPH 192
MOVI 192 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI 1 R0 	// GET POSITION TO THE LEFT OF PACMAN
//NOW NEED TO LOAD PMANCLOSED_Left_5
//IT'S GLYPH 191
MOVI 191 R1
STOR R1 R0 //LOAD INTO POSITION
RETX



//CHECK IF STATE LEFT2
drawLEFT2:
LOAD R5 R3
CMPI 50 r5
BNE drawLEFT3 //else check if in state LEFT2
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_LEFT2
//GET PMANOPEN_Left_4
//THIS IS GLYPH 230
MOVI 230 r1
STOR R1 R0	//LOAD POSITION
ADDI 1 R0 // GET POSITION TO THE LEFT OF PACMAN
//NOW NEED TO LOAD PMANOPEN_Left_3
//ITS IN LOCATION 229
MOVI 229 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_LEFT2:
//LOAD PMANCLOSED_Left_4
//IT'S GLYPH 190
MOVI 190 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI 1 R0 // GET POSITION BELOW PACMAN
//NOW NEED TO LOAD PMANCLOSED_Left_3
//IT'S GLYPH 189
MOVI 189 R1
STOR R1 R0 //LOAD INTO POSITION
RETX

//CHECK IF STATE LEFT3
drawLEFT3:
LOAD R5 R3
CMPI 51 r5
BNE drawRIGHT0 //else check if in state drawRIGHT0
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_LEFT3
//GET PMANOPEN_Left_1
//THIS IS GLYPH 227
MOVI 227 r1
STOR R1 R0	//LOAD POSITION
ADDI -1 R0 	// GET POSITION TO THE RIGHT OF PACMAN
//NOW NEED TO PMANOPEN_Left_2
//ITS IN LOCATION 228
MOVI 228 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_LEFT3:
//LOAD PMANCLOSED_Left_1
//IT'S GLYPH 187
MOVI 187 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI -1 R0 // GET POSITION TO THE RIGHT PACMAN
//NOW NEED TO LOAD PMANCLOSED_Left_2 (SAME AS PMANCLOSED)
//IT'S GLYPH 188
MOVI 188 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX


// COPY AND PASTE FROM LEFT



//CHECK IF STATE RIGHT0
drawRIGHT0:
LOAD R5 R3
CMPI 64 r5
BNE drawRIGHT1	//else check if in state RIGHT1
//check the condition of the mouth

//if open
CMPI 1 R4
BNE CLOSED_STATE_RIGHT0
//load PMANOPEN_RIGHT_0
//GLYPH 245
MOVI 245 R1
STOR r1 r0 
ADDI 1 r0	//get location TO THE LEFT
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

CLOSED_STATE_RIGHT0:
LUI 0 r1	//load PMANCLOSED_RIGHT_0
// GLYPH 205
MOVI 205 R1 
STOR r1 r0
ADDI 1 r0	//get location TO THE LEFT
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX

//CHECK IF STATE RIGHT1
drawRIGHT1:
LOAD R5 R3
CMPI 65 r5

BNE drawRIGHT2 //else check if in state RIGHT2
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4

BNE CLOSED_STATE_RIGHT1
//GET PMANOPEN_Right_1...in GLYPH 246
MOVI 246 r1
STOR R1 R0	//LOAD POSITION
ADDI -1 R0 	// GET POSITION TO THE RIGHT OF PACMAN
//NOW NEED TO PMANOPEN_Right_2
//ITS IN LOCATION 247
MOVI 247 R1
STOR r1 r0	//STORE POSITION BELOW PACMAN
RETX

CLOSED_STATE_RIGHT1:
//LOAD PMANCLOSED_Right_1
//IT'S GLYPH 206
MOVI 206 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI -1 R0 	// GET POSITION TO THE RIGHT OF PACMAN
//NOW NEED TO LOAD PMANCLOSED_Right_2
//IT'S GLYPH 207
MOVI 207 R1
STOR R1 R0 //LOAD INTO POSITION
RETX



//CHECK IF STATE RIGHT2
drawRIGHT2:
LOAD R5 R3
CMPI 66 r5
BNE drawRIGHT3 //else check if in state RIGHT2
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_RIGHT2
//GET PMANOPEN_Right_3
//THIS IS GLYPH 248
MOVI 248 r1
STOR R1 R0	//LOAD POSITION
ADDI -1 R0 // GET POSITION TO THE RIGHT OF PACMAN
//NOW NEED TO LOAD PMANOPEN_Right_4
//ITS IN LOCATION 249
MOVI 249 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_RIGHT2:
//LOAD PMANCLOSED_Right_3
//IT'S GLYPH 208
MOVI 208 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI -1 R0 // GET POSITION TO THE RIGHT PACMAN
//NOW NEED TO LOAD PMANCLOSED_Right_4
//IT'S GLYPH 209
MOVI 209 R1
STOR R1 R0 //LOAD INTO POSITION
RETX

//CHECK IF STATE RIGHT3
drawRIGHT3:
LOAD R5 R3
CMPI 67 r5
BNE drawDEAD1 //else check if in state drawRIGHT0
//CHECK CONDITION OF MOUTH
//IF OPEN
CMPI 1 R4
BNE CLOSED_STATE_RIGHT3
//GET PMANOPEN_Right_6
//THIS IS GLYPH 251
MOVI 251 r1
STOR R1 R0	//LOAD POSITION
ADDI 1 R0 	// GET POSITION TO THE LEFT OF PACMAN
//NOW NEED TO PMANOPEN_Right_5
//ITS IN LOCATION 250
MOVI 250 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_RIGHT3:
//LOAD PMANCLOSED_Right_6
//IT'S GLYPH 211
MOVI 211 R1
STOR R1 R0 //LOAD INTO POSITION
ADDI 1 R0 // GET POSITION TO THE LEFT PACMAN
//NOW NEED TO LOAD PMANCLOSED_Right_5 (SAME AS PMANCLOSED)
//IT'S GLYPH 210
MOVI 210 R1
STOR r1 r0	//STORE POSITION ABOVE PACMAN
RETX

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

drawDEAD1:
ADD r0 r0