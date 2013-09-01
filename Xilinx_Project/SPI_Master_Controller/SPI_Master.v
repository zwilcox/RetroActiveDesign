`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:05 10/24/2012 
// Design Name: 
// Module Name:    SPI_Master_v2 
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
module SPI_Master(
input clk,
input [31:0]ToSPI,
input enable,
input reset,
output reg MOSI,
output sClk,
output reg SPI_CS
    );

reg [1:0] NS = 0;
reg [1:0] PS = 0;
reg [31:0]sendOut = 0;
parameter idle  = 0;
parameter latchData = 1;
parameter send =  2;
reg [5:0] count = 0;

assign sClk = clk;

always@(posedge clk)
begin
	if(reset)
		PS <= idle;
	else 
		PS <= NS;
end


	
	
	
	//ns logic

always@(*)
begin
		NS <= idle;
		case(PS)
							   
			idle			:	NS <= (enable) 			? latchData	:	idle;
			//latchData	:	NS <=	(sendOut == ToSPI)? send		:	latchData;
			latchData	:	NS <=	send;
			send			:	NS <= (count == 31) 		? idle		:	send;
			default		:	NS <= idle;
		endcase
end	
	//ps logic
	

always@(posedge clk)
begin
	if(PS == latchData)
	begin	
		sendOut <= ToSPI;
		SPI_CS <= 1;
		count <= count + 1;
		//MOSI 	<= sendOut[31];
		
	end
	else if(PS == send)
	begin
		sendOut <= sendOut << 1;
		count <= count + 1;
		SPI_CS <= 0;
		MOSI 	<= sendOut[31];
		
	end
	else
	begin
		count <= 0;
		SPI_CS <= 1;
		MOSI <= 0;
		
	end
	
end



endmodule
