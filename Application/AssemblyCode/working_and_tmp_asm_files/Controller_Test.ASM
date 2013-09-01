LUI 255 r0
ORI	231 r0
MOVI 1 r2			//set 512+256 miliseconds on timer			//TIMER SET
STOR r2 r0		


LOOP:
MOV r15 r14 				//store old return adress
LUI 255 r0
ORI	231 r0
LOAD r0 r0					//then loading its value and cmp to 1
CMPI 1 r0
JNE r6 LOOP				//if timer was not active, do not update state.


//check if up/down controls are pushed:
state0_updown:
JAL r6 CheckUP   		//CheckUP is a function that checks if controller up button is pushed
MOV r0 r1				//store the result of checkup in r1
JAL r6 CheckDOWN 		//CheckDOWN is a function that checks if controller down button is pushed
CMP r0 r1				//compare the results of both checkup and checkdown, by comparing r1 and r0
BEQ state0_leftright  	//if controller UP/DOWN are pushed together, input could be left or right
CMPI 1 r0				//Else, check if down was pushed. r0 will be 1 if down was pushed
BEQ down
BUC up

//check if left/right controls are pushed:
state0_leftright:
JAL r6 CheckLEFT  		//CheckLEFT is a function that checks if controller up button is pushed
MOV r0 r1				//store the result of checkLEFT in r1
JAL r6 CheckRIGHT 		//CheckRIGHT is a function that checks if controller right button is pushed
CMP r0 r1				//compare the results of both checkup and checkdown, by comparing r1 and r0
BEQ LOOP		//if controller LEFT/RIGHT are pushed together and up/down was not processed exclusively, entire dpad pushed	
CMPI 1 r0				//Else, check if RIGHT was pushed. r0 will be 1 if right was pushed
BEQ right
BUC left

right:
ORI 255 r1
MOVI 53 r8
MULI -28 r8
ADD r8 r1	
ADDI -26 r1	
LOAD r8 r1
ADDI 1 r8
STOR r8 r1
BUC setTimer

left:
ORI 255 r1
MOVI 53 r8
MULI -28 r8
ADD r8 r1	
ADDI -24 r1	
LOAD r8 r1
ADDI 1 r8
STOR r8 r1
BUC setTimer

up:
ORI 255 r1
MOVI 53 r8
MULI -27 r8
ADD r8 r1	
ADDI -25 r1	
LOAD r8 r1
ADDI 1 r8
STOR r8 r1
BUC setTimer

down:
ORI 255 r1
MOVI 53 r8
MULI -29 r8
ADD r8 r1	
ADDI -25 r1	
LOAD r8 r1
ADDI 1 r8
STOR r8 r1


setTimer:
LUI 255 r0				//make timer reset address
ORI 243 r0
LUI 1 r1				//set 512+256 miliseconds on timer			//TIMER SET
STOR r1 r0		
BUC LOOP



CheckRIGHT:
LUI 255 r0	
ORI 248 r0		
LOAD r0 r0	
RETX
CheckLEFT:
LUI 255 r0	
ORI 249 r0
LOAD r0 r0	
RETX		
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
