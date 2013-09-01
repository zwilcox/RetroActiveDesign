`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RetroActive Design
// Engineer: Zachary Wilcox
// 
// Create Date:    20:07:05 10/24/2012 
// Design Name: 
// Module Name:    SPI_Master_v2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This creates a simple SPI which sends the data MSB first
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


//send the the SPI clock will be inverted from the system clock
//this is to hel pwith the set up time and hold time for the registers on the slave
assign sClk = ~clk;

//increases the state, if reset is pressed, goes to idle
always@(posedge clk)
begin
	if(~reset)
		PS <= idle;
	else 
		PS <= NS;
end


	
	
	
	//ns logic

always@(*)
begin
		NS <= idle;
		case(PS)
			//if enable, go to latch				   
			idle			:	NS <= (enable) 			? latchData	:	idle;
			//once data to be sent is latch, start sending it
			latchData	:	NS <=	send;
			//we've sent all items when idle is sent
			send			:	NS <= (count == 31)		? idle		: 	send;
			default		:	NS <= idle;
		endcase
end	
	//ps logic
	

always@(posedge clk)
begin
	count 	<= 0;
	sendOut 	<= 0;
	MOSI 		<=	0;
	case(PS)
	
	latchData 	: 	begin
							//latch data, send the 31 first bit of incoming item
							//this is to save a clock cycle
							sendOut <= ToSPI;
							//CS goes low when we start sending data
							SPI_CS <= 0;
							count <= count + 1;
							MOSI <= ToSPI[31];
						end
	send			:	begin
							//shift and send data
							sendOut <= sendOut << 1;
							count <= count + 1;
							SPI_CS <= 0;
							//we send the 30th data because the 31 was sent in the previous state
							MOSI 	<= sendOut[30];
						end

	default		:	begin
							//idle..and not sending..
							//CS should b high
							//doesnt matter what MOSI is
							count <= 0;
							SPI_CS <= 1;
							MOSI <= 0;

						end
	endcase 
end




endmodule
