`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  RetroActive Desig n
// Engineer: Zachary Wilcox
// 
// Create Date:    15:59:45 11/01/2012 
// Design Name: 
// Module Name:    MP3_Controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module takes an 16 bit integer value between 1 and 18.  It then sends a low signal to the corresponding trigger
// on a MP3 Trigger circuit.  The MP3 Trigger triggers are active low.
// The MP3 Trigger doesn't have any timing information on it's datasheet.  It however does support a 34k baud UART.  With this, we assumed 
// the MP3 Trigger at least a 34k clock.  With this assmumption created a 30 Hz Clock divider and "regged" our output to the MP3 Trigger.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MP3_Controller(
    input [5:0] Number_to_Play,
	 input clock,
	 input enable,
    output reg [18:1] trigger_out
	 
    );
	 
	 reg [18:1] trigger = 0;
always@(*)
begin
	//All outputs should be active low
	trigger = 18'b111111111111111111;
	//find the integer value sent to it and set that trigger low.
	case(Number_to_Play)
	
	1	:	trigger[1] = 0;
	2	:	trigger[2] = 0;
	3	:	trigger[3] = 0;
	4	:	trigger[4] = 0;
	5	:	trigger[5] = 0;
	6	:	trigger[6] = 0;
	7	:	trigger[7] = 0;
	8	:	trigger[8] = 0;
	9	:	trigger[9] = 0;
	10	:	trigger[10] = 0;
	11	:	trigger[11] = 0;
	12	:	trigger[12] = 0;
	13	:	trigger[13] = 0;
	14	:	trigger[14] = 0;
	15	:	trigger[15] = 0;
	16	:	trigger[16] = 0;
	17	:	trigger[17] = 0;
	18	:	trigger[18] = 0;
	
	default : trigger = 18'b111111111111111111;
	

	endcase 

end
//reg outputs as described in the module description.
always@(posedge clock)
begin
	if(enable)
		trigger_out <= trigger;
end
endmodule
