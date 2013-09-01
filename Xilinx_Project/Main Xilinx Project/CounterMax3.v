`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  RetroActive Design
// Engineer: Zachary Wilcox
// 
// Create Date:    01:23:37 12/07/2012 
// Design Name: 
// Module Name:    CounterMax3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This counter counts from 0 to 3 to be used as a pseudo random number generator.
// 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CounterMax3(
    input Clock,
    output reg [2:0] count
    );

//create a register for the counter
//only 3 bits, [0-4] numbers
//automatically rolls over.
reg [2:0] toCount = 0;
always@(posedge Clock)
	toCount = toCount + 1;
	
//send out count	
always@(posedge Clock)
	count = toCount;	
endmodule
