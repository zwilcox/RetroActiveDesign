
//:::::::::::::BEGIN RedGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN RedGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN RedGhost STATE MACHINE::::::::::::::::::::::::::


/////THIS FUNCTION UPDATES  STATEMACHINE BY ONE STEP.
//
//  The first thing it does is check the timer. If the timer is not active, it immediately leaves.
//    Otherwise:
//		check what state RedGhost is in
//	  	check controller input accordingly,
//	    update state & position variables  
//		reset timer
//		

RedGhost_UPDATE_STATE:

MOV r15 r14 				//store old return adress
LUI 255 r0					//check timer by making address
ORI 234 r0
LOAD r0 r0					//then loading its value and cmp to 1
CMPI 1 r0

JNE r6 endRedGhostStateUpdate	  //if timer was not active, do not update state.
//								  //else, continue on to update RedGhost state:
//		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::GET CURRENT STATE ADDRESS::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		
//CURRENT STATE state address 13101, store address in r4 
LUI 51 r4 
ORI 45 r4			//store address in r4


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::ZERO STATES::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//  
//  If in a ZERO state:
//  check if on a ghost, if so die.
//  otherwise, check player input in all directions and start MOVIng.
//  if player has made no input selections, keep going in current direction.
//  CHECK IF RedGhost HIT GHOST: (Any ghost position is on RedGhosts square) 
//  	if hit, set nextstate to dead,
//      jump to reset timer to progress to next state.
//	
//  if position = AnyGhostPosition
//		nextstate = RedGhostDEAD1
//		JUC endRedGhostState_SetTimer

//Check if in a '0' state:

LOAD r1 r4				//read current state, address in r4
MOV r1 r0				//copy STATE into temp register.
ANDI 15 r0				//mask it by ANDing it with 0xF (15)
CMPI 0 r0   			//if masked value is not zero, check if it is in another state
JNE r6 RGUpStates 		//by branching to the next comparison, to check if it is an upstate

//IN A ZERO STATE:

LUI 63 r1	# make address for top corner in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -18 r8
ADD r8 r1	# Offset by rows
ADDI -26 r1	# Offset by columns
LUI 50 r0
LOAD r0 r0
CMP r0 r1
BEQ RedGhost_TryMoveUP

ADDI -1 r1
CMP r0 r1
BEQ RedGhost_TryMoveUP

ADDI -53 r1
ADDI -1 r1
CMP r0 r1
BEQ RedGhost_TryMoveLEFT

ADDI 1 r1
CMP r0 r1
BEQ RedGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ RedGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ RedGhost_TryMoveRIGHT


RG_TryDifferentRandom:

LOAD r1 r4 	//load state	

CMPI 16 r1						//check if in up0 state.
BEQ	RedGhostMoveUP					//if not in up0 state, check if in down0 state

CMPI 32 r1						//check if in down0 state.
BEQ	RedGhostMoveDOWN					//if not in down0 state, check if in left0 state, else:

CMPI 48 r1						//check if in left0 state.
BEQ RedGhostMoveLEFT

CMPI 64 r1						//check if in right0 state.
BEQ RedGhostMoveRIGHT				//if not in right0 state, do not update state.
JUC r6 endRedGhostState_SetTimer

RedGhostMoveUP:
JAL r6 getRANDOM
CMPI 2 r0
JEQ r6 RedGhost_tryMoveLEFT
CMPI 3 r0
JEQ r6 RedGhost_tryMoveRIGHT
JUC r6 RedGhost_tryMoveUP

RedGhostMoveDOWN:
JAL r6 getRANDOM
CMPI 3 r0
JEQ r6 RedGhost_tryMoveRIGHT
CMPI 2 r0
JEQ r6 RedGhost_tryMoveLEFT
JUC r6 RedGhost_tryMoveDOWN


RedGhostMoveLEFT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 RedGhost_tryMoveUP
CMPI 1 r0
JEQ r6 RedGhost_tryMoveDOWN
JUC r6 RedGhost_tryMoveLEFT


RedGhostMoveRIGHT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 RedGhost_tryMoveUP
CMPI 1 r0
JEQ r6 RedGhost_tryMoveDOWN
JUC r6 RedGhost_tryMoveRIGHT

RedGhost_TryMoveUP:
JAL r6 RedGhost_isWallUP					
CMPI 1 r0						//check if wall is above
JEQ	r6 RG_TryDifferentRandom		
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set red ghost state to up1
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveDOWN:
JAL r6 RedGhost_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 RG_TryDifferentRandom			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set red ghost state 	
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveLEFT:
JAL r6 RedGhost_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 RG_TryDifferentRandom			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set red ghost state to left1
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveRIGHT:
JAL r6 RedGhost_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 RG_TryDifferentRandom			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT1					// set red ghost state 	
JUC r6 endRedGhostState_SetTimer

////:::::::::::::::::::::::End Zero States::::::::::::::::::::::::::

RGUpStates:

//if we are traveling up and not centered on a tile, we will
//continue to travel up, thus only the down button must be checked.

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostUP1:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

RedGhostUP1:
LOAD r1 r4						//read current state, address in r4
CMPI 17	r1						//if state is RedGhostUP1		
				
BNE RedGhostUP2	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE RGUP1Cont

//UP1Rev:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN0					// set RedGhost state 	
//JUC r6 endRedGhostState_SetTimer

RGUP1Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP2					// set RedGhost state 	
JUC r6 endRedGhostState_SetTimer	
	
	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostUP2:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RedGhostUP2:	
LOAD r1 r4						//read current state, address in r4
CMPI 18	r1						//if state is RedGhostUP2						
BNE RedGhostUP3	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE RGUP2Cont
								////if button isnt pushed, skip to up2cont otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN3					// set RedGhost state 
//JUC r6 endRedGhostState_SetTimer

RGUP2Cont:
LUI 51 r0							//update RedGhost position by making position address in r0 
ORI 44 r0
LOAD r1 r0								//then getting it in r1
ADDI 53 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP3					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostUP3:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RedGhostUP3:
LOAD r1 r4						//read current state, address in r4
CMPI 19	r1						//if state is RedGhostUP3						
BNE RedGhostDOWN1		
			
//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE RGUP3Cont
								////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN2					// set RedGhost state 
//JUC r6 endRedGhostState_SetTimer

RGUP3Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP0					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
RGDownStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostDOWN1:::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
RedGhostDOWN1:
LOAD r1 r4						//read current state, address in r4
CMPI 33	r1						//if state is RedGhostDOWN1						
BNE RedGhostDOWN2	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE RGD1C		
					////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP0					// set RedGhost state 	
//JUC r6 endRedGhostState_SetTimer

RGD1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN2					// set RedGhost state 	
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostDOWN2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
RedGhostDOWN2:

LOAD r1 r4						//read current state, address in r4
CMPI 34	r1						//if state is RedGhostDOWN2					
BNE RedGhostDOWN3	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE RGD2C							
								////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP3					// set RedGhost state 							//and storing back to position address in r0
//JUC r6 endRedGhostState_SetTimer

RGD2C:
LUI 51 r0							//update RedGhost position by making position address in r0 							
ORI 44 r0
LOAD r1 r0								//then getting it in r1
ADDI -53 r1									//adding one
STOR r1 r0	
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN3					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostDOWN3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
RedGhostDOWN3:
LOAD r1 r4						//read current state, address in r4
CMPI 35	r1						//check  state						
BNE RedGhostLEFT1					//

//JAL r6 CheckUP					//check if down control is pushed
//CMPI 1 r0
//BNE RGD3C
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP2					// set RedGhost state 
//JUC r6 endRedGhostState_SetTimer

RGD3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN0					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
RGLeftStates:


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostLEFT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
RedGhostLEFT1:
LOAD r1 r4						//read current state, address in r4
CMPI 49	r1						//check  state							
BNE RedGhostLEFT2	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE RGL1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT0					// set RedGhost state 	
//JUC r6 endRedGhostState_SetTimer

RGL1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT2					// set RedGhost state 	
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostLEFT2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
RedGhostLEFT2:

LOAD r1 r4						//read current state, address in r4
CMPI 50	r1						//check  state						
BNE RedGhostLEFT3	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE RGL2C							
									////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT3					// set RedGhost state 
//JUC r6 endRedGhostState_SetTimer

RGL2C:
LUI 51 r0							//update RedGhost position by making position address in r0 			
ORI 44 r0
LOAD r1 r0								//then getting it in r1
ADDI 1 r1									//adding one
JAL r6 SetPosition_WarpLeftSide					//setting it to either its position or the 'warp' position.
STOR r1 r0								//and storing back to position address in r0

MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT3					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostLEFT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
RedGhostLEFT3:
LOAD r1 r4						//read current state, address in r4
CMPI 51	r1						//check  state							
BNE RedGhostRIGHT1					//

//JAL r6 CheckRIGHT					//check if down control is pushed
//CMPI 1 r0
//BNE RGL3C		
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT2					// set RedGhost state 
//JUC r6 endRedGhostState_SetTimer

RGL3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT0					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RGRightStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostRIGHT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
RedGhostRIGHT1:
LOAD r1 r4						//read current state, address in r4
CMPI 65	r1						//check  state							
BNE RedGhostRIGHT2

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE RGR1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT0					// set RedGhost state 	
//JUC r6 endRedGhostState_SetTimer

RGR1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT2					// set RedGhost state 	
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostRIGHT2::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RedGhostRIGHT2:

LOAD r1 r4						//read current state, address in r4
CMPI 66	r1						//check  state					
BNE RedGhostRIGHT3	

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE RGR2C							//if button isnt pushed, skip down 9 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT3					// set RedGhost state 
//JUC r6 endRedGhostState_SetTimer

RGR2C:
LUI 51 r0							//update RedGhost position by making position address in r0 
ORI 44 r0
LOAD r1 r0								//then getting it in r1
ADDI -1 r1									//adding one
JAL r6 SetPosition_WarpRightSide			//set position to warped side or current position.
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT3					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::RedGhostRIGHT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
RedGhostRIGHT3:
LOAD r1 r4						//read current state, address in r4
CMPI 67	r1						//check  state						
BNE endRedGhostState_SetTimer //

//JAL r6 CheckLEFT					//check if LEFT control is pushed
//CMPI 1 r0
//BNE RGR3C							
									////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT2					// set RedGhost state 
//JUC r6 endRedGhostState_SetTimer

RGR3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT0					// set RedGhost state 
JUC r6 endRedGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

endRedGhostState_SetTimer:
LUI 255 r0			//make timer reset address
ORI 235 r0
MOVI 80 r1			//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0			

endRedGhostStateUpdate:
MOV r14 r15 		//restore old return adress
RETX 				//return

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::RedGhostDraw GLYPH:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RedGhost_Draw_GLYPH:	
//RedGhost's RedGhostDraw glyph 

//check if not edible
//	if not edible RedGhostDraw normal
//	if edible check flash state:
//		if blue: RedGhostDraw blue ghost
//		if lblue: RedGhostDraw lblue ghost

//MAKE RedGhost 	LOCATION ADDRESS IN r2	
LUI 51 r2 
ORI 44 r0
//MAKE RedGhost STATE ADDRESS IN r3
LUI 51 r3 
ORI 45 r3

//load location of RedGhost INTO r0
LOAD r0 r2

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE UP 0:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE UP0
RedGhostDrawUP0:
load r5 r3
CMPI 16 r5
BNE RedGhostDrawUP1	//else check if in state UP1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_UP0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_UP0
BUC RG_Eat1_UP0

RG_Normal_UP0:
MOV r0 r1
MOVI 107 r0		//RGHOST_UP_0
STOR r0 r1 
ADDI -53 r1	    //get location below RedGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

RG_Eat0_UP0:
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

RG_Eat1_UP0:
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
RedGhostDrawUP1:
LOAD R5 R3
CMPI 17 r5
BNE RedGhostDrawUP2 //else check if in state UP2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_UP1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_UP1
BUC RG_Eat1_UP1

RG_Normal_UP1:
MOV r0 r1
MOVI 113 r0		//GHOST_UP_6
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 112 r0		//GHOST_UP_5
STOR r0 r1		
RETX

RG_Eat0_Up1:
MOVI 57 R1		//E1GHOST_UP_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 56 R1		//E1GHOST_UP_5
STOR R1 R0 		
RETX

RG_Eat1_Up1:
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
RedGhostDrawUP2:
LOAD R5 R3
CMPI 18 r5
BNE RedGhostDrawUP3 //else check if in state UP3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_UP2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_UP2
BUC RG_Eat1_UP2

RG_Normal_UP2:
MOV r0 r1
MOVI 111 r0		//GHOST_UP_4
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 110 r0		//GHOST_UP_3
STOR r0 r1		
RETX

RG_Eat0_Up2:
MOVI 55 R1		//E1GHOST_UP_4
STOR R1 R0 		
ADDI 53 R0 		
MOVI 54 R1		//E1GHOST_UP_3
STOR R1 R0 		
RETX

RG_Eat1_Up2:
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
RedGhostDrawUP3:
LOAD R5 R3
CMPI 19 r5
BNE RedGhostDrawDOWN0 //else check if in state RedGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_UP3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_UP3
BUC RG_Eat1_UP3

RG_Normal_UP3:
MOV r0 r1
MOVI 108 r0		//GHOST_UP_1
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 109 r0		//GHOST_UP_2
STOR r0 r1		
RETX

RG_Eat0_Up3:
MOVI 52 R1		//E1GHOST_UP_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 53 R1		//E1GHOST_UP_2
STOR R1 R0 		
RETX

RG_Eat1_Up3:
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
RedGhostDrawDOWN0:
load r5 r3
CMPI 32 r5
BNE RedGhostDrawDOWN1	//else check if in state DOWN1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_DOWN0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_DOWN0
BUC RG_Eat1_DOWN0

RG_Normal_DOWN0:
MOV r0 r1
MOVI 255 r0		//RGHOST_DOWN_0
ADDI 17 r0
STOR r0 r1 
ADDI 53 r1	    //get location above RedGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

RG_Eat0_DOWN0:
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

RG_Eat1_DOWN0:
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
RedGhostDrawDOWN1:
LOAD R5 R3
CMPI 33 r5
BNE RedGhostDrawDOWN2 //else check if in state DOWN2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_DOWN1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_DOWN1
BUC RG_Eat1_DOWN1

RG_Normal_DOWN1:
MOV r0 r1
MOVI 255 r0		//GHOST_DOWN_1
ADDI 18 r0
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 255 r0		//GHOST_DOWN_2
ADDI 19 r0
STOR r0 r1		
RETX

RG_Eat0_DOWN1:
MOVI 31 R1		//E1GHOST_DOWN_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 32 R1		//E1GHOST_DOWN_2
STOR R1 R0 		
RETX

RG_Eat1_DOWN1:
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
RedGhostDrawDOWN2:
LOAD R5 R3
CMPI 34 r5
BNE RedGhostDrawDOWN3 //else check if in state DOWN3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_DOWN2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_DOWN2
BUC RG_Eat1_DOWN2

RG_Normal_DOWN2:
MOV r0 r1
MOVI 255 r0		//GHOST_DOWN_3
ADDI 20 r0
STOR R0 R1	
ADDI -53 R1     //get location below
MOVI 255 r0		//GHOST_DOWN_4
ADDI 21 r0
STOR r0 r1		
RETX

RG_Eat0_DOWN2:
MOVI 33 R1		//E1GHOST_DOWN_3
STOR R1 R0 		
ADDI -53 R0 		
MOVI 34 R1		//E1GHOST_DOWN_4
STOR R1 R0 		
RETX

RG_Eat1_DOWN2:
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
RedGhostDrawDOWN3:
LOAD R5 R3
CMPI 35 r5
BNE RedGhostDrawLEFT0 //else check if in state RedGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_DOWN3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_DOWN3
BUC RG_Eat1_DOWN3

RG_Normal_DOWN3:
MOV r0 r1
MOVI 255 r0		//GHOST_DOWN_6
ADDI 23 r0
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 255 r0		//GHOST_DOWN_5
ADDI 22 r0
STOR r0 r1		
RETX

RG_Eat0_DOWN3:
MOVI 255 R1		//E1GHOST_DOWN_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 63 R1		//E1GHOST_DOWN_5
STOR R1 R0 		
RETX

RG_Eat1_DOWN3:
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
RedGhostDrawLEFT0:
load r5 r3
CMPI 48 r5
BNE RedGhostDrawLEFT1	//else check if in state LEFT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_LEFT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_LEFT0
BUC RG_Eat1_LEFT0

RG_Normal_LEFT0:
MOV r0 r1
MOVI 255 r0		//RGHOST_LEFT_0
ADDI 24 r0
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

RG_Eat0_LEFT0:
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

RG_Eat1_LEFT0:
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
RedGhostDrawLEFT1:
LOAD R5 R3
CMPI 49 r5
BNE RedGhostDrawLEFT2 //else check if in state LEFT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_LEFT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_LEFT1
BUC RG_Eat1_LEFT1

RG_Normal_LEFT1:
MOV r0 r1
MOVI 255 r0		//GHOST_LEFT_6
ADDI 30 r0
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 255 r0		//GHOST_LEFT_5
ADDI 29 r0
STOR r0 r1		
RETX

RG_Eat0_LEFT1:
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

RG_Eat1_LEFT1:
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
RedGhostDrawLEFT2:
LOAD R5 R3
CMPI 50 r5
BNE RedGhostDrawLEFT3 //else check if in state LEFT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_LEFT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_LEFT2
BUC RG_Eat1_LEFT2

RG_Normal_LEFT2:
MOV r0 r1
MOVI 255 r0		//GHOST_LEFT_4
ADDI 28 r0
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 255 r0		//GHOST_LEFT_3
ADDI 27 r0
STOR r0 r1		
RETX

RG_Eat0_LEFT2:
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

RG_Eat1_LEFT2:
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
RedGhostDrawLEFT3:
LOAD R5 R3
CMPI 51 r5
BNE RedGhostDrawRIGHT0 //else check if in state RedGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_LEFT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_LEFT3
BUC RG_Eat1_LEFT3

RG_Normal_LEFT3:
MOV r0 r1
MOVI 255 r0		//GHOST_LEFT_1
ADDI 25 r0
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 255 r0		//GHOST_LEFT_2
ADDI 26 r0
STOR r0 r1		
RETX

RG_Eat0_LEFT3:
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

RG_Eat1_LEFT3:
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
RedGhostDrawRIGHT0:
load r5 r3
CMPI 64 r5
BNE RedGhostDrawRIGHT1	//else check if in state RIGHT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_RIGHT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_RIGHT0
BUC RG_Eat1_RIGHT0

RG_Normal_RIGHT0:
MOV r0 r1
MOVI 255 r0		//RGHOST_RIGHT_0
ADDI 31 r0
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

RG_Eat0_RIGHT0:
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

RG_Eat1_RIGHT0:
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
RedGhostDrawRIGHT1:
LOAD R5 R3
CMPI 65 r5
BNE RedGhostDrawRIGHT2 //else check if in state RIGHT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_RIGHT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_RIGHT1
BUC RG_Eat1_RIGHT1

RG_Normal_RIGHT1:
MOV r0 r1
MOVI 255 r0		//GHOST_RIGHT_1
ADDI 32 r0
STOR R0 R1	
ADDI -1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 255 r0		//GHOST_RIGHT_2
ADDI 33 r0
STOR r0 r1		
RETX

RG_Eat0_RIGHT1:
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

RG_Eat1_RIGHT1:
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
RedGhostDrawRIGHT2:
LOAD R5 R3
CMPI 66 r5
BNE RedGhostDrawRIGHT3 //else check if in state RIGHT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_RIGHT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_RIGHT2
BUC RG_Eat1_RIGHT2

RG_Normal_RIGHT2:
MOV r0 r1
MOVI 255 r0		//GHOST_RIGHT_3
ADDI 34 r0
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 255 r0		//GHOST_RIGHT_4
ADDI 35 r0
STOR r0 r1		
RETX

RG_Eat0_RIGHT2:
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

RG_Eat1_RIGHT2:
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
RedGhostDrawRIGHT3:
LOAD R5 R3
CMPI 67 r5
BEQ RG_Right3 //else return if not in a state...
RETX

RG_Right3:
//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ RG_Normal_RIGHT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ RG_Eat0_RIGHT3
BUC RG_Eat1_RIGHT3

RG_Normal_RIGHT3:
MOV r0 r1
MOVI 255 r0		//GHOST_RIGHT_6
ADDI 37 r0
STOR R0 R1	
ADDI 1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 255 r0		//GHOST_RIGHT_5
ADDI 36 r0
STOR r0 r1		
RETX

RG_Eat0_RIGHT3:
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

RG_Eat1_RIGHT3:
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
//:::::::::::::::::::::::::::::::::END RedGhostDraw GLYPH:::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

INIT_RedGhost:
	LUI 255 r0			//make timer reset address
	ORI 235 r0
	LUI 8 r1			//set 512+256 miliseconds on timer			//TIMER SET
	STOR r1 r0			

	//set RedGhost state to left0
	LUI 51 r4
	ORI 45 r4
	MOVI 16 r1
	STOR r1 r4

	//put RedGhost on initial spot in map
	LUI 51 r4
	ORI 44 r4	//***could be wrong
	LUI 63 r1	# make address for top corner in frame buffer
	ORI 255 r1
	MOVI 53 r8
	MULI -19 r8
	ADD r8 r1	# Offset by rows
	ADDI -26 r1	# Offset by columns
	STOR R1 r4

RETX

RedGhost_isWallUP:
LUI 51 r0		//make address 13100 where RedGhost location is stored		
ORI 44 r0
LOAD r0 r0		//save result back into r0
ADDI 53 r0		//increment r0 to get location of square above RedGhost (53 adress spaces higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

RedGhost_isWallDOWN:
LUI 51 r0		//Red ghost location
ORI 44 r0
LOAD r0 r0		//save result back into r0
ADDI -53 r0		//increment r0 to get location of square below RedGhost (53 adress spaces lower in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

RedGhost_isWallLEFT:
LUI 51 r0		//make address 13100 where RedGhost location is stored
ORI 44 r0
LOAD r0 r0		//save result back into r0
ADDI 1 r0		//increment r0 to get location of square left of RedGhost (1 space higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

RedGhost_isWallRIGHT:
LUI 51 r0		//make address 13100 where RedGhost location is stored
ORI 44 r0
LOAD r0 r0		//save result back into r0
ADDI -1 r0		//increment r0 to get location of square right of RedGhost (1 space lower in memory)
LOAD r0 r0
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

	
///::::::::::::::::::END RedGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END RedGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END RedGhost STATE MACHINE::::::::::::::::::::::