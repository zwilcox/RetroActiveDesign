`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:58 10/11/2012 
// Design Name: 
// Module Name:    PCRegister 
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
module PCRegister(
    input [15:0] PCin,
	 input PCWrite,
    input Clk,
	 input Reset,
    output reg [15:0] PCout
    );

	
	
	always@(posedge Clk) begin
		if (Reset)
			PCout <= 0;
		else if (PCWrite) 
			PCout <= PCin;
	end
	
endmodule