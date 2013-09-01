`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:05 11/01/2012 
// Design Name: 
// Module Name:    Add16Bit 
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
module Add16Bit(
    input [15:0] PC,
    input [15:0] Immediate,
    output [15:0] PCPlusImm
    );

	assign PCPlusImm = PC + Immediate;

endmodule
