`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:07 10/11/2012 
// Design Name: 
// Module Name:    InstructionRegister 
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
module InstructionRegister(
    input [15:0] Instruction_In,
    input Clk,
	 input InstrWrite,
    output reg [15:0] Instruction_Out
    );

	
	
	always@(posedge Clk) begin
		if (InstrWrite)
			Instruction_Out <= Instruction_In;
	end
	
endmodule
