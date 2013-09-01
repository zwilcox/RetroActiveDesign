JUC r6 start_menu				///calls start_game.

start_Game:
JAL r6 initlevel
JAL r6 INIT_PACMAN
JAL r6 INIT_RedGhost
JAL r6 INIT_GreenGhost
JAL r6 INIT_PinkGhost
JAL r6 INIT_BlueGhost
JAL r6 init_score

//play initial song
//load mp3 address
//load mp3 trigger address in r3
//in address 65527
LUI 255 R3
ORI 247 R3

MOVI 1 R4

STOR R4 R3


mainGameLoop:
JAL r6 PACMAN_UPDATE_STATE
JAL r6 GreenGhost_UPDATE_STATE
JAL r6 RedGhost_UPDATE_STATE
JAL r6 PinkGhost_UPDATE_STATE
JAL r6 BlueGhost_UPDATE_STATE
JAL r6 RedGhost_Draw_GLYPH
JAL r6 GreenGhost_Draw_GLYPH
JAL r6 PinkGhost_Draw_GLYPH
JAL r6 BlueGhost_Draw_GLYPH
JAL r6 PACMAN_DRAW_GLYPH
JUC r6 mainGameLoop



//:::::::::::::BEGIN PACMAN STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN PACMAN STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN PACMAN STATE MACHINE::::::::::::::::::::::::::


//register usage: r14 used to save return address of this function.
//registers r0, r1 destroyed as general purpose, r4 used to store state address


// STATES:
// For the '0' states, the state feild will evaluate to 0 if masked with 0x0F (15).
// the ZERO ('0') states are where pacman is centered on a tile.
// In the 0 state pacman will continue MOVIng forward unless the player inputs a direction
// if pacman reaches any state0 and a ghost position is this tile, nextstate is dead1.
//
// 0x10: pacmanUP0     (16)	   --centered on tile, facing up.     nextstate will be up1, unless player input
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

//set spot in FBCPY to a blank glyph.
LUI 51 r1		//make address 13200 where pacman location is stored
ORI 144 r1	
LOAD r1 r1
JAL r6 FBpos_2_CPpos
MOVI 0 r2
STOR r2 r1
JAL r6 update_score

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
//CURRENT STATE state address 13201, store address in r4 
LUI 51 r4 
ORI 145 r4			//store address in r4
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
JAL r6 CheckDOWN					//check if down control is pushed
CMPI 1 r0
BNE UP1Cont

UP1Rev:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN0					// set pacman state 	
JUC r6 endPacmanState_SetTimer

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
JAL r6 CheckDOWN					//check if down control is pushed
CMPI 1 r0
BNE UP2Cont
								//if button isnt pushed, skip to up2cont otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN3					// set pacman state 
JUC r6 endPacmanState_SetTimer

UP2Cont:
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
BNE pacmanDOWN1		
			
JAL r6 CheckDOWN					//check if down control is pushed
CMPI 1 r0
BNE UP3Cont
								//if button isnt pushed, skip down 4 lines, otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN2					// set pacman state 
JUC r6 endPacmanState_SetTimer

UP3Cont:
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
JAL r6 CheckUP					//check if control is pushed
CMPI 1 r0
BNE D1C		
					//if button isnt pushed, skip down 4 lines, otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP0					// set pacman state 	
JUC r6 endPacmanState_SetTimer

D1C:
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
JAL r6 CheckUP					//check if control is pushed
CMPI 1 r0
BNE D2C							
								//if button isnt pushed, skip down 9 lines, otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP3					// set pacman state 							//and storing back to position address in r0
JUC r6 endPacmanState_SetTimer

D2C:
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

JAL r6 CheckUP					//check if down control is pushed
CMPI 1 r0
BNE D3C
							//if button isnt pushed, skip down 4 lines, otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP2					// set pacman state 
JUC r6 endPacmanState_SetTimer

D3C:
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
JAL r6 CheckRIGHT					//check if control is pushed
CMPI 1 r0
BNE L1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT0					// set pacman state 	
JUC r6 endPacmanState_SetTimer

L1C:
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
JAL r6 CheckRIGHT					//check if control is pushed
CMPI 1 r0
BNE L2C							
									//if button isnt pushed, skip down 9 lines, otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT3					// set pacman state 
JUC r6 endPacmanState_SetTimer

L2C:
LUI 51 r0							//update pacman position by making position address in r0 
ORI 144 r0								
LOAD r1 r0								//then getting it in r1
ADDI 1 r1									//adding one
JAL r6 SetPosition_WarpLeftSide					//setting it to either its position or the 'warp' position.
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


JAL r6 CheckRIGHT					//check if down control is pushed
CMPI 1 r0
BNE L3C		
							//if button isnt pushed, skip down 4 lines, otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT2					// set pacman state 
JUC r6 endPacmanState_SetTimer

L3C:
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
JAL r6 CheckLEFT					//check if control is pushed
CMPI 1 r0
BNE R1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT0					// set pacman state 	
JUC r6 endPacmanState_SetTimer

R1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT2					// set pacman state 	
JUC r6 endPacmanState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::pacmanRIGHT2::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

pacmanRIGHT2:

LOAD r1 r4						//read current state, address in r4
CMPI 66	r1						//check  state					
BNE pacmanRIGHT3	
JAL r6 CheckLEFT					//check if control is pushed
CMPI 1 r0
BNE R2C							//if button isnt pushed, skip down 9 lines, otherwise do the following:

MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT3					// set pacman state 
JUC r6 endPacmanState_SetTimer

R2C:
LUI 51 r0							//update pacman position by making position address in r0 
ORI 144 r0								
LOAD r1 r0								//then getting it in r1
ADDI -1 r1									//adding one
JAL r6 SetPosition_WarpRightSide			//set position to warped side or current position.
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


JAL r6 CheckLEFT					//check if LEFT control is pushed
CMPI 1 r0
BNE R3C							
									//if button isnt pushed, skip down 4 lines, otherwise do the following:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT2					// set pacman state 
JUC r6 endPacmanState_SetTimer

R3C:
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
MOVI 50 r1			//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0			

endPacmanStateUpdate:
MOV r14 r15 		//restore old return adress
RETX 				//return


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

//r2 has the mouth condition address
LUI 51 r2
ORI 146 r2
LOAD r4 r2

//check to see if timer is 1
CMPI 1 r1
//check condition code
BNE AFTER_MOUTH_TOGGLE
//if timer is 1, invert the mouth condition
//get the value of the mouth condition
XORI 1 r4 		//MOUTH POSITION IN r4
//store back in memory
STOR r4 r2
//after toggling, reset timer to toggle again next time it activates:				//added mouth toggle timer reset~!
LUI 255 r1
ORI	231 r1
LUI 1 r2
STOR r2 r1 //store 250 ms on timer.													//TIMER SET MOUTH
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
MOV r0 r1
LUI 1 r0	//load PACMAN_OPEN_UP_0
ORI 8 r0
STOR r0 r1 
ADDI -53 r1	//get location below pacman
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

CLOSED_STATE_UP0:
MOV r0 r1
LUI 0 r0	//load PACMAN_CLOSED_UP_0
ORI 212 r0
STOR r0 r1 
ADDI -53 r1	//get location below pacman
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
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
MOV r0 r1
MOVI 255 r0
ADDI 15 R0	//R1 SHOULD BE 270 NOW
STOR R0 R1	//LOAD GLYPH INTO POSITION
ADDI 53 R1 	// GET POSITION ABOVE PACMAN
//NOW NEED TO LOAD PACMAN_OPEN_UP5
//IT IS GLPYH NUM 269
MOVI 255 R0
ADDI 14 R0
STOR r0 r1	//STORE POSITION ABOVE PACMAN
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
MOV r0 r1
//GLYPH 219
MOVI 219 R0
STOR r0 r1 
ADDI 53 r1	//get location ABOVE pacman
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

CLOSED_STATE_DOWN0:
MOV r0 r1
LUI 0 r0	//load PMANCLOSED_DOWN_0
// GLYPH 179
MOVI 179 R0 
STOR r0 r1
ADDI 53 r1	//get location ABOVE pacman
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
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
MOV r0 r1
MOVI 226 R0
STOR r0 r1 
ADDI -1 r1	//get location TO THE RIGHT
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

CLOSED_STATE_LEFT0:
MOV r0 r1
LUI 0 r0	//load PMANCLOSED_LEFT_0
// GLYPH 186
MOVI 186 R0 
STOR r0 r1
ADDI -1 r1	//get location TO THE RIGHT
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
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
MOV r0 r1
MOVI 232 r0
STOR R0 R1	//LOAD POSITION
ADDI 1 R1 	//GET POSITION TO THE LEFT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
//NOW NEED TO PMANOPEN_Left_5
//ITS IN LOCATION 231
MOVI 231 R0
STOR r0 r1	//STORE POSITION BELOW PACMAN
RETX

CLOSED_STATE_LEFT1:
//LOAD PMANCLOSED_Left_6
//IT'S GLYPH 192
MOV r0 r1
MOVI 192 R0
STOR R0 R1 //LOAD INTO POSITION
ADDI 1 R1 	// GET POSITION TO THE LEFT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
//NOW NEED TO LOAD PMANCLOSED_Left_5
//IT'S GLYPH 191
MOVI 191 R0
STOR R0 R1 //LOAD INTO POSITION
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
MOV R0 R1
MOVI 230 r0
STOR R0 R1	//LOAD POSITION
ADDI 1 R1 // GET POSITION TO THE LEFT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
//NOW NEED TO LOAD PMANOPEN_Left_3
//ITS IN LOCATION 229
MOVI 229 R0
STOR r0 r1	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_LEFT2:
//LOAD PMANCLOSED_Left_4
//IT'S GLYPH 190
MOV R0 R1
MOVI 190 R0
STOR R0 R1 //LOAD INTO POSITION
ADDI 1 R1 // GET POSITION BELOW PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
//NOW NEED TO LOAD PMANCLOSED_Left_3
//IT'S GLYPH 189
MOVI 189 R0
STOR R0 R1 //LOAD INTO POSITION
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
MOV r0 r1
MOVI 227 r0
STOR R0 R1	//LOAD POSITION
ADDI -1 R1 	// GET POSITION TO THE RIGHT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
//NOW NEED TO PMANOPEN_Left_2
//ITS IN LOCATION 228
MOVI 228 R0
STOR r0 r1	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_LEFT3:
//LOAD PMANCLOSED_Left_1
//IT'S GLYPH 187
MOV r0 r1
MOVI 187 R0
STOR R0 R1 //LOAD INTO POSITION
ADDI -1 R1 // GET POSITION TO THE RIGHT PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
//NOW NEED TO LOAD PMANCLOSED_Left_2 (SAME AS PMANCLOSED)
//IT'S GLYPH 188
MOVI 188 R0
STOR r0 r1	//STORE POSITION ABOVE PACMAN
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
MOV R0 R1
MOVI 245 R0
STOR r0 r1 
ADDI 1 r1	//get location TO THE LEFT
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
RETX

CLOSED_STATE_RIGHT0:
MOV R0 R1
LUI 0 r0	//load PMANCLOSED_RIGHT_0
// GLYPH 205
MOVI 205 R0 
STOR r0 r1
ADDI 1 r1	//get location TO THE LEFT
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1
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
MOV r0 r1
MOVI 246 r0
STOR R0 R1	//LOAD POSITION
ADDI -1 R1 	// GET POSITION TO THE RIGHT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
//NOW NEED TO PMANOPEN_Right_2
//ITS IN LOCATION 247
MOVI 247 R0
STOR r0 r1	//STORE POSITION BELOW PACMAN
RETX

CLOSED_STATE_RIGHT1:
//LOAD PMANCLOSED_Right_1
//IT'S GLYPH 206
MOV r0 r1
MOVI 206 R0
STOR R0 R1 //LOAD INTO POSITION
ADDI -1 R1 	// GET POSITION TO THE RIGHT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
//NOW NEED TO LOAD PMANCLOSED_Right_2
//IT'S GLYPH 207
MOVI 207 R0
STOR R0 R1 //LOAD INTO POSITION
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
MOV R0 R1
MOVI 248 r0
STOR R0 R1	//LOAD POSITION
ADDI -1 R1 // GET POSITION TO THE RIGHT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
//NOW NEED TO LOAD PMANOPEN_Right_4
//ITS IN LOCATION 249
MOVI 249 R0
STOR R0 R1	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_RIGHT2:
//LOAD PMANCLOSED_Right_3
//IT'S GLYPH 208
MOV R0 R1 	//swap registers so function to setposition_warpright call will work...... I hope....
MOVI 208 R0
STOR R0 R1 //LOAD INTO POSITION
ADDI -1 R1 // GET POSITION TO THE RIGHT PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
//NOW NEED TO LOAD PMANCLOSED_Right_4
//IT'S GLYPH 209
MOVI 209 R0
STOR R0 R1 //LOAD INTO POSITION
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
MOV r0 r1
MOVI 251 r0
STOR R0 R1	//LOAD POSITION
ADDI 1 R1 	// GET POSITION TO THE LEFT OF PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
//NOW NEED TO PMANOPEN_Right_5
//ITS IN LOCATION 250
MOVI 250 R0
STOR r0 r1	//STORE POSITION ABOVE PACMAN
RETX

CLOSED_STATE_RIGHT3:
//LOAD PMANCLOSED_Right_6
//IT'S GLYPH 211
MOV r0 r1
MOVI 211 R0
STOR R0 R1 //LOAD INTO POSITION
ADDI 1 R1 // GET POSITION TO THE LEFT PACMAN
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
//NOW NEED TO LOAD PMANCLOSED_Right_5 (SAME AS PMANCLOSED)
//IT'S GLYPH 210
MOVI 210 R0
STOR r0 r1	//STORE POSITION ABOVE PACMAN
RETX

drawDEAD1:
ADD r0 r0
RETX

INIT_PACMAN:
	LUI 255 r0			//make timer reset address
	ORI 243 r0
	LUI 18 r1			//set 512+256 miliseconds on timer			//TIMER SET
	STOR r1 r0			

	//set pacman state to left0
	LUI 51 r4 
	ORI 145 r4		
	MOVI 48 r1
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

	//initialize lives left
	LUI 51 r4		//lives left addr
	ORI 244 r4 		//lives left addr
	MOVI 4 r0
	STOR r0 r4

	MOV r15 r14
	JAL r6 drawLivesLeft
	MOV r14 r15

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

	
//:::::::::::::END PACMAN STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::END PACMAN STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::END PACMAN STATE MACHINE::::::::::::::::::::::::::


//:::::::::::::BEGIN GreenGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN GreenGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN GreenGhost STATE MACHINE::::::::::::::::::::::::::


/////THIS FUNCTION UPDATES  STATEMACHINE BY ONE STEP.
//
//  The first thing it does is check the timer. If the timer is not active, it immediately leaves.
//    Otherwise:
//		check what state GreenGhost is in
//	  	check controller input accordingly,
//	    update state & position variables  
//		reset timer
//		

GreenGhost_UPDATE_STATE:

MOV r15 r14 				//store old return adress
LUI 255 r0					//check timer by making address
ORI 240 r0
LOAD r0 r0					//then loading its value and cmp to 1
CMPI 1 r0

JNE r6 endGreenGhostStateUpdate	  //if timer was not active, do not update state.
//								  //else, continue on to update GreenGhost state:
//		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::GET CURRENT STATE ADDRESS::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		
//CURRENT STATE state address 12801, store address in r4 
LUI 50 r4 
ORI 1 r4			//store address in r4


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::ZERO STATES::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//  
//  If in a ZERO state:
//  check if on a ghost, if so die.
//  otherwise, check player input in all directions and start MOVIng.
//  if player has made no input selections, keep going in current direction.
//  CHECK IF GreenGhost HIT GHOST: (Any ghost position is on GreenGhosts square) 
//  	if hit, set nextstate to dead,
//      jump to reset timer to progress to next state.
//	
//  if position = AnyGhostPosition
//		nextstate = GreenGhostDEAD1
//		JUC endGreenGhostState_SetTimer

//Check if in a '0' state:

LOAD r1 r4				//read current state, address in r4
MOV r1 r0				//copy STATE into temp register.
ANDI 15 r0				//mask it by ANDing it with 0xF (15)
CMPI 0 r0   			//if masked value is not zero, check if it is in another state
JNE r6 GGUpStates 		//by branching to the next comparison, to check if it is an upstate

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
BEQ GreenGhost_TryMoveUP

ADDI -1 r1
CMP r0 r1
BEQ GreenGhost_TryMoveUP

ADDI -53 r1
ADDI -1 r1
CMP r0 r1
BEQ GreenGhost_TryMoveLEFT

ADDI 1 r1
CMP r0 r1
BEQ GreenGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ GreenGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ GreenGhost_TryMoveRIGHT


GG_TryDifferentRandom:

LOAD r1 r4 	//load state	

CMPI 16 r1						//check if in up0 state.
BEQ	GreenGhostMoveUP					//if not in up0 state, check if in down0 state

CMPI 32 r1						//check if in down0 state.
BEQ	GreenGhostMoveDOWN					//if not in down0 state, check if in left0 state, else:

CMPI 48 r1						//check if in left0 state.
BEQ GreenGhostMoveLEFT

CMPI 64 r1						//check if in right0 state.
BEQ GreenGhostMoveRIGHT				//if not in right0 state, do not update state.
JUC r6 endGreenGhostState_SetTimer

GreenGhostMoveUP:
JAL r6 getRANDOM
CMPI 2 r0
JEQ r6 GreenGhost_tryMoveLEFT
CMPI 3 r0
JEQ r6 GreenGhost_tryMoveRIGHT
JUC r6 GreenGhost_tryMoveUP

GreenGhostMoveDOWN:
JAL r6 getRANDOM
CMPI 3 r0
JEQ r6 GreenGhost_tryMoveRIGHT
CMPI 2 r0
JEQ r6 GreenGhost_tryMoveLEFT
JUC r6 GreenGhost_tryMoveDOWN


GreenGhostMoveLEFT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 GreenGhost_tryMoveUP
CMPI 1 r0
JEQ r6 GreenGhost_tryMoveDOWN
JUC r6 GreenGhost_tryMoveLEFT


GreenGhostMoveRIGHT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 GreenGhost_tryMoveUP
CMPI 1 r0
JEQ r6 GreenGhost_tryMoveDOWN
JUC r6 GreenGhost_tryMoveRIGHT

GreenGhost_TryMoveUP:
JAL r6 GreenGhost_isWallUP					
CMPI 1 r0						//check if wall is above
JEQ	r6 endGreenGhostState_SetTimer		
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set pacman state to up1
JUC r6 endGreenGhostState_SetTimer

GreenGhost_TryMoveDOWN:
JAL r6 GreenGhost_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 endGreenGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set pacman state 	
JUC r6 endGreenGhostState_SetTimer

GreenGhost_TryMoveLEFT:
JAL r6 GreenGhost_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 endGreenGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set pacman state to left1
JUC r6 endGreenGhostState_SetTimer

GreenGhost_TryMoveRIGHT:
JAL r6 GreenGhost_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 endGreenGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT1					// set pacman state 	
JUC r6 endGreenGhostState_SetTimer

////:::::::::::::::::::::::End Zero States::::::::::::::::::::::::::

GGUpStates:

//if we are traveling up and not centered on a tile, we will
//continue to travel up, thus only the down button must be checked.

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostUP1:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

GreenGhostUP1:
LOAD r1 r4						//read current state, address in r4
CMPI 17	r1						//if state is GreenGhostUP1		
				
BNE GreenGhostUP2	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE GGUP1Cont

//UP1Rev:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN0					// set GreenGhost state 	
//JUC r6 endGreenGhostState_SetTimer

GGUP1Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP2					// set GreenGhost state 	
JUC r6 endGreenGhostState_SetTimer	
	
	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostUP2:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

GreenGhostUP2:	
LOAD r1 r4						//read current state, address in r4
CMPI 18	r1						//if state is GreenGhostUP2						
BNE GreenGhostUP3	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE GGUP2Cont
								////if button isnt pushed, skip to up2cont otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN3					// set GreenGhost state 
//JUC r6 endGreenGhostState_SetTimer

GGUP2Cont:
LUI 50 r0							//update GreenGhost position by making position address in r0 
LOAD r1 r0								//then getting it in r1
ADDI 53 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP3					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostUP3:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

GreenGhostUP3:
LOAD r1 r4						//read current state, address in r4
CMPI 19	r1						//if state is GreenGhostUP3						
BNE GreenGhostDOWN1		
			
//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE GGUP3Cont
								////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN2					// set GreenGhost state 
//JUC r6 endGreenGhostState_SetTimer

GGUP3Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP0					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
GGDownStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostDOWN1:::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
GreenGhostDOWN1:
LOAD r1 r4						//read current state, address in r4
CMPI 33	r1						//if state is GreenGhostDOWN1						
BNE GreenGhostDOWN2	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE GGD1C		
					////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP0					// set GreenGhost state 	
//JUC r6 endGreenGhostState_SetTimer

GGD1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN2					// set GreenGhost state 	
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostDOWN2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
GreenGhostDOWN2:

LOAD r1 r4						//read current state, address in r4
CMPI 34	r1						//if state is GreenGhostDOWN2					
BNE GreenGhostDOWN3	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE GGD2C							
								////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP3					// set GreenGhost state 							//and storing back to position address in r0
//JUC r6 endGreenGhostState_SetTimer

GGD2C:
LUI 50 r0							//update GreenGhost position by making position address in r0 							
LOAD r1 r0								//then getting it in r1
ADDI -53 r1									//adding one
STOR r1 r0	
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN3					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostDOWN3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
GreenGhostDOWN3:
LOAD r1 r4						//read current state, address in r4
CMPI 35	r1						//check  state						
BNE GreenGhostLEFT1					//

//JAL r6 CheckUP					//check if down control is pushed
//CMPI 1 r0
//BNE GGD3C
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP2					// set GreenGhost state 
//JUC r6 endGreenGhostState_SetTimer

GGD3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN0					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
GGLeftStates:


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostLEFT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
GreenGhostLEFT1:
LOAD r1 r4						//read current state, address in r4
CMPI 49	r1						//check  state							
BNE GreenGhostLEFT2	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE GGL1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT0					// set GreenGhost state 	
//JUC r6 endGreenGhostState_SetTimer

GGL1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT2					// set GreenGhost state 	
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostLEFT2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
GreenGhostLEFT2:

LOAD r1 r4						//read current state, address in r4
CMPI 50	r1						//check  state						
BNE GreenGhostLEFT3	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE GGL2C							
									////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT3					// set GreenGhost state 
//JUC r6 endGreenGhostState_SetTimer

GGL2C:
LUI 50 r0							//update GreenGhost position by making position address in r0 			
LOAD r1 r0								//then getting it in r1
ADDI 1 r1									//adding one
JAL r6 SetPosition_WarpLeftSide					//setting it to either its position or the 'warp' position.
STOR r1 r0								//and storing back to position address in r0

MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT3					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostLEFT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
GreenGhostLEFT3:
LOAD r1 r4						//read current state, address in r4
CMPI 51	r1						//check  state							
BNE GreenGhostRIGHT1					//

//JAL r6 CheckRIGHT					//check if down control is pushed
//CMPI 1 r0
//BNE GGL3C		
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT2					// set GreenGhost state 
//JUC r6 endGreenGhostState_SetTimer

GGL3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT0					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

GGRightStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostRIGHT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
GreenGhostRIGHT1:
LOAD r1 r4						//read current state, address in r4
CMPI 65	r1						//check  state							
BNE GreenGhostRIGHT2

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE GGR1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT0					// set GreenGhost state 	
//JUC r6 endGreenGhostState_SetTimer

GGR1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT2					// set GreenGhost state 	
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostRIGHT2::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

GreenGhostRIGHT2:

LOAD r1 r4						//read current state, address in r4
CMPI 66	r1						//check  state					
BNE GreenGhostRIGHT3	

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE GGR2C							//if button isnt pushed, skip down 9 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT3					// set GreenGhost state 
//JUC r6 endGreenGhostState_SetTimer

GGR2C:
LUI 50 r0							//update GreenGhost position by making position address in r0 
LOAD r1 r0								//then getting it in r1
ADDI -1 r1									//adding one
JAL r6 SetPosition_WarpRightSide			//set position to warped side or current position.
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT3					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::GreenGhostRIGHT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
GreenGhostRIGHT3:
LOAD r1 r4						//read current state, address in r4
CMPI 67	r1						//check  state						
BNE endGreenGhostState_SetTimer //

//JAL r6 CheckLEFT					//check if LEFT control is pushed
//CMPI 1 r0
//BNE GGR3C							
									////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT2					// set GreenGhost state 
//JUC r6 endGreenGhostState_SetTimer

GGR3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT0					// set GreenGhost state 
JUC r6 endGreenGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

endGreenGhostState_SetTimer:
LUI 255 r0			//make timer reset address
ORI 241 r0
MOVI 50 r1			//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0			

endGreenGhostStateUpdate:
MOV r14 r15 		//restore old return adress
RETX 				//return

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::GreenGhostDraw GLYPH:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

GreenGhost_Draw_GLYPH:	
//GreenGhost's GreenGhostDraw glyph 

//check if not edible
//	if not edible GreenGhostDraw normal
//	if edible check flash state:
//		if blue: GreenGhostDraw blue ghost
//		if lblue: GreenGhostDraw lblue ghost

//MAKE GreenGhost 	LOCATION ADDRESS IN r2	
LUI 50 r2 

//MAKE GreenGhost STATE ADDRESS IN r3
LUI 50 r3 
ORI 1 r3

//load location of GreenGhost INTO r0
LOAD r0 r2

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE UP 0:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE UP0
GreenGhostDrawUP0:
load r5 r3
CMPI 16 r5
BNE GreenGhostDrawUP1	//else check if in state UP1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_UP0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_UP0
BUC GG_Eat1_UP0

GG_Normal_UP0:
MOV r0 r1
MOVI 107 r0		//GGHOST_UP_0
STOR r0 r1 
ADDI -53 r1	    //get location below GreenGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

GG_Eat0_UP0:
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

GG_Eat1_UP0:
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
GreenGhostDrawUP1:
LOAD R5 R3
CMPI 17 r5
BNE GreenGhostDrawUP2 //else check if in state UP2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_UP1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_UP1
BUC GG_Eat1_UP1

GG_Normal_UP1:
MOV r0 r1
MOVI 113 r0		//GHOST_UP_6
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 112 r0		//GHOST_UP_5
STOR r0 r1		
RETX

GG_Eat0_Up1:
MOVI 57 R1		//E1GHOST_UP_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 56 R1		//E1GHOST_UP_5
STOR R1 R0 		
RETX

GG_Eat1_Up1:
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
GreenGhostDrawUP2:
LOAD R5 R3
CMPI 18 r5
BNE GreenGhostDrawUP3 //else check if in state UP3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_UP2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_UP2
BUC GG_Eat1_UP2

GG_Normal_UP2:
MOV r0 r1
MOVI 111 r0		//GHOST_UP_4
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 110 r0		//GHOST_UP_3
STOR r0 r1		
RETX

GG_Eat0_Up2:
MOVI 55 R1		//E1GHOST_UP_4
STOR R1 R0 		
ADDI 53 R0 		
MOVI 54 R1		//E1GHOST_UP_3
STOR R1 R0 		
RETX

GG_Eat1_Up2:
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
GreenGhostDrawUP3:
LOAD R5 R3
CMPI 19 r5
BNE GreenGhostDrawDOWN0 //else check if in state GreenGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_UP3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_UP3
BUC GG_Eat1_UP3

GG_Normal_UP3:
MOV r0 r1
MOVI 108 r0		//GHOST_UP_1
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 109 r0		//GHOST_UP_2
STOR r0 r1		
RETX

GG_Eat0_Up3:
MOVI 52 R1		//E1GHOST_UP_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 53 R1		//E1GHOST_UP_2
STOR R1 R0 		
RETX

GG_Eat1_Up3:
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
GreenGhostDrawDOWN0:
load r5 r3
CMPI 32 r5
BNE GreenGhostDrawDOWN1	//else check if in state DOWN1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_DOWN0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_DOWN0
BUC GG_Eat1_DOWN0

GG_Normal_DOWN0:
MOV r0 r1
MOVI 86 r0		//GGHOST_DOWN_0
STOR r0 r1 
ADDI 53 r1	    //get location above GreenGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

GG_Eat0_DOWN0:
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

GG_Eat1_DOWN0:
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
GreenGhostDrawDOWN1:
LOAD R5 R3
CMPI 33 r5
BNE GreenGhostDrawDOWN2 //else check if in state DOWN2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_DOWN1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_DOWN1
BUC GG_Eat1_DOWN1

GG_Normal_DOWN1:
MOV r0 r1
MOVI 87 r0		//GHOST_DOWN_1
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 88 r0		//GHOST_DOWN_2
STOR r0 r1		
RETX

GG_Eat0_DOWN1:
MOVI 31 R1		//E1GHOST_DOWN_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 32 R1		//E1GHOST_DOWN_2
STOR R1 R0 		
RETX

GG_Eat1_DOWN1:
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
GreenGhostDrawDOWN2:
LOAD R5 R3
CMPI 34 r5
BNE GreenGhostDrawDOWN3 //else check if in state DOWN3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_DOWN2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_DOWN2
BUC GG_Eat1_DOWN2

GG_Normal_DOWN2:
MOV r0 r1
MOVI 89 r0		//GHOST_DOWN_3
STOR R0 R1	
ADDI -53 R1     //get location below
MOVI 90 r0		//GHOST_DOWN_4
STOR r0 r1		
RETX

GG_Eat0_DOWN2:
MOVI 33 R1		//E1GHOST_DOWN_3
STOR R1 R0 		
ADDI -53 R0 		
MOVI 34 R1		//E1GHOST_DOWN_4
STOR R1 R0 		
RETX

GG_Eat1_DOWN2:
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
GreenGhostDrawDOWN3:
LOAD R5 R3
CMPI 35 r5
BNE GreenGhostDrawLEFT0 //else check if in state GreenGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_DOWN3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_DOWN3
BUC GG_Eat1_DOWN3

GG_Normal_DOWN3:
MOV r0 r1
MOVI 92 r0		//GHOST_DOWN_6
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 91 r0		//GHOST_DOWN_5
STOR r0 r1		
RETX

GG_Eat0_DOWN3:
MOVI 64 R1		//E1GHOST_DOWN_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 63 R1		//E1GHOST_DOWN_5
STOR R1 R0 		
RETX

GG_Eat1_DOWN3:
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
GreenGhostDrawLEFT0:
load r5 r3
CMPI 48 r5
BNE GreenGhostDrawLEFT1	//else check if in state LEFT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_LEFT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_LEFT0
BUC GG_Eat1_LEFT0

GG_Normal_LEFT0:
MOV r0 r1
MOVI 93 r0		//GGHOST_LEFT_0
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

GG_Eat0_LEFT0:
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

GG_Eat1_LEFT0:
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
GreenGhostDrawLEFT1:
LOAD R5 R3
CMPI 49 r5
BNE GreenGhostDrawLEFT2 //else check if in state LEFT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_LEFT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_LEFT1
BUC GG_Eat1_LEFT1

GG_Normal_LEFT1:
MOV r0 r1
MOVI 99 r0		//GHOST_LEFT_6
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 98 r0		//GHOST_LEFT_5
STOR r0 r1		
RETX

GG_Eat0_LEFT1:
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

GG_Eat1_LEFT1:
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
GreenGhostDrawLEFT2:
LOAD R5 R3
CMPI 50 r5
BNE GreenGhostDrawLEFT3 //else check if in state LEFT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_LEFT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_LEFT2
BUC GG_Eat1_LEFT2

GG_Normal_LEFT2:
MOV r0 r1
MOVI 97 r0		//GHOST_LEFT_4
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 96 r0		//GHOST_LEFT_3
STOR r0 r1		
RETX

GG_Eat0_LEFT2:
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

GG_Eat1_LEFT2:
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
GreenGhostDrawLEFT3:
LOAD R5 R3
CMPI 51 r5
BNE GreenGhostDrawRIGHT0 //else check if in state GreenGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_LEFT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_LEFT3
BUC GG_Eat1_LEFT3

GG_Normal_LEFT3:
MOV r0 r1
MOVI 94 r0		//GHOST_LEFT_1
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 95 r0		//GHOST_LEFT_2
STOR r0 r1		
RETX

GG_Eat0_LEFT3:
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

GG_Eat1_LEFT3:
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
GreenGhostDrawRIGHT0:
load r5 r3
CMPI 64 r5
BNE GreenGhostDrawRIGHT1	//else check if in state RIGHT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_RIGHT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_RIGHT0
BUC GG_Eat1_RIGHT0

GG_Normal_RIGHT0:
MOV r0 r1
MOVI 100 r0		//GGHOST_RIGHT_0
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

GG_Eat0_RIGHT0:
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

GG_Eat1_RIGHT0:
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
GreenGhostDrawRIGHT1:
LOAD R5 R3
CMPI 65 r5
BNE GreenGhostDrawRIGHT2 //else check if in state RIGHT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_RIGHT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_RIGHT1
BUC GG_Eat1_RIGHT1

GG_Normal_RIGHT1:
MOV r0 r1
MOVI 101 r0		//GHOST_RIGHT_1
STOR R0 R1	
ADDI -1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 102 r0		//GHOST_RIGHT_2
STOR r0 r1		
RETX

GG_Eat0_RIGHT1:
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

GG_Eat1_RIGHT1:
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
GreenGhostDrawRIGHT2:
LOAD R5 R3
CMPI 66 r5
BNE GreenGhostDrawRIGHT3 //else check if in state RIGHT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_RIGHT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_RIGHT2
BUC GG_Eat1_RIGHT2

GG_Normal_RIGHT2:
MOV r0 r1
MOVI 103 r0		//GHOST_RIGHT_3
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 104 r0		//GHOST_RIGHT_4
STOR r0 r1		
RETX

GG_Eat0_RIGHT2:
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

GG_Eat1_RIGHT2:
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
GreenGhostDrawRIGHT3:
LOAD R5 R3
CMPI 67 r5
BEQ GG_Right3 //else return if not in a state...
RETX

GG_Right3:
//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ GG_Normal_RIGHT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ GG_Eat0_RIGHT3
BUC GG_Eat1_RIGHT3

GG_Normal_RIGHT3:
MOV r0 r1
MOVI 106 r0		//GHOST_RIGHT_6
STOR R0 R1	
ADDI 1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 105 r0		//GHOST_RIGHT_5
STOR r0 r1		
RETX

GG_Eat0_RIGHT3:
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

GG_Eat1_RIGHT3:
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
//:::::::::::::::::::::::::::::::::END GreenGhostDraw GLYPH:::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

INIT_GreenGhost:
	LUI 255 r0			//make timer reset address
	ORI 241 r0
	LUI 18 r1			//set 512+256 miliseconds on timer			//TIMER SET
	STOR r1 r0			

	//set GreenGhost state to left0
	LUI 50 r4
	ORI 1 r4
	MOVI 16 r1
	STOR r1 r4

	//put GreenGhost on initial spot in map
	LUI 50 r4
	LUI 63 r1	# make address for top corner in frame buffer
	ORI 255 r1
	MOVI 53 r8
	MULI -19 r8
	ADD r8 r1	# Offset by rows
	ADDI -25 r1	# Offset by columns
	STOR R1 r4

RETX

GreenGhost_isWallUP:
LUI 50 r0		//make address 12800 where GreenGhost location is stored		
LOAD r0 r0		//save result back into r0
ADDI 53 r0		//increment r0 to get location of square above GreenGhost (53 adress spaces higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

GreenGhost_isWallDOWN:
LUI 50 r0		//green ghost location
LOAD r0 r0		//save result back into r0
ADDI -53 r0		//increment r0 to get location of square below GreenGhost (53 adress spaces lower in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

GreenGhost_isWallLEFT:
LUI 50 r0		//make address 12800 where GreenGhost location is stored
LOAD r0 r0		//save result back into r0
ADDI 1 r0		//increment r0 to get location of square left of GreenGhost (1 space higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

GreenGhost_isWallRIGHT:
LUI 50 r0		//make address 12800 where GreenGhost location is stored
LOAD r0 r0		//save result back into r0
ADDI -1 r0		//increment r0 to get location of square right of GreenGhost (1 space lower in memory)
LOAD r0 r0
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

	
///::::::::::::::::::END GreenGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END GreenGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END GreenGhost STATE MACHINE::::::::::::::::::::::

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
LUI 51 r0
ORI 44 r0
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
JEQ	r6 endRedGhostStateUpdate		
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set red ghost state to up1
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveDOWN:
JAL r6 RedGhost_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 endRedGhostStateUpdate			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set red ghost state 	
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveLEFT:
JAL r6 RedGhost_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 endRedGhostStateUpdate			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set red ghost state to left1
JUC r6 endRedGhostState_SetTimer

RedGhost_TryMoveRIGHT:
JAL r6 RedGhost_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 endRedGhostStateUpdate 			
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
MOVI 50 r1			//set 512+256 miliseconds on timer			//TIMER SET
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
ORI 44 r2
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
MOVI 255 r0
ADDI 38 r0		//RGHOST_UP_0
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
MOVI 255 r0
ADDI 44 r0		//GHOST_UP_6
STOR R0 R1	
ADDI 53 R1 		//get location above
ADDI -1 r0      //GHOST_UP_5 (298)
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
MOVI 255 r0		//GHOST_UP_4
ADDI 42 r0
STOR R0 R1	
ADDI 53 R1 		//get location above
ADDI -1 r0		//GHOST_UP_3
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
MOVI 255 r0		//GHOST_UP_1
ADDI 39 r0
STOR R0 R1	
ADDI -53 R1 	//get location below
ADDI 1 r0		//GHOST_UP_2
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
	LUI 22 r1			//set 512+256 miliseconds on timer			//TIMER SET
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
	ADDI -27 r1	# Offset by columns
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



//:::::::::::::BEGIN PinkGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN PinkGhost STATE MACHINE::::::::::::::::::::::::::
//:::::::::::::BEGIN PinkGhost STATE MACHINE::::::::::::::::::::::::::


/////THIS FUNCTION UPDATES  STATEMACHINE BY ONE STEP.
//
//  The first thing it does is check the timer. If the timer is not active, it immediately leaves.
//    Otherwise:
//		check what state PinkGhost is in
//	  	check controller input accordingly,
//	    update state & position variables  
//		reset timer
//		

PinkGhost_UPDATE_STATE:

MOV r15 r14 				//store old return adress
LUI 255 r0					//check timer by making address
ORI 238 r0
LOAD r0 r0					//then loading its value and cmp to 1
CMPI 1 r0

JNE r6 endPinkGhostStateUpdate	  //if timer was not active, do not update state.
//								  //else, continue on to update PinkGhost state:
//		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::GET CURRENT STATE ADDRESS::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		
//CURRENT STATE state address 12901, store address in r4 
LUI 50 r4 
ORI 101 r4			//store address in r4


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::ZERO STATES::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//  
//  If in a ZERO state:
//  check if on a ghost, if so die.
//  otherwise, check player input in all directions and start MOVIng.
//  if player has made no input selections, keep going in current direction.
//  CHECK IF PinkGhost HIT GHOST: (Any ghost position is on PinkGhosts square) 
//  	if hit, set nextstate to dead,
//      jump to reset timer to progress to next state.
//	
//  if position = AnyGhostPosition
//		nextstate = PinkGhostDEAD1
//		JUC endPinkGhostState_SetTimer

//Check if in a '0' state:

LOAD r1 r4				//read current state, address in r4
MOV r1 r0				//copy STATE into temp register.
ANDI 15 r0				//mask it by ANDing it with 0xF (15)
CMPI 0 r0   			//if masked value is not zero, check if it is in another state
JNE r6 PGUpStates 		//by branching to the next comparison, to check if it is an upstate


LUI 63 r1	# make address for top corner in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -18 r8
ADD r8 r1	# Offset by rows
ADDI -26 r1	# Offset by columns
LUI 50 r0
ORI 100 r0
LOAD r0 r0
CMP r0 r1
BEQ PinkGhost_TryMoveUP

ADDI -1 r1
CMP r0 r1
BEQ PinkGhost_TryMoveUP

ADDI -53 r1
ADDI -1 r1
CMP r0 r1
BEQ PinkGhost_TryMoveLEFT

ADDI 1 r1
CMP r0 r1
BEQ PinkGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ PinkGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ PinkGhost_TryMoveRIGHT

//IN A ZERO STATE:

PG_TryDifferentRandom:

LOAD r1 r4 	//load state	

CMPI 16 r1						//check if in up0 state.
BEQ	PinkGhostMoveUP					//if not in up0 state, check if in down0 state

CMPI 32 r1						//check if in down0 state.
BEQ	PinkGhostMoveDOWN					//if not in down0 state, check if in left0 state, else:

CMPI 48 r1						//check if in left0 state.
BEQ PinkGhostMoveLEFT

CMPI 64 r1						//check if in right0 state.
BEQ PinkGhostMoveRIGHT				//if not in right0 state, do not update state.
JUC r6 endPinkGhostState_SetTimer

PinkGhostMoveUP:
JAL r6 getRANDOM
CMPI 2 r0
JEQ r6 PinkGhost_tryMoveLEFT
CMPI 3 r0
JEQ r6 PinkGhost_tryMoveRIGHT
JUC r6 PinkGhost_tryMoveUP

PinkGhostMoveDOWN:
JAL r6 getRANDOM
CMPI 3 r0
JEQ r6 PinkGhost_tryMoveRIGHT
CMPI 2 r0
JEQ r6 PinkGhost_tryMoveLEFT
JUC r6 PinkGhost_tryMoveDOWN


PinkGhostMoveLEFT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 PinkGhost_tryMoveUP
CMPI 1 r0
JEQ r6 PinkGhost_tryMoveDOWN
JUC r6 PinkGhost_tryMoveLEFT


PinkGhostMoveRIGHT:
JAL r6 getRANDOM
CMPI 0 r0
JEQ r6 PinkGhost_tryMoveUP
CMPI 1 r0
JEQ r6 PinkGhost_tryMoveDOWN
JUC r6 PinkGhost_tryMoveRIGHT

PinkGhost_TryMoveUP:
JAL r6 PinkGhost_isWallUP					
CMPI 1 r0						//check if wall is above
JEQ	r6 endPinkGhostState_SetTimer		
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set pacman state to up1
JUC r6 endPinkGhostState_SetTimer

PinkGhost_TryMoveDOWN:
JAL r6 PinkGhost_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 endPinkGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set pacman state 	
JUC r6 endPinkGhostState_SetTimer

PinkGhost_TryMoveLEFT:
JAL r6 PinkGhost_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 endPinkGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set pacman state to left1
JUC r6 endPinkGhostState_SetTimer

PinkGhost_TryMoveRIGHT:
JAL r6 PinkGhost_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 endPinkGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT1					// set pacman state 	
JUC r6 endPinkGhostState_SetTimer

////:::::::::::::::::::::::End Zero States::::::::::::::::::::::::::

PGUpStates:

//if we are traveling up and not centered on a tile, we will
//continue to travel up, thus only the down button must be checked.

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostUP1:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

PinkGhostUP1:
LOAD r1 r4						//read current state, address in r4
CMPI 17	r1						//if state is PinkGhostUP1		
				
BNE PinkGhostUP2	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE PGUP1Cont

//UP1Rev:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN0					// set PinkGhost state 	
//JUC r6 endPinkGhostState_SetTimer

PGUP1Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP2					// set PinkGhost state 	
JUC r6 endPinkGhostState_SetTimer	
	
	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostUP2:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

PinkGhostUP2:	
LOAD r1 r4						//read current state, address in r4
CMPI 18	r1						//if state is PinkGhostUP2						
BNE PinkGhostUP3	

//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE PGUP2Cont
								////if button isnt pushed, skip to up2cont otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN3					// set PinkGhost state 
//JUC r6 endPinkGhostState_SetTimer

PGUP2Cont:
LUI 50 r0							//update PinkGhost position by making position address in r0 
ORI 100 r0			//store address in r4
LOAD r1 r0								//then getting it in r1
ADDI 53 r1									//adding one
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP3					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostUP3:::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

PinkGhostUP3:
LOAD r1 r4						//read current state, address in r4
CMPI 19	r1						//if state is PinkGhostUP3						
BNE PinkGhostDOWN1		
			
//JAL r6 CheckDOWN					//check if down control is pushed
//CMPI 1 r0
//BNE PGUP3Cont
								////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateDOWN2					// set PinkGhost state 
//JUC r6 endPinkGhostState_SetTimer

PGUP3Cont:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateUP0					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
PGDownStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostDOWN1:::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
PinkGhostDOWN1:
LOAD r1 r4						//read current state, address in r4
CMPI 33	r1						//if state is PinkGhostDOWN1						
BNE PinkGhostDOWN2	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE PGD1C		
					////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP0					// set PinkGhost state 	
//JUC r6 endPinkGhostState_SetTimer

PGD1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN2					// set PinkGhost state 	
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostDOWN2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
PinkGhostDOWN2:

LOAD r1 r4						//read current state, address in r4
CMPI 34	r1						//if state is PinkGhostDOWN2					
BNE PinkGhostDOWN3	

//JAL r6 CheckUP					//check if control is pushed
//CMPI 1 r0
//BNE PGD2C							
								////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP3					// set PinkGhost state 							//and storing back to position address in r0
//JUC r6 endPinkGhostState_SetTimer

PGD2C:
LUI 50 r0							//update PinkGhost position by making position address in r0 							
ORI 100 r0			//store address in r4
LOAD r1 r0								//then getting it in r1
ADDI -53 r1									//adding one
STOR r1 r0	
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN3					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostDOWN3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
PinkGhostDOWN3:
LOAD r1 r4						//read current state, address in r4
CMPI 35	r1						//check  state						
BNE PinkGhostLEFT1					//

//JAL r6 CheckUP					//check if down control is pushed
//CMPI 1 r0
//BNE PGD3C
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateUP2					// set PinkGhost state 
//JUC r6 endPinkGhostState_SetTimer

PGD3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN0					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
PGLeftStates:


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostLEFT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
PinkGhostLEFT1:
LOAD r1 r4						//read current state, address in r4
CMPI 49	r1						//check  state							
BNE PinkGhostLEFT2	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE PGL1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT0					// set PinkGhost state 	
//JUC r6 endPinkGhostState_SetTimer

PGL1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT2					// set PinkGhost state 	
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostLEFT2:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
PinkGhostLEFT2:

LOAD r1 r4						//read current state, address in r4
CMPI 50	r1						//check  state						
BNE PinkGhostLEFT3	

//JAL r6 CheckRIGHT					//check if control is pushed
//CMPI 1 r0
//BNE PGL2C							
									////if button isnt pushed, skip down 9 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT3					// set PinkGhost state 
//JUC r6 endPinkGhostState_SetTimer

PGL2C:
LUI 50 r0							//update PinkGhost position by making position address in r0 			
ORI 100 R0			//store address in r4
LOAD r1 r0								//then getting it in r1
ADDI 1 r1									//adding one
JAL r6 SetPosition_WarpLeftSide					//setting it to either its position or the 'warp' position.
STOR r1 r0								//and storing back to position address in r0

MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT3					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostLEFT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
PinkGhostLEFT3:
LOAD r1 r4						//read current state, address in r4
CMPI 51	r1						//check  state							
BNE PinkGhostRIGHT1					//

//JAL r6 CheckRIGHT					//check if down control is pushed
//CMPI 1 r0
//BNE PGL3C		
							////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateRIGHT2					// set PinkGhost state 
//JUC r6 endPinkGhostState_SetTimer

PGL3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT0					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	
		
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

PGRightStates:

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostRIGHT1:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
PinkGhostRIGHT1:
LOAD r1 r4						//read current state, address in r4
CMPI 65	r1						//check  state							
BNE PinkGhostRIGHT2

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE PGR1C							//if button isnt pushed, skip down 4 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT0					// set PinkGhost state 	
//JUC r6 endPinkGhostState_SetTimer

PGR1C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT2					// set PinkGhost state 	
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostRIGHT2::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

PinkGhostRIGHT2:

LOAD r1 r4						//read current state, address in r4
CMPI 66	r1						//check  state					
BNE PinkGhostRIGHT3	

//JAL r6 CheckLEFT					//check if control is pushed
//CMPI 1 r0
//BNE PGR2C							//if button isnt pushed, skip down 9 lines, otherwise do the following:

//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT3					// set PinkGhost state 
//JUC r6 endPinkGhostState_SetTimer

PGR2C:
LUI 50 r0							//update PinkGhost position by making position address in r0 
ORI 100 R0			//store address in r4
LOAD r1 r0								//then getting it in r1
ADDI -1 r1									//adding one
JAL r6 SetPosition_WarpRightSide			//set position to warped side or current position.
STOR r1 r0								//and storing back to position address in r0
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT3					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::PinkGhostRIGHT3:::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::			
		
PinkGhostRIGHT3:
LOAD r1 r4						//read current state, address in r4
CMPI 67	r1						//check  state						
BNE endPinkGhostState_SetTimer //

//JAL r6 CheckLEFT					//check if LEFT control is pushed
//CMPI 1 r0
//BNE PGR3C							
									////if button isnt pushed, skip down 4 lines, otherwise do the following:
//MOV r4 r0						// move state address to r0 to prepare for setState call
//JAL r6 setStateLEFT2					// set PinkGhost state 
//JUC r6 endPinkGhostState_SetTimer

PGR3C:
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateRIGHT0					// set PinkGhost state 
JUC r6 endPinkGhostState_SetTimer	

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

endPinkGhostState_SetTimer:
LUI 255 r0			//make timer reset address
ORI 239 r0
MOVI 50 r1			//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0			

endPinkGhostStateUpdate:
MOV r14 r15 		//restore old return adress
RETX 				//return

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::PinkGhostDraw GLYPH:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

PinkGhost_Draw_GLYPH:	
//PinkGhost's PinkGhostDraw glyph 

//check if not edible
//	if not edible PinkGhostDraw normal
//	if edible check flash state:
//		if blue: PinkGhostDraw blue ghost
//		if lblue: PinkGhostDraw lblue ghost
//12900
//MAKE PinkGhost 	LOCATION ADDRESS IN r2	
LUI 50 r2 
ORI 100 R2

//MAKE PinkGhost STATE ADDRESS IN r3
LUI 50 r3 
ORI 101 r3

//load location of PinkGhost INTO r0
LOAD r0 r2

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::::::::::STATE UP 0:::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//CHECK IF STATE UP0
PinkGhostDrawUP0:
load r5 r3
CMPI 16 r5
BNE PinkGhostDrawUP1	//else check if in state UP1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_UP0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_UP0
BUC PG_Eat1_UP0

PG_Normal_UP0:
MOV r0 r1
MOVI 162 r0		//PGHOST_UP_0
STOR r0 r1 
ADDI -53 r1	    //get location below PinkGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

PG_Eat0_UP0:
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

PG_Eat1_UP0:
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
PinkGhostDrawUP1:
LOAD R5 R3
CMPI 17 r5
BNE PinkGhostDrawUP2 //else check if in state UP2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_UP1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_UP1
BUC PG_Eat1_UP1

PG_Normal_UP1:
MOV r0 r1
MOVI 168 r0		//GHOST_UP_6
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 167 r0		//GHOST_UP_5
STOR r0 r1		
RETX

PG_Eat0_Up1:
MOVI 57 R1		//E1GHOST_UP_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 56 R1		//E1GHOST_UP_5
STOR R1 R0 		
RETX

PG_Eat1_Up1:
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
PinkGhostDrawUP2:
LOAD R5 R3
CMPI 18 r5
BNE PinkGhostDrawUP3 //else check if in state UP3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_UP2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_UP2
BUC PG_Eat1_UP2

PG_Normal_UP2:
MOV r0 r1
MOVI 166 r0		//GHOST_UP_4
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 165 r0		//GHOST_UP_3
STOR r0 r1		
RETX

PG_Eat0_Up2:
MOVI 55 R1		//E1GHOST_UP_4
STOR R1 R0 		
ADDI 53 R0 		
MOVI 54 R1		//E1GHOST_UP_3
STOR R1 R0 		
RETX

PG_Eat1_Up2:
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
PinkGhostDrawUP3:
LOAD R5 R3
CMPI 19 r5
BNE PinkGhostDrawDOWN0 //else check if in state PinkGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_UP3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_UP3
BUC PG_Eat1_UP3

PG_Normal_UP3:
MOV r0 r1
MOVI 163 r0		//GHOST_UP_1
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 164 r0		//GHOST_UP_2
STOR r0 r1		
RETX

PG_Eat0_Up3:
MOVI 52 R1		//E1GHOST_UP_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 53 R1		//E1GHOST_UP_2
STOR R1 R0 		
RETX

PG_Eat1_Up3:
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
PinkGhostDrawDOWN0:
load r5 r3
CMPI 32 r5
BNE PinkGhostDrawDOWN1	//else check if in state DOWN1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_DOWN0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_DOWN0
BUC PG_Eat1_DOWN0

PG_Normal_DOWN0:
MOV r0 r1
MOVI 141 r0		//PGHOST_DOWN_0
STOR r0 r1 
ADDI 53 r1	    //get location above PinkGhost
MOV r15 r14
JAL r6 FBpos_2_CPpos						//get the position in frame buffer copy
LOAD r0 r1 									//load the glyph in frame buffer copy
JAL r6 CPpos_2_FBpos						//get the position in the frame buffer
MOV r14 r15
STOR r0 r1									//store the glyph back in.
RETX

PG_Eat0_DOWN0:
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

PG_Eat1_DOWN0:
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
PinkGhostDrawDOWN1:
LOAD R5 R3
CMPI 33 r5
BNE PinkGhostDrawDOWN2 //else check if in state DOWN2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_DOWN1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_DOWN1
BUC PG_Eat1_DOWN1

PG_Normal_DOWN1:
MOV r0 r1
MOVI 142 r0		//GHOST_DOWN_1
STOR R0 R1	
ADDI -53 R1 	//get location below
MOVI 143 r0		//GHOST_DOWN_2
STOR r0 r1		
RETX

PG_Eat0_DOWN1:
MOVI 31 R1		//E1GHOST_DOWN_1
STOR R1 R0 		
ADDI -53 R0 		
MOVI 32 R1		//E1GHOST_DOWN_2
STOR R1 R0 		
RETX

PG_Eat1_DOWN1:
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
PinkGhostDrawDOWN2:
LOAD R5 R3
CMPI 34 r5
BNE PinkGhostDrawDOWN3 //else check if in state DOWN3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_DOWN2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_DOWN2
BUC PG_Eat1_DOWN2

PG_Normal_DOWN2:
MOV r0 r1
MOVI 144 r0		//GHOST_DOWN_3
STOR R0 R1	
ADDI -53 R1     //get location below
MOVI 145 r0		//GHOST_DOWN_4
STOR r0 r1		
RETX

PG_Eat0_DOWN2:
MOVI 33 R1		//E1GHOST_DOWN_3
STOR R1 R0 		
ADDI -53 R0 		
MOVI 34 R1		//E1GHOST_DOWN_4
STOR R1 R0 		
RETX

PG_Eat1_DOWN2:
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
PinkGhostDrawDOWN3:
LOAD R5 R3
CMPI 35 r5
BNE PinkGhostDrawLEFT0 //else check if in state PinkGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_DOWN3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_DOWN3
BUC PG_Eat1_DOWN3

PG_Normal_DOWN3:
MOV r0 r1
MOVI 147 r0		//GHOST_DOWN_6
STOR R0 R1	
ADDI 53 R1 		//get location above
MOVI 146 r0		//GHOST_DOWN_5
STOR r0 r1		
RETX

PG_Eat0_DOWN3:
MOVI 64 R1		//E1GHOST_DOWN_6
STOR R1 R0 		
ADDI 53 R0 		
MOVI 63 R1		//E1GHOST_DOWN_5
STOR R1 R0 		
RETX

PG_Eat1_DOWN3:
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
PinkGhostDrawLEFT0:
load r5 r3
CMPI 48 r5
BNE PinkGhostDrawLEFT1	//else check if in state LEFT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_LEFT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_LEFT0
BUC PG_Eat1_LEFT0

PG_Normal_LEFT0:
MOV r0 r1
MOVI 148 r0		//PGHOST_LEFT_0
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

PG_Eat0_LEFT0:
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

PG_Eat1_LEFT0:
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
PinkGhostDrawLEFT1:
LOAD R5 R3
CMPI 49 r5
BNE PinkGhostDrawLEFT2 //else check if in state LEFT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_LEFT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_LEFT1
BUC PG_Eat1_LEFT1

PG_Normal_LEFT1:
MOV r0 r1
MOVI 154 r0		//GHOST_LEFT_6
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 153 r0		//GHOST_LEFT_5
STOR r0 r1		
RETX

PG_Eat0_LEFT1:
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

PG_Eat1_LEFT1:
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
PinkGhostDrawLEFT2:
LOAD R5 R3
CMPI 50 r5
BNE PinkGhostDrawLEFT3 //else check if in state LEFT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_LEFT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_LEFT2
BUC PG_Eat1_LEFT2

PG_Normal_LEFT2:
MOV r0 r1
MOVI 152 r0		//GHOST_LEFT_4
STOR R0 R1	
ADDI 1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 151 r0		//GHOST_LEFT_3
STOR r0 r1		
RETX

PG_Eat0_LEFT2:
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

PG_Eat1_LEFT2:
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
PinkGhostDrawLEFT3:
LOAD R5 R3
CMPI 51 r5
BNE PinkGhostDrawRIGHT0 //else check if in state PinkGhostDrawDOWN0

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_LEFT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_LEFT3
BUC PG_Eat1_LEFT3

PG_Normal_LEFT3:
MOV r0 r1
MOVI 149 r0		//GHOST_LEFT_1
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 150 r0		//GHOST_LEFT_2
STOR r0 r1		
RETX

PG_Eat0_LEFT3:
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

PG_Eat1_LEFT3:
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
PinkGhostDrawRIGHT0:
load r5 r3
CMPI 64 r5
BNE PinkGhostDrawRIGHT1	//else check if in state RIGHT1

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_RIGHT0
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_RIGHT0
BUC PG_Eat1_RIGHT0

PG_Normal_RIGHT0:
MOV r0 r1
MOVI 155 r0		//PGHOST_RIGHT_0
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

PG_Eat0_RIGHT0:
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

PG_Eat1_RIGHT0:
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
PinkGhostDrawRIGHT1:
LOAD R5 R3
CMPI 65 r5
BNE PinkGhostDrawRIGHT2 //else check if in state RIGHT2

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_RIGHT1
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_RIGHT1
BUC PG_Eat1_RIGHT1

PG_Normal_RIGHT1:
MOV r0 r1
MOVI 156 r0		//GHOST_RIGHT_1
STOR R0 R1	
ADDI -1 R1 		//get location left
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 157 r0		//GHOST_RIGHT_2
STOR r0 r1		
RETX

PG_Eat0_RIGHT1:
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

PG_Eat1_RIGHT1:
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
PinkGhostDrawRIGHT2:
LOAD R5 R3
CMPI 66 r5
BNE PinkGhostDrawRIGHT3 //else check if in state RIGHT3

//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_RIGHT2
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_RIGHT2
BUC PG_Eat1_RIGHT2

PG_Normal_RIGHT2:
MOV r0 r1
MOVI 158 r0		//GHOST_RIGHT_3
STOR R0 R1	
ADDI -1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpRightSide
MOV r14 r15
MOVI 159 r0		//GHOST_RIGHT_4
STOR r0 r1		
RETX

PG_Eat0_RIGHT2:
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

PG_Eat1_RIGHT2:
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
PinkGhostDrawRIGHT3:
LOAD R5 R3
CMPI 67 r5
BEQ PG_Right3 //else return if not in a state...
RETX

PG_Right3:
//check edible state:
LUI 51 r1
ORI 255 r1
LOAD r1 r1
CMPI 0 r1
BEQ PG_Normal_RIGHT3
LUI 52 r1
LOAD r1 r1
CMPI 1 r1
BEQ PG_Eat0_RIGHT3
BUC PG_Eat1_RIGHT3

PG_Normal_RIGHT3:
MOV r0 r1
MOVI 161 r0		//GHOST_RIGHT_6
STOR R0 R1	
ADDI 1 R1 		//get location right
MOV r15 r14
JAL r6 SetPosition_WarpLeftSide
MOV r14 r15
MOVI 160 r0		//GHOST_RIGHT_5
STOR r0 r1		
RETX

PG_Eat0_RIGHT3:
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

PG_Eat1_RIGHT3:
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
//:::::::::::::::::::::::::::::::::END PinkGhostDraw GLYPH:::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

INIT_PinkGhost:
	LUI 255 r0			//make timer reset address
	ORI 239 r0
	LUI 26 r1			//set 512+256 miliseconds on timer			//TIMER SET
	STOR r1 r0			

	//set PinkGhost state to left0
	LUI 50 r4
	ORI 101 r4			//store address in r4
	ORI 1 r4
	MOVI 16 r1
	STOR r1 r4

	//put PinkGhost on initial spot in map
	LUI 50 r4
	ORI 100 r4			//store address in r4
	LUI 63 r1	# make address for top corner in frame buffer
	ORI 255 r1
	MOVI 53 r8
	MULI -19 r8
	ADD r8 r1	# Offset by rows
	ADDI -26 r1	# Offset by columns
	STOR R1 r4

RETX

PinkGhost_isWallUP:
LUI 50 r0		//make address 12800 where PinkGhost location is stored	
ORI 100 R0			//store address in r4
LOAD r0 r0		//save result back into r0
ADDI 53 r0		//increment r0 to get location of square above PinkGhost (53 adress spaces higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

PinkGhost_isWallDOWN:
LUI 50 r0		//Pink ghost location
ORI 100 R0			//store address in r4
LOAD r0 r0		//save result back into r0
ADDI -53 r0		//increment r0 to get location of square below PinkGhost (53 adress spaces lower in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

PinkGhost_isWallLEFT:
LUI 50 r0		//make address 12800 where PinkGhost location is stored
ORI 100 R0			//store address in r4
LOAD r0 r0		//save result back into r0
ADDI 1 r0		//increment r0 to get location of square left of PinkGhost (1 space higher in memory)
LOAD r0 r0		// LOAD glyph number				 
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

PinkGhost_isWallRIGHT:
LUI 50 r0		//make address 12800 where PinkGhosT location is stored
ORI 100 R0			//store address in r4
LOAD r0 r0		//save result back into r0
ADDI -1 r0		//increment r0 to get location of square right of PinkGhost (1 space lower in memory)
LOAD r0 r0
MOVI 100 r9
MULI 8 r9
CMP r0 r9
SGE r0			// use Scond instruction to set r0 to 1 if r0 is greater or equal to 800, else 0 if not.
RETX			// return to calling function		

	
///::::::::::::::::::END PinkGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END PinkGhost STATE MACHINE::::::::::::::::::::::
///::::::::::::::::::END PinkGhost STATE MACHINE::::::::::::::::::::::

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

LUI 63 r1	# make address for top corner in frame buffer
ORI 255 r1
MOVI 53 r8
MULI -18 r8
ADD r8 r1	# Offset by rows
ADDI -26 r1	# Offset by columns
LUI 50 r0
ORI 200 r0
LOAD r0 r0
CMP r0 r1
BEQ BlueGhost_TryMoveUP

ADDI -1 r1
CMP r0 r1
BEQ BlueGhost_TryMoveUP

ADDI -53 r1
ADDI -1 r1
CMP r0 r1
BEQ BlueGhost_TryMoveLEFT

ADDI 1 r1
CMP r0 r1
BEQ BlueGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ BlueGhost_TryMoveUP

ADDI 1 r1
CMP r0 r1
BEQ BlueGhost_TryMoveRIGHT

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
JEQ	r6 endBlueGhostState_SetTimer		
MOV r4 r0						// move state address to r0 to prepare for setStateUP call
JAL r6 setStateUP1					// set blue ghost state to up1
JUC r6 endBlueGhostState_SetTimer

BlueGhost_TryMoveDOWN:
JAL r6 BlueGhost_isWallDOWN					
CMPI 1 r0						//check if wall is below
JEQ r6 endBlueGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateDOWN1					// set blue ghost state 	
JUC r6 endBlueGhostState_SetTimer

BlueGhost_TryMoveLEFT:
JAL r6 BlueGhost_isWallLEFT					
CMPI 1 r0						//check if wall is left
JEQ r6 endBlueGhostState_SetTimer			
MOV r4 r0						// move state address to r0 to prepare for setState call
JAL r6 setStateLEFT1				// set blue ghost state to left1
JUC r6 endBlueGhostState_SetTimer

BlueGhost_TryMoveRIGHT:
JAL r6 BlueGhost_isWallRIGHT				
CMPI 1 r0						//check if wall is right
JEQ r6 endBlueGhostState_SetTimer			
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
	LUI 30 r1			//set 512+256 miliseconds on timer			//TIMER SET
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
	ADDI -28 r1	# Offset by columns
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

///::::::::::::::::::STATE MACHINE HELPERS FOR ALL MACHINES::::::::::::::::

///check the position passed in r1, sets r1 to equal r1 if not on warp,
///otherwise sets r1 to warped position.
SetPosition_WarpLeftSide:
	LUI 63 r7	# make address for checking location
	ORI 255 r7
	MOVI 53 r9
	MULI -19 r9
	ADD r9 r7	# Offset by rows
	ADDI -12 r7	# Offset by columns
	CMP r1 r7
	BNE endWarpLeftSide
	ADDI -28 r7
	MOV r7 r1
	endWarpLeftSide:
	RETX
	
SetPosition_WarpRightSide:
	LUI 63 r7	# make address for checking location
	ORI 255 r7
	MOVI 53 r9
	MULI -19 r9
	ADD r9 r7	# Offset by rows
	ADDI -12 r7	
	ADDI -29 r7 # Offset by columns
	CMP r1 r7
	BNE endWarpRightSide
	ADDI 28 r7
	MOV r7 r1
	endWarpRightSide:
	RETX

FBpos_2_CPpos:
	LUI 14 r7
	MULI -1 r7
	ADD r7 r1
	RETX

CPpos_2_FBpos:
	LUI 14 r7
	ADD r7 r1
	RETX
	
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

/////:::::::::::END ALL STATE MACHINE LOGIC:::::::::::::::::://////

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

/////HELPER FUNCTIONS FOR MAIN GAME LOGIC ////

drawLivesLeft:
	LUI 63 r1	# make address for writting location in frame buffer
	ORI 255 r1
	MOVI 53 r8
	MULI -37 r8
	ADD r8 r1		# Offset by rows
	ADDI -14 r1		# Offset by columns
	//zero out space where lives drawn
	MOVI 0 r0   	// number of lives drawn
	MOVI 0 r2   	// blank glyph
	livesClearLoop:
	CMPI 5 r0
	BEQ endlivesClearLoop
	STOR r2 r1
	ADDI -1 r1
	ADDI 1 r0
	BUC livesClearLoop
	endlivesClearLoop:
	ADDI 5 r1		//reset address
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

initlevel:
	//Initialize pill remaining counter in gamestate by MOVIng 244 Pills left on board to addr 13301
	LUI 51 r4
	ORI 245 r4
	MOVI 244 r0
	STOR r0 r4

	//initialize map in fb only.
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
	
	//make the copy of the map in memory in fbcp
	LUI 55 r0	// Make the address for where init function starts
	ORI 182 r0	//
	MOV r0 r3	// r3 current address of where we are reading from memory	 
	LUI 49 r1	# make address for writting location in frame buffer copy
	ORI 255 r1
	MOVI 53 r8
	MULI -5 r8
	ADD r8 r1	# Offset by rows
	ADDI -13 r1	# Offset by columns
	MOVI 0 r6
	loopi2:
	CMPI 31 r6
	BEQ endloopi2 #this should support labels, jump endloopi
	MOVI 0 r7
	loopj2:
	CMPI 28 r7
	BEQ endloopj2 #jump to endloopj
	MOV r6 r4
	MULI 53 r4
	ADD r7 r4
	MULI -1 r4
	ADD r1 r4
	LOAD r5 r3
	STOR r5 r4
	SUBI 1 r3
	ADDI 1 r7
	BUC loopj2
	endloopj2:
	ADDI 1 r6
	BUC loopi2
	endloopi2:
	
RETX


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
	JAL r9 Homescreencheckstart
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

Homescreencheckstart:
	MOVI 0 r2	// Check 'START'
	LUI 255 r2
	ORI 252 r2
	LOAD r2 r2
	CMPI 1 r2
	JEQ r9 start_Game	// if start asserted, start game 
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

clearscreenloop:
	STOR r1 r2	// draw glyph
	ADDI -1 r2	// decrement address pointer
	ADDI 1 r0	//	increment counter
	CMP r0 r3	// check counter <= 2120
	BLT clearscreenloop

	MOV r10 r2	// else restore the reg's
	MOV r11 r3
	RETX

//*** end start menu**///

getRANDOM:
LUI 255 r0
ORI 217 r0
LOAD r0 r0
RETX



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
	LOAD r5 r4
	MOVI 178 r6
	CMP r5 r6
	BEQ nine_zero
	ADDI 1 r5
	STOR r5 r4
	RETX
	
DecrementPillcount:
LUI 51 r6
ORI 245 r6
LOAD r1 r6
ADDI -1 r1
CMPI 0 r1
JEQ r6 endGame
STOR r1 r6
RETX

endGame:
JAL r6 clear_screen
JUC r6 start_menu


playPillsong:
//load mp3 trigger address in r3
//in address 65527
LUI 255 R3
ORI 247 R3
//check to see if pillsong is playing
//LOAD PILL FLAG FROM MEMORY
//IN ADDRESS 13318  IN R4
LUI 52 R4
ORI 6 R4

//LOAD BLANK SONG MEMORY
MOV R4 R5
ADDi 1 R5

//LOAD PILLSONG FLAG
LOAD R6 R4

CMPI 1 R6
BEQ BLANK_SONG_METHOD
//CHECK STATUS OF PILL SONG, IF PLAYING, RETURN
//PLAY SONG
MOVI 2 R6
STOR R6 R3
//RESET FLAGS
MOVI 1 R6
STOR R6 R4

MOVI 0 R6

LOAD R6 R5

BLANK_SONG_METHOD:

ADD R6 R6
RETX


playBlankSong:

//load mp3 trigger address in r3
//in address 65527
LUI 255 R3
ORI 247 R3
//check to see if pillsong is playing
//LOAD PILL FLAG FROM MEMORY
//IN ADDRESS 13318  IN R4
LUI 52 R4
ORI 6 R4

//LOAD BLANK SONG MEMORY ADDRESS
MOV R4 R5
ADDI 1 R5

//LOAD blank FLAG
LOAD R6 R5

CMPI 1 R6
BEQ RETURN_FROM_PILL_SONG_METHOD
//CHECK STATUS OF PILL SONG, IF PLAYING, RETURN
//PLAY SONG
MOVI 3 R6
STOR R6 R3
//RESET FLAGS
MOVI 0 R6
STOR R6 R4

MOVI 1 R6

STOR R6 R5


RETURN_FROM_PILL_SONG_METHOD:

ADD R6 R6
RETX