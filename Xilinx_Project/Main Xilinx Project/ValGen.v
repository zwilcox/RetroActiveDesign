`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:18:11 10/20/2012 
// Design Name: 
// Module Name:    ValGen 
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
module ValGen(
    input clk,
    input reset,
    output [15:0] value,
    output [15:0] command
    );
	
	reg [11:0] cnt;
	reg [4:0] clkCnt;
	
	assign tick = (clkCnt == 31);
	assign value = {{4{0}},cnt};
	assign command = 16'b0000110000000000;
	
	always@(posedge clk)
		if (reset) cnt = 0;
		else if (tick) cnt = cnt + 1;
	
	always@(posedge clk)
		if (reset) clkCnt = 0;
		else clkCnt = clkCnt +1;
		
endmodule
