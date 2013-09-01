//pacman's draw glyph 
//

// if opentimer == 1
// load open timer
// open timer in 65511  

//storing r1 in 
LUI 255 r1
ORI	231 r1
LOAD r1 r1
//check to see if is 1
CMPI 1 r1
//check condition code
BNE AFTER_MOUTH_TOGGLE
//if timer is 1, invert the mouth condition
//get the value of the mouth condition
//r2 has the mouth condition address
LUI 51 r2
ORI 146 r2
LOAD r3 r2
MULTI -1 r3
//store back in memory
STOR r3 r2
AFTER_MOUTH_TOGGLE:
//APPARENTLY R3 IS USED LATER
//I'M MOVING THE MOUTH POSITION TO R4...
MOV R3 R4

//MAKE PACMAN LOCATION ADDRESS IN r2	
LUI 51 r2 
ORI 144 r2

//MAKE PACMAN STATE ADDRESS IN r3
LUI 51 r3 
ORI 145 r3
//load location of pacman INTO r0
LOAD r0 r2

//CHECK IF STATE UP0
drawUP0:
LOAD r0 r3
CMPI 16 r0
BNE drawUP1	//else check if in state UP1
//check the condition of the mouth

//if open
COMPI 1 R4
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
ORI 179 r1
STOR r1 r0 
ADDI -53 r0	//get location below pacman
MOVI 0 r1 	//LOAD BLANK
STOR r1 r0
RETX


//CHECK IF STATE UP1
drawUP1:
LOAD r0 r3
CMPI 17 r0

BNE drawUP2 //else check if in state UP2
//CHECK CONDITION OF MOUTH
//IF OPEN
COMPI 1 R4
BNE CLOSED_STATE_UP1
LOAD R0 R
LOAD r0 r2	//get PACMAN_OPEN_UP1
LUI 1 r1
ORI 9 r1
STOR r1 r0	//store to fb at pacman location
ADDI 53 r0	//get location above pacman
ADDI 1 r1	//get PACMAN_OPEN_UP2
STOR r1 r0	//store at location above pacman
CLOSED_STATE_UP1:

RETX	


//STATE UP2
drawUP2:
LOAD r0 r3
CMPI 18 r0
BNE drawUP3 //else check if in state UP3
LOAD r0 r2
LUI 1 r1	//get PACMAN_OPEN_UP3
ORI 11 r1	//store to pacman location
STOR r1 r0	//get location above pacman
ADDI 53 r0
ADDI 1 r1   //get PACMAN_OPEN_UP3
STOR r1 r0	//store to location above pacman
RETX	


//STATE UP3
drawUP3:
LOAD r0 r3
CMPI 19 r0
BNE drawDOWN0 //else check if in state DOWN0	
LOAD r0 r2
LUI 1 r1
ORI 14 r1
STOR
RETX


//STATE DOWN0
drawDOWN0:
LOAD r0 r3
CMPI 32 r0
BNE drawDOWN1 //else check if in state DOWN1	
LOAD r0 r2

RETX


//STATE DOWN1
drawDOWN1:
LOAD r0 r3
CMPI 33 r0
BNE drawDOWN2
LOAD r0 r2

RETX


//STATE DOWN2
drawDOWN2:
LOAD r0 r3
CMPI 34 r0
BNE drawDOWN3
LOAD r0 r2

RETX


//STATE DOWN3
drawDOWN3:
LOAD r0 r3
CMPI 35 r0
BNE drawLEFT0
LOAD r0 r2

RETX


//STATE LEFT0
drawLEFT0:
LOAD r0 r3
CMPI 48 r0
BNE drawLEFT1
LOAD r0 r2

RETX


//STATE LEFT1
drawLEFT1:
LOAD r0 r3
CMPI 49 r0
BNE drawLEFT2
LOAD r0 r2

RETX


//STATE LEFT2
drawLEFT2:
LOAD r0 r3
CMPI 50 r0
BNE drawLEFT3
LOAD r0 r2

RETX


//STATE LEFT3
drawLEFT3:
LOAD r0 r3
CMPI 51 r0
BNE drawRIGHT0
LOAD r0 r2

RETX


//STATE RIGHT0
drawRIGHT0:
LOAD r0 r3
CMPI 64 r0
BNE drawRIGHT1
LOAD r0 r2

RETX


//STATE RIGHT1
drawRIGHT1:
LOAD r0 r3
CMPI 65 r0
BNE drawRIGHT2
LOAD r0 r2

RETX


//STATE RIGHT2
drawRIGHT2:
LOAD r0 r3
CMPI 66 r0
BNE drawRIGHT3
LOAD r0 r2

RETX


//STATE RIGHT3
drawRIGHT3:
LOAD r0 r3
CMPI 67 r0
BNE drawDEAD1
LOAD r0 r2

RETX


//STATE DEAD1
drawDEAD1:
LOAD r0 r3
CMPI 1 r0
BNE drawDEAD2
LOAD r0 r2

RETX


//STATE DEAD2
drawDEAD2:
LOAD r0 r3
CMPI 2 r0
BNE drawDEAD3
LOAD r0 r2

RETX


//STATE DEAD3
drawDEAD3:
LOAD r0 r3
CMPI 3 r0
BNE drawDEAD4
LOAD r0 r2

RETX


//STATE DEAD4.. if not any state above, draw as dead4
drawDEAD4:
LOAD r0 r2

RETX