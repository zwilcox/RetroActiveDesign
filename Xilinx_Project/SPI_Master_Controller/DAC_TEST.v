`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// This is intended to be a quick test to demostrate the SPI and DAC on an oscilliscope
// It's just a basic counter which stops until it recieves a ready signal
// Create Date:    22:08:22 10/24/2012 
// Design Name: 
// Module Name:    DAC_TEST 
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
module DAC_TEST(
    input clk,
	 input count_test,
	 input reset,
    output [31:0] toSPI,
	 output reg toEnable,
	 output toReset
	 
    );

reg [1:0] PS, NS;
parameter idle = 0;
parameter sendEnable = 1;
parameter doNothing = 2;
reg [11:0] DAC_Count = 0;

always@(posedge clk)
begin
	if(reset)
		PS <= idle;
	else
		PS <= NS;

end
//NS logic
always@(*)
begin
	NS <= idle;
	case(PS)
		idle				:	NS <= sendEnable;
		sendEnable		:	NS <= doNothing;
		doNothing		: 	NS	<= (count_test) ? idle : doNothing;
		default			:	NS <=	idle;
	endcase 
end

//PS logic
always@(*)
begin
	toEnable <= 0;
	case(PS)
		sendEnable	:	toEnable <= 1;
		default		:	toEnable <= 0;

	endcase
end

//Counter, 


always@(posedge clk)
	if(count_test)
	begin
		DAC_Count <= DAC_Count + 1;
	end	

//first 8 bits are dont cares, the next 4 bits are a command
//which tell the dac to write and update
//the next is telling the DACS to use DAC A,  the next 4 is the DAC output
//the remaining are dont cares
assign toSPI = {8'b11111111, 4'b0011,4'b0000,DAC_Count,4'b1111};
//assign toSPI = {8'b11111111, 4'b0011,4'b0000,12'b111111111111,4'b1111};
assign toReset = ~reset;
endmodule
