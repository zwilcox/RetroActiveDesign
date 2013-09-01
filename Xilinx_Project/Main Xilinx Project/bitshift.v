`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:33 10/20/2012 
// Design Name: 
// Module Name:    bitshift 
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
module bitshift(
	 input reset,
	 input clk,
    input [15:0] word1,
    input [15:0] word2,
    output SPI_MOSI,
	 output reg DAC_CS,
	 output DAC_CLK
    );
	 
	reg [31:0] bits;
	reg [5:0] cnt;
	
	assign DAC_CLK = clk;
	assign SPI_MOSI = bits[31];
	
	always@(posedge DAC_CLK) begin
		DAC_CS <= 0;
		if (reset) begin
			cnt <= 0;
			bits <= 0;
		end
		else begin
			if (cnt == 0)
				bits <= {word1,word2};
			if (cnt == 32) begin
				cnt <= 0;
				DAC_CS <= 1;
			end
			else bits <= bits << 1;
			
			cnt <= cnt + 1;
		end
	end
	
endmodule
