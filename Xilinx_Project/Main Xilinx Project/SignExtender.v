`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:11 10/09/2012 
// Design Name: 
// Module Name:    SignExtender 
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
module SignExtender(
    input [7:0] inData,
	 input SignExtend,
    output [15:0] outData
    );

	assign outData = { {8{inData[7] & SignExtend}} , inData };

endmodule
