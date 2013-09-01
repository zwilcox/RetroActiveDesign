`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// This is a 50 MHz to 60 Hz clock divider.  This is meant to be used for the NES controller
// The NES controller specs us a 60 Hz enable signal.
// Create Date:    16:18:36 10/06/2012 
// Design Name: 
// Module Name:    ClockDivider_50MHz_To_60Hz 
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
module ClockDivider_50MHz_To_60Hz(
    input clock,
	 input reset,
    output reg enable
    );
	reg [19:0] count;
	
	always@(posedge clock) begin
		count <= 0;
		enable <= 1;
		if(reset) begin
			enable <= 1;
			count  <= 0;
		end
//50*10^6/ 60 = 833333.  [0, 833332] => 833333 counts
		
		else if(count == 833332) begin
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
