`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:58 09/15/2012 
// Design Name: 
// Module Name:    PmodSSDcontroller 
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
module PmodSSDcontroller(
    input clk,
	 input reset,
	 input [7:0] value,
    output reg [6:0] hex,
    output cat
    );
	
	reg [16:0] counter;
	wire slowclock;
	
	parameter	zero	=	7'b1111110;
	parameter	one	=	7'b0000110;
	parameter	two	=	7'b1101101;
	parameter	three	=	7'b1001111;
	parameter	four	=	7'b0010111;
	parameter	five	=	7'b1011011;
	parameter	six	=	7'b1111011;
	parameter	seven	=	7'b0001110;
	parameter	eight	=	7'b1111111;
	parameter	nine	=	7'b0011111;
	parameter	A		=	7'b0111111;
	parameter	b		=	7'b1110011;
	parameter	c		=	7'b1100001;
	parameter	d		=	7'b1100111;
	parameter	E		=	7'b1111001;
	parameter	F		=	7'b0111001;
	
	
	assign slowclock = counter[16];
	assign cat = slowclock;
	
	always@(posedge clk) begin
		if (reset) counter <= 0;
		else counter <= counter + 1;
	end
	
	always@(posedge slowclock, negedge slowclock) begin
		if (slowclock) begin
			case(value[3:0]) 
				4'b0000:	hex = zero;
				4'b0001:	hex = one;
				4'b0010:	hex = two;
				4'b0011:	hex = three;
				4'b0100:	hex = four;
				4'b0101: hex = five;
				4'b0110: hex = six;
				4'b0111: hex = seven;
				4'b1000: hex = eight;
				4'b1001: hex = nine;
				4'b1010: hex = A;
				4'b1011: hex = b;
				4'b1100: hex = c;
				4'b1101: hex = d;
				4'b1110: hex = E;
				4'b1111: hex = F;
			endcase
		end
		else begin
			case(value[7:4]) 
				4'b0000:	hex = zero;
				4'b0001:	hex = one;
				4'b0010:	hex = two;
				4'b0011:	hex = three;
				4'b0100:	hex = four;
				4'b0101: hex = five;
				4'b0110: hex = six;
				4'b0111: hex = seven;
				4'b1000: hex = eight;
				4'b1001: hex = nine;
				4'b1010: hex = A;
				4'b1011: hex = b;
				4'b1100: hex = c;
				4'b1101: hex = d;
				4'b1110: hex = E;
				4'b1111: hex = F;
			endcase
		end
	end
endmodule
