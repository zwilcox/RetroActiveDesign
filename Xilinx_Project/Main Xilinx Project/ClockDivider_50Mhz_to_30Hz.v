`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RetroActive Design
// Engineer: Zachary Wilcox
// This module creates a 50Mhz to 30Khz clock divider. 
// Create Date:    20:06:39 11/10/2012 
// Design Name: 
// Module Name:    ClockDivider_50Mhz_to_30Hz 
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
module ClockDivider_50Mhz_to_30Hz(
    input clock,
	 input reset,
    output reg enable
    );
	reg [24:0] count;
	
	always@(posedge clock) begin
		count <= 0;
		enable <= 1;
		if(reset) begin
			enable <= 1;
			count  <= 0;
		end				  
		
		//50M / 30
		else if(count == 1666670) begin
		//else if(count == 50) begin //for testing
			enable <= 1;
			count  <= 0;
		end
		else begin
			enable <= 0;
			count <= count + 1;
		end
	
	end

endmodule
