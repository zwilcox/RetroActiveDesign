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
JEQ	r6 endRedGhostState_SetTimer		
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set red ghost state to up1
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveDOWN:
JAL r6 RedGhost_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 endRedGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set red ghost state 	
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveLEFT:
JAL r6 RedGhost_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 endRedGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set red ghost state to left1
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveRIGHT:
JAL r6 RedGhost_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 endRedGhostState_SetTimer 			
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

