`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:21 10/23/2012 
// Design Name: 
// Module Name:    PSR 
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
module PSR(
    input SetC,
    input SetL,
    input SetF,
    input SetZ,
    input SetN,
    input [4:0] CLFZN,
    output reg [4:0] PState_CLFZN,
    input clk,
    input reset
    );

	always@(posedge clk)
		if (reset) PState_CLFZN  <= 0;
		else begin
			if (SetC)
				PState_CLFZN[4] <= CLFZN[4];
			if (SetL)
				PState_CLFZN[3] <= CLFZN[3];
			if (SetF)
				PState_CLFZN[2] <= CLFZN[2];
			if (SetZ)
				PState_CLFZN[1] <= CLFZN[1];
			if (SetN)
				PState_CLFZN[0] <= CLFZN[0];
		end

endmodule
