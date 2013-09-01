`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:44 10/16/2012 
// Design Name: 
// Module Name:    AddTwo 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module AddTwo(
    input [15:0] PC,
    output [15:0] PCPlusTwo
    );
	
	assign PCPlusTwo = PC + 1;

endmodule

