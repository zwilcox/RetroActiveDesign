`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:13 10/16/2012 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input 	[13:0] ADDR,
    input 	[15:0] DATA,
    input 	MemWrite,
	 input 	clk,
	 input 	pxlClk,
	 input 	[13:0] glyphAdd,
    output 	[15:0] ReadData,
	 output 	[15:0] glyphData
	 
    );
	wire enable;
	assign enable = 1;
	exmem mem(~clk,enable,MemWrite,ADDR,DATA,ReadData, pxlClk, glyphAdd, glyphData); 
	

endmodule
