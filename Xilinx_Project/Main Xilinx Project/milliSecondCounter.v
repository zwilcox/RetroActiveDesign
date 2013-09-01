`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RetroActive Design
// Engineer: Zachary Wilcox
// 
// Create Date:    16:28:18 11/26/2012 
// Design Name: 
// Module Name:    milliSecondCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module takes an integer value as an input and counts to that value
// in miliseconds.  Once The interger value in milliseconds has been received.  The module
// dipslays a ready signal until reset, or until it recieves another integer value to count
// to.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module milliSecondCounter(
	input clock,
	input reset,
	input [15:0] toCount,
	output reg countRdy
    );
	 
	//state names
	parameter idle 				= 0;
	parameter latchData			= 1;
	parameter startCount			= 2;
	parameter countingState 	= 3;
	parameter displayState 		= 4;
	//state registers.
	reg[2:0] NS 					= 0;
	reg[2:0] PS 					= 0;
	reg[31:0] count 				= 0;
	 
	//change states on clock, or reset. 
	always@(posedge clock)
	begin

		if(reset)
			PS 	<= idle;
		else
			PS 	<= NS;
	end
	
	
	//ns logic
	
	always@(*)
	begin
		NS <= 0;
		case(PS)
		
			// pretty much do nothing until we received a number
			idle				:	NS <= (toCount != 0)			? 	latchData		:	idle;
			
			latchData		: NS <=  startCount;
			//latches data and starts counting
			startCount		:	NS <= countingState;
			
			//this counts
			countingState	:	NS	<=	(count 	<=	 1)		?	displayState	:	countingState;
			//hang out in displayState until we receive another number
			displayState	:	NS	<=	(toCount	!= 0)			?	startCount			:	displayState;
			default			:	NS <= idle;
		endcase
	
	end
	
	// 50 Mhz => 50000000 cycle/sec => 2 *10^(-8) sec/cycle (T) =>
	// 2*10^(-8) sec/cycle * (x cycles) = 10^(-3) 
	// x cycles = 50000 for 1 ms
	
	// PS logic
	always@(posedge clock)
	begin
		if (reset)
			begin
				count 	<= 0;
				countRdy <= 0;
			end	
		else
		begin	
			countRdy	<=	0;
			case(PS)
				idle				:	begin	
											//not counting
											count 	<= 0;
											countRdy <= 0;
											count <= toCount;
										end
				latchData		: 	begin
										//latch data
											countRdy <=0;
											if(toCount > 0)
												count <= toCount;
											
										end	
				startCount		:	begin
														
														// it takes 1 cycle to start the count from when we get the
														// command to start counting
														// it takes 1 cycle before we display it
														// it's why we subtract 2 here.
											count 	<= count * 50000 - 3;
											countRdy <= 0;
										end
				countingState	:	begin
											//continue counting
											count 	<= count - 1;
											countRdy <= 0;
										end
				displayState	:	begin
											//count is 0, display ready
											//hang out in this state until we get another number
											count 	<= toCount;
											countRdy <= 1;
										end
				default			:	begin
											count 	<= 0;
											countRdy <= 0;
										end
			endcase
		end
	end
	 
	 
	 


endmodule
