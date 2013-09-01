`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:19 10/18/2012 
// Design Name: 
// Module Name:    AddOne 
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
module AddOne(
    input [15:0] PC,
    output [15:0] PCPlusOne
    );
	
	assign PCPlusOne = PC + 1;

endmodule