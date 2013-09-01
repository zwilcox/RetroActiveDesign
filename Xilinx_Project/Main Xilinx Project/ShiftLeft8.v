`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:55 10/19/2012 
// Design Name: 
// Module Name:    ShiftLeft8 
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
module ShiftLeft8(
    input [7:0] inData,
    output [15:0] outData
    );

	assign outData = {{inData[7:0]},{8{1'b0}}};
	
endmodule
