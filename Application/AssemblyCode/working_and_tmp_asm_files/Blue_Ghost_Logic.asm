
//:::::::::::::BEGIN BlueGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN BlueGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN BlueGhost STATE MACHINE::::::::::::::::::::::::::


/////THIS FUNCTION UPDATES  STATEMACHINE BY ONE STEP.
//
//  The first thing it does is check the timer. If the timer is not active, it immediately leaves.
//    Otherwise:
//		check what state BlueGhost is in
//	  	check controller input accordingly,
//	    update state & position variables  
//		reset timer
//		

BlueGhost_UPDATE_STATE:

MOV r15 r14 				//store old return adress
LUI 255 r0					//check timer by making address
ORI 236 r0
LOAD r0 r0					//then loading its value and cmp to 1
CMPI 1 r0

JNE r6 endBlueGhostStateUpdate	  //if timer was not active, do not update state.
//								  //else, continue on to update BlueGhost state:
//		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::GET CURRENT STATE ADDRESS::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		
//CURRENT STATE state address 13001, store address in r4 
LUI 50 r4 
ORI 201 r4			//store address in r4


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::ZERO STATES::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//  
//  If in a ZERO state:
//  check if on a ghost, if so die.
//  otherwise, check player input in all directions and start MOVIng.
//  if player has made no input selections, keep going in current direction.
//  CHECK IF BlueGhost HIT GHOST: (Any ghost position is on BlueGhosts square) 
//  	if hit, set nextstate to dead,
//      jump to reset timer to progress to next state.
//	
//  if position = AnyGhostPosition
//		nextstate = BlueGhostDEAD1
//		JUC endBlueGhostState_SetTimer

//Check if in a '0' state:

LOAD r1 r4				//read current state, address in r4
MOV r1 r0				//copy STATE into temp register.
ANDI 15 r0				//mask it by ANDing it with 0xF (15)
CMPI 0 r0   			//if masked value is not zero, check if it is in another state
JNE r6 BGUpStates 		//by branching to the next comparison, to check if it is an upstate

//IN A ZERO STATE:

BG_TryDifferentRandom:

LOAD r1 r4 	//load state	

CMPI 16 r1						//check if in up0 state.
BEQ	BlueGhostMoveUP					//if not in up0 state, check if in down0 state

CMPI 32 r1						//check if in down0 state.
BEQ	BlueGhostMoveDOWN					//if not in down0 state, check if in left0 state, else:

CMPI 48 r1						//check if in left0 state.
BEQ BlueGhostMoveLEFT

CMPI 64 r1						//check if in right0 state.
BEQ BlueGhostMoveRIGHT				//if not in right0 state, do not update state.
JUC r6 endPacmanState_SetTimer

BlueGhostMoveUP:
JAL r6 getRANDOM
CMPI 2 r0
JEQ r6 BlueGhost_tryMoveLEFT
CMPI 3 r0
JEQ r6 BlueGhost_tryMoveRIGHT
JUC r6 BlueGhost_tryMoveUP

BlueGhostMoveDOWN:
JAL r6 getRANDOM
CMPI 3 r0
JEQ r6 BlueGhost_tryMoveRIGHT
CMPI 2 r0
JEQ r6 BlueGhost_tryMoveLEFT
JUC r6 BlueGhost_tryMoveDOWN


BlueGhostMoveLEFT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 BlueGhost_tryMoveUP
CMPI 1 r0
JEQ r6 BlueGhost_tryMoveDOWN
JUC r6 BlueGhost_tryMoveLEFT


BlueGhostMoveRIGHT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 BlueGhost_tryMoveUP
CMPI 1 r0
JEQ r6 BlueGhost_tryMoveDOWN
JUC r6 BlueGhost_tryMoveRIGHT

BlueGhost_TryMoveUP:
JAL r6 BlueGhost_isWallUP					
CMPI 1 r0						//check if wall is above
JEQ	r6 BG_TryDifferentRandom		
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set blue ghost state to up1
JUC r6 endBlueGhostState_SetTimer

BlueGhost_TryMoveDOWN:
JAL r6 BlueGhost_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 BG_TryDifferentRandom			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set blue ghost state 	
JUC r6 endBlueGhostState_SetTimer

BlueGhost_TryMoveLEFT:
JAL r6 BlueGhost_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 BG_TryDifferentRandom			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set blue ghost state to left1
JUC r6 endBlueGhostState_SetTimer

BlueGhost_TryMoveRIGHT:
JAL r6 BlueGhost_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 BG_TryDifferentRandom			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT1					// set blue ghost state 	
JUC r6 endBlueGhostState_SetTimer

////:::::::::::::::::::::::End Zero States::::::::::::::::::::::::::

BGUpStates:

//if we are traveling up and not centered on a tile, we will
//continue to travel up, thus only the down button must be checked.

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostUP1:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

BlueGhostUP1:
LOAD r1 r4						//read current state, address in r4
CMPI 17	r1						//if state is BlueGhostUP1		
				
BNE BlueGhostUP2	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE BGUP1Cont

//UP1Rev:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN0					// set BlueGhost state 	
//JUC r6 endBlueGhostState_SetTimer

BGUP1Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP2					// set BlueGhost state 	
JUC r6 endBlueGhostState_SetTimer	
	
	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostUP2:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

BlueGhostUP2:	
LOAD r1 r4						//read current state, address in r4
CMPI 18	r1						//if state is BlueGhostUP2						
BNE BlueGhostUP3	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE BGUP2Cont
								////if button isnt pushed, skip to up2cont otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN3					// set BlueGhost state 
//JUC r6 endBlueGhostState_SetTimer

BGUP2Cont:
LUI 50 r0							//update BlueGhost position by making position address in r0 
ORI 200 r0
LOAD r1 r0								//then getting it in r1
ADDI 53 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP3					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostUP3:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

BlueGhostUP3:
LOAD r1 r4						//read current state, address in r4
CMPI 19	r1						//if state is BlueGhostUP3						
BNE BlueGhostDOWN1		
			
//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE BGUP3Cont
								////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN2					// set BlueGhost state 
//JUC r6 endBlueGhostState_SetTimer

BGUP3Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP0					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
BGDownStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostDOWN1:::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
BlueGhostDOWN1:
LOAD r1 r4						//read current state, address in r4
CMPI 33	r1						//if state is BlueGhostDOWN1						
BNE BlueGhostDOWN2	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE BGD1C		
					////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP0					// set BlueGhost state 	
//JUC r6 endBlueGhostState_SetTimer

BGD1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN2					// set BlueGhost state 	
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostDOWN2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
BlueGhostDOWN2:

LOAD r1 r4						//read current state, address in r4
CMPI 34	r1						//if state is BlueGhostDOWN2					
BNE BlueGhostDOWN3	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE BGD2C							
								////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP3					// set BlueGhost state 							//and storing back to position address in r0
//JUC r6 endBlueGhostState_SetTimer

BGD2C:
LUI 50 r0							//update BlueGhost position by making position address in r0 							
ORI 200 r0
LOAD r1 r0								//then getting it in r1
ADDI -53 r1									//adding one
STOR r1 r0	
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN3					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostDOWN3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
BlueGhostDOWN3:
LOAD r1 r4						//read current state, address in r4
CMPI 35	r1						//check  state						
BNE BlueGhostLEFT1					//

//JAL r6 CheckUP					//check if down control is pushed
//CMPI 1 r0
//BNE BGD3C
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP2					// set BlueGhost state 
//JUC r6 endBlueGhostState_SetTimer

BGD3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN0					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
BGLeftStates:


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostLEFT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
BlueGhostLEFT1:
LOAD r1 r4						//read current state, address in r4
CMPI 49	r1						//check  state							
BNE BlueGhostLEFT2	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE BGL1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT0					// set BlueGhost state 	
//JUC r6 endBlueGhostState_SetTimer

BGL1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT2					// set BlueGhost state 	
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostLEFT2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
BlueGhostLEFT2:

LOAD r1 r4						//read current state, address in r4
CMPI 50	r1						//check  state						
BNE BlueGhostLEFT3	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE BGL2C							
									////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT3					// set BlueGhost state 
//JUC r6 endBlueGhostState_SetTimer

BGL2C:
LUI 50 r0							//update BlueGhost position by making position address in r0 			
Ori 200 r0
LOAD r1 r0								//then getting it in r1
ADDI 1 r1									//adding one
JAL r6 SetPosition_WarpLeftSide					//setting it to either its position or the 'warp' position.
STOR r1 r0								//and storing back to position address in r0

MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT3					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostLEFT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
BlueGhostLEFT3:
LOAD r1 r4						//read current state, address in r4
CMPI 51	r1						//check  state							
BNE BlueGhostRIGHT1					//

//JAL r6 CheckRIGHT					//check if down control is pushed
//CMPI 1 r0
//BNE BGL3C		
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT2					// set BlueGhost state 
//JUC r6 endBlueGhostState_SetTimer

BGL3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT0					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

BGRightStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostRIGHT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
BlueGhostRIGHT1:
LOAD r1 r4						//read current state, address in r4
CMPI 65	r1						//check  state							
BNE BlueGhostRIGHT2

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE BGR1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT0					// set BlueGhost state 	
//JUC r6 endBlueGhostState_SetTimer

BGR1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT2					// set BlueGhost state 	
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostRIGHT2::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

BlueGhostRIGHT2:

LOAD r1 r4						//read current state, address in r4
CMPI 66	r1						//check  state					
BNE BlueGhostRIGHT3	

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE BGR2C							//if button isnt pushed, skip down 9 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT3					// set BlueGhost state 
//JUC r6 endBlueGhostState_SetTimer

BGR2C:
LUI 50 r0							//update BlueGhost position by making position address in r0 
ORI 200 r0
LOAD r1 r0								//then getting it in r1
ADDI -1 r1									//adding one
JAL r6 SetPosition_WarpRightSide			//set position to warped side or current position.
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT3					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::BlueGhostRIGHT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
BlueGhostRIGHT3:
LOAD r1 r4						//read current state, address in r4
CMPI 67	r1						//check  state						
BNE endBlueGhostState_SetTimer //

//JAL r6 CheckLEFT					//check if LEFT control is pushed
//CMPI 1 r0
//BNE BGR3C							
									////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT2					// set BlueGhost state 
//JUC r6 endBlueGhostState_SetTimer

BGR3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT0					// set BlueGhost state 
JUC r6 endBlueGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

endBlueGhostState_SetTimer:
LUI 255 r0			//make timer reset address
ORI 237 r0
MOVI 80 r1			//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0			

endBlueGhostStateUpdate:
MOV r14 r15 		//restore old return adress
RETX 				//return

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::BlueGhostDraw GLYPH:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

BlueGhost_Draw_GLYPH:	
//BlueGhost's BlueGhostDraw glyph 

//check if not edible
//	if not edible BlueGhostDraw normal
//	if edible check flash state:
//		if blue: BlueGhostDraw blue ghost
//		if lblue: BlueGhostDraw lblue ghost

//MAKE BlueGhost 	LOCATION ADDRESS IN r2	
LUI 50 r2 
ORI 200 r2

//MAKE BlueGhost STATE ADDRESS IN r3
LUI 50 r3 
ORI 201 r3

//load location of BlueGhost INTO r0
LOAD r0 r2

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE UP 0:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE UP0
BlueGhostDrawUP0:
load r5 r3
CMPI 16 r5
BNE BlueGhostDrawUP1	//else check if in state UP1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_UP0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_UP0
BUC BG_Eat1_UP0

BG_Normal_UP0:
MOV r0 r1
MOVI 22 r0		//BGHOST_UP_0
STOR r0 r1 
ADDI -53 r1	    //get location below BlueGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

BG_Eat0_UP0:
MOV r0 r1
MOVI 51 r0 		//E1GHOST_UP_0
STOR r0 r1 
ADDI -53 r1		//get location below
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

BG_Eat1_UP0:
MOV r0 r1
MOVI 79 r0		//E2GHOST_UP0
STOR r0 r1 
ADDI -53 r1		//get location below 
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE UP 1:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

//CHECK IF STATE UP1
BlueGhostDrawUP1:
LOAD R5 R3
CMPI 17 r5
BNE BlueGhostDrawUP2 //else check if in state UP2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_UP1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_UP1
BUC BG_Eat1_UP1

BG_Normal_UP1:
MOV r0 r1
MOVI 28 r0		//GHOST_UP_6
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 27 r0		//GHOST_UP_5
STOR r0 r1		
RETX

BG_Eat0_Up1:
MOVI 57 R1		//E1GHOST_UP_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 56 R1		//E1GHOST_UP_5
STOR R1 R0 		
RETX

BG_Eat1_Up1:
MOVI 85 R1		//E2GHOST_UP6
STOR R1 R0 
ADDI 53 R0 				
MOVI 84 R1		//E2GHOST_UP5
STOR R1 R0 //LOAD INTO POSITION
RETX


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE UP 2:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE UP2
BlueGhostDrawUP2:
LOAD R5 R3
CMPI 18 r5
BNE BlueGhostDrawUP3 //else check if in state UP3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_UP2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_UP2
BUC BG_Eat1_UP2

BG_Normal_UP2:
MOV r0 r1
MOVI 26 r0		//GHOST_UP_4
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 25 r0		//GHOST_UP_3
STOR r0 r1		
RETX

BG_Eat0_Up2:
MOVI 55 R1		//E1GHOST_UP_4
STOR R1 R0 		
ADDI 53 R0 		
MOVI 54 R1		//E1GHOST_UP_3
STOR R1 R0 		
RETX

BG_Eat1_Up2:
MOVI 83 R1		//E2GHOST_UP_4
STOR R1 R0 
ADDI 53 R0 				
MOVI 82 R1		//E2GHOST_UP_3
STOR R1 R0 //LOAD INTO POSITION
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE UP 3:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE UP3
BlueGhostDrawUP3:
LOAD R5 R3
CMPI 19 r5
BNE BlueGhostDrawDOWN0 //else check if in state BlueGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_UP3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_UP3
BUC BG_Eat1_UP3

BG_Normal_UP3:
MOV r0 r1
MOVI 23 r0		//GHOST_UP_1
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 24 r0		//GHOST_UP_2
STOR r0 r1		
RETX

BG_Eat0_Up3:
MOVI 52 R1		//E1GHOST_UP_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 53 R1		//E1GHOST_UP_2
STOR R1 R0 		
RETX

BG_Eat1_Up3:
MOVI 80 R1		//E2GHOST_UP_1
STOR R1 R0 
ADDI -53 R0 				
MOVI 81 R1		//E2GHOST_UP_2
STOR R1 R0 //LOAD INTO POSITION
RETX

//COPY AND PASTE FROM UP STATES!!

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE DOWN 0:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE DOWN0
BlueGhostDrawDOWN0:
load r5 r3
CMPI 32 r5
BNE BlueGhostDrawDOWN1	//else check if in state DOWN1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_DOWN0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_DOWN0
BUC BG_Eat1_DOWN0

BG_Normal_DOWN0:
MOV r0 r1
MOVI 1 r0		//BGHOST_DOWN_0
STOR r0 r1 
ADDI 53 r1	    //get location above BlueGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

BG_Eat0_DOWN0:
MOV r0 r1
MOVI 30 r0 		//E1GHOST_DOWN_0
STOR r0 r1 
ADDI 53 r1		//get location above
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

BG_Eat1_DOWN0:
MOV r0 r1
MOVI 58 r0		//E2GHOST_DOWN_0
STOR r0 r1 
ADDI 53 r1		//get location above
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE DOWN 1:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

//CHECK IF STATE DOWN1
BlueGhostDrawDOWN1:
LOAD R5 R3
CMPI 33 r5
BNE BlueGhostDrawDOWN2 //else check if in state DOWN2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_DOWN1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_DOWN1
BUC BG_Eat1_DOWN1

BG_Normal_DOWN1:
MOV r0 r1
MOVI 2 r0		//GHOST_DOWN_1
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 3 r0		//GHOST_DOWN_2
STOR r0 r1		
RETX

BG_Eat0_DOWN1:
MOVI 31 R1		//E1GHOST_DOWN_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 32 R1		//E1GHOST_DOWN_2
STOR R1 R0 		
RETX

BG_Eat1_DOWN1:
MOVI 59 R1		//E2GHOST_DOWN_1
STOR R1 R0 
ADDI -53 R0 				
MOVI 60 R1		//E2GHOST_DOWN_2
STOR R1 R0 		//LOAD INTO POSITION
RETX


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE DOWN 2:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE DOWN2
BlueGhostDrawDOWN2:
LOAD R5 R3
CMPI 34 r5
BNE BlueGhostDrawDOWN3 //else check if in state DOWN3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_DOWN2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_DOWN2
BUC BG_Eat1_DOWN2

BG_Normal_DOWN2:
MOV r0 r1
MOVI 4 r0		//GHOST_DOWN_3
STOR R0 R1	
ADDI -53 R1     //get location below
MOVI 5 r0		//GHOST_DOWN_4
STOR r0 r1		
RETX

BG_Eat0_DOWN2:
MOVI 33 R1		//E1GHOST_DOWN_3
STOR R1 R0 		
ADDI -53 R0 		
MOVI 34 R1		//E1GHOST_DOWN_4
STOR R1 R0 		
RETX

BG_Eat1_DOWN2:
MOVI 61 R1		//E2GHOST_DOWN_3
STOR R1 R0 
ADDI -53 R0 				
MOVI 62 R1		//E2GHOST_DOWN_4
STOR R1 R0 		//LOAD INTO POSITION
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE DOWN 3:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE DOWN3
BlueGhostDrawDOWN3:
LOAD R5 R3
CMPI 35 r5
BNE BlueGhostDrawLEFT0 //else check if in state BlueGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_DOWN3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_DOWN3
BUC BG_Eat1_DOWN3

BG_Normal_DOWN3:
MOV r0 r1
MOVI 7 r0		//GHOST_DOWN_6
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 6 r0		//GHOST_DOWN_5
STOR r0 r1		
RETX

BG_Eat0_DOWN3:
MOVI 64 R1		//E1GHOST_DOWN_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 63 R1		//E1GHOST_DOWN_5
STOR R1 R0 		
RETX

BG_Eat1_DOWN3:
MOVI 81 R1		//E2GHOST_DOWN_6
STOR R1 R0 
ADDI 53 R0 				
MOVI 80 R1		//E2GHOST_DOWN_5
STOR R1 R0 //LOAD INTO POSITION
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE LEFT 0:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE LEFT0
BlueGhostDrawLEFT0:
load r5 r3
CMPI 48 r5
BNE BlueGhostDrawLEFT1	//else check if in state LEFT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_LEFT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_LEFT0
BUC BG_Eat1_LEFT0

BG_Normal_LEFT0:
MOV r0 r1
MOVI 8 r0		//BGHOST_LEFT_0
STOR r0 r1 
ADDI -1 r1	    //get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

BG_Eat0_LEFT0:
MOV r0 r1
MOVI 37 r0 		//E1GHOST_LEFT_0
STOR r0 r1 
ADDI -1 r1		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

BG_Eat1_LEFT0:
MOV r0 r1
MOVI 65 r0		//E2GHOST_LEFT0
STOR r0 r1 
ADDI -1 r1		//get location right 
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE LEFT 1:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

//CHECK IF STATE LEFT1
BlueGhostDrawLEFT1:
LOAD R5 R3
CMPI 49 r5
BNE BlueGhostDrawLEFT2 //else check if in state LEFT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_LEFT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_LEFT1
BUC BG_Eat1_LEFT1

BG_Normal_LEFT1:
MOV r0 r1
MOVI 14 r0		//GHOST_LEFT_6
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 13 r0		//GHOST_LEFT_5
STOR r0 r1		
RETX

BG_Eat0_LEFT1:
MOV r0 r1
MOVI 43 R0		//E1GHOST_LEFT_6
STOR R0 R1 		
ADDI 1 R1 		
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 42 R0		//E1GHOST_LEFT_5
STOR R0 R1 		
RETX

BG_Eat1_LEFT1:
MOV r0 r1
MOVI 71 R0		//E2GHOST_LEFT_6
STOR R0 R1 
ADDI 1 R1 				
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 70 R0		//E2GHOST_LEFT_5
STOR R0 R1 //LOAD INTO POSITION
RETX


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE LEFT 2:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE LEFT2
BlueGhostDrawLEFT2:
LOAD R5 R3
CMPI 50 r5
BNE BlueGhostDrawLEFT3 //else check if in state LEFT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_LEFT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_LEFT2
BUC BG_Eat1_LEFT2

BG_Normal_LEFT2:
MOV r0 r1
MOVI 12 r0		//GHOST_LEFT_4
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 11 r0		//GHOST_LEFT_3
STOR r0 r1		
RETX

BG_Eat0_LEFT2:
MOV r0 r1
MOVI 41 R0		//E1GHOST_LEFT_4
STOR R0 R1 		
ADDI 1 R1 		
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 40 R0		//E1GHOST_LEFT_3
STOR R0 R1 		
RETX

BG_Eat1_LEFT2:
MOV r0 r1
MOVI 69 R0		//E2GHOST_LEFT_4
STOR R0 R1 
ADDI 1 R1 				
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 68 R0		//E2GHOST_LEFT_3
STOR R0 R1 		//LOAD INTO POSITION
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE LEFT 3:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE LEFT3
BlueGhostDrawLEFT3:
LOAD R5 R3
CMPI 51 r5
BNE BlueGhostDrawRIGHT0 //else check if in state BlueGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_LEFT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_LEFT3
BUC BG_Eat1_LEFT3

BG_Normal_LEFT3:
MOV r0 r1
MOVI 9 r0		//GHOST_LEFT_1
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 10 r0		//GHOST_LEFT_2
STOR r0 r1		
RETX

BG_Eat0_LEFT3:
MOV r0 r1
MOVI 38 R0		//E1GHOST_LEFT_1
STOR R0 R1 		
ADDI -1 R1 		
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 39 R0		//E1GHOST_LEFT_2
STOR R0 R1 		
RETX

BG_Eat1_LEFT3:
MOV r0 r1
MOVI 66 R0		//E2GHOST_LEFT_1
STOR R0 R1 
ADDI -1 R1 				
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 67 R0		//E2GHOST_LEFT_2
STOR R0 R1 		//LOAD INTO POSITION
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE RIGHT 0:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE RIGHT0
BlueGhostDrawRIGHT0:
load r5 r3
CMPI 64 r5
BNE BlueGhostDrawRIGHT1	//else check if in state RIGHT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_RIGHT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_RIGHT0
BUC BG_Eat1_RIGHT0

BG_Normal_RIGHT0:
MOV r0 r1
MOVI 15 r0		//BGHOST_RIGHT_0
STOR r0 r1 
ADDI 1 r1	    //get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

BG_Eat0_RIGHT0:
MOV r0 r1
MOVI 44 r0 		//E1GHOST_RIGHT_0
STOR r0 r1 
ADDI 1 r1		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

BG_Eat1_RIGHT0:
MOV r0 r1
MOVI 72 r0		//E2GHOST_RIGHT_0
STOR r0 r1 
ADDI 1 r1		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE RIGHT 1:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

//CHECK IF STATE RIGHT1
BlueGhostDrawRIGHT1:
LOAD R5 R3
CMPI 65 r5
BNE BlueGhostDrawRIGHT2 //else check if in state RIGHT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_RIGHT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_RIGHT1
BUC BG_Eat1_RIGHT1

BG_Normal_RIGHT1:
MOV r0 r1
MOVI 16 r0		//GHOST_RIGHT_1
STOR R0 R1	
ADDI -1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 17 r0		//GHOST_RIGHT_2
STOR r0 r1		
RETX

BG_Eat0_RIGHT1:
MOV r0 r1
MOVI 45 R0		//E1GHOST_RIGHT_1
STOR R0 R1 		
ADDI -1 R1 		
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 46 R0		//E1GHOST_RIGHT_2
STOR R0 R1 		
RETX

BG_Eat1_RIGHT1:
MOV r0 r1
MOVI 73 R0		//E2GHOST_RIGHT_1
STOR R0 R1 
ADDI -1 R1 				
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 74 R0		//E2GHOST_RIGHT_2
STOR R0 R1 //LOAD INTO POSITION
RETX


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE RIGHT 2:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE RIGHT2
BlueGhostDrawRIGHT2:
LOAD R5 R3
CMPI 66 r5
BNE BlueGhostDrawRIGHT3 //else check if in state RIGHT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_RIGHT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_RIGHT2
BUC BG_Eat1_RIGHT2

BG_Normal_RIGHT2:
MOV r0 r1
MOVI 18 r0		//GHOST_RIGHT_3
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 19 r0		//GHOST_RIGHT_4
STOR r0 r1		
RETX

BG_Eat0_RIGHT2:
MOV r0 r1
MOVI 47 R0		//E1GHOST_RIGHT_3
STOR R0 R1 		
ADDI -1 R1 		
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 48 R0		//E1GHOST_RIGHT_4
STOR R0 R1 		
RETX

BG_Eat1_RIGHT2:
MOV r0 r1
MOVI 75 R0		//E2GHOST_RIGHT_3
STOR R0 R1 
ADDI -1 R1 				
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 76 R0		//E2GHOST_RIGHT_4
STOR R0 R1 		//LOAD INTO POSITION
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE RIGHT 3:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE RIGHT3
BlueGhostDrawRIGHT3:
LOAD R5 R3
CMPI 67 r5
BEQ BG_Right3 //else return if not in a state...
RETX

BG_Right3:
//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ BG_Normal_RIGHT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ BG_Eat0_RIGHT3
BUC BG_Eat1_RIGHT3

BG_Normal_RIGHT3:
MOV r0 r1
MOVI 21 r0		//GHOST_RIGHT_6
STOR R0 R1	
ADDI 1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 20 r0		//GHOST_RIGHT_5
STOR r0 r1		
RETX

BG_Eat0_RIGHT3:
MOV r0 r1
MOVI 50 R0		//E1GHOST_RIGHT_6
STOR R0 R1 		
ADDI 1 R1 		
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 49 R0		//E1GHOST_RIGHT_5
STOR R0 R1 		
RETX

BG_Eat1_RIGHT3:
MOV r0 r1
MOVI 78 R0		//E2GHOST_RIGHT_6
STOR R0 R1 
ADDI 1 R1 				
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 77 R0		//E2GHOST_RIGHT_5
STOR R0 R1 		//LOAD INTO POSITION
RETX

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::END BlueGhostDraw GLYPH:::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

INIT_BlueGhost:
	LUI 255 r0			//make timer reset address
	ORI 237 r0
	LUI 8 r1			//set 512+256 miliseconds on timer			//TIMER SET
	STOR r1 r0			

	//set BlueGhost state to left0
	LUI 50 r4
	ORI 201 r4
	MOVI 16 r1
	STOR r1 r4

	//put BlueGhost on initial spot in map
	LUI 50 r4
	ORI 200 r4
	LUI 63 r1	# make address for top corner in frame buffer
	ORI 255 r1
	MOVI 53 r8
	MULI -19 r8
	ADD r8 r1	# Offset by rows
	ADDI -26 r1	# Offset by columns
	STOR R1 r4

RETX

BlueGhost_isWallUP:
LUI 50 r0		//make address 13000 where BlueGhost location is stored		
ORI 200 r0
LOAD r0 r0		//save result back into r0
ADDI 53 r0		//increment r0 to get location of square above BlueGhost (53 adress spaces higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

BlueGhost_isWallDOWN:
LUI 50 r0		//blue ghost location
ORI 200 r0
LOAD r0 r0		//save result back into r0
ADDI -53 r0		//increment r0 to get location of square below BlueGhost (53 adress spaces lower in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

BlueGhost_isWallLEFT:
LUI 50 r0		//make address 13000 where BlueGhost location is stored
ORI 200 r0
LOAD r0 r0		//save result back into r0
ADDI 1 r0		//increment r0 to get location of square left of BlueGhost (1 space higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

BlueGhost_isWallRIGHT:
LUI 50 r0		//make address 13000 where BlueGhost location is stored
ORI 200 r0
LOAD r0 r0		//save result back into r0
ADDI -1 r0		//increment r0 to get location of square right of BlueGhost (1 space lower in memory)
LOAD r0 r0
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

	
///::::::::::::::::::END BlueGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END BlueGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END BlueGhost STATE MACHINE::::::::::::::::::::::