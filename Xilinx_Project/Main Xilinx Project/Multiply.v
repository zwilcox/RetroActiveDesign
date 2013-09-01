`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:45 11/10/2012 
// Design Name: 
// Module Name:    Multiply 
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
module Multiply(
    input [15:0] Ainput,
    input [15:0] Binput,
    output [15:0] Result
    );
	
	assign Result = ($signed(Ainput) * $signed(Binput));

endmodule
