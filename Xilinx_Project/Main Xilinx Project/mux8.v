`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:08 10/19/2012 
// Design Name: 
// Module Name:    mux8 
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
module mux8 #(parameter WIDTH = 16)
             (input      [WIDTH-1:0] d0, d1, d2, d3, d4, d5, d6, d7,
              input      [2:0]       s, 
              output reg [WIDTH-1:0] y);

   always @(*)
      case(s)
         3'b000: y <= d0;
         3'b001: y <= d1;
         3'b010: y <= d2;
         3'b011: y <= d3;
			3'b100: y <= d4;
			3'b101: y <= d5;
			3'b110: y <= d6;
			3'b111: y <= d7;
      endcase
		
endmodule