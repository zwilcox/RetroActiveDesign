`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  RetroActive Design
// Engineer: Zachary Wilcox
// The NESController is used to communicate with a Nintendo Entertainment System Controller.
// The Verilog in this module is orginal.  However it was inspired by the information found
// at http://www.mit.edu/~tarvizo/nes-controller.html.
// The specs for the NES controller can be found at the website above.
// The NES controller samples the buttons being pressed at a rate of 60 Hz
// The output of this module is placed into a register to prevent timing issues.
// This comunicates with the hardware serially and asynchronously. For timing, the hardware
// needs a "Pulse" and "Latch" signal.  12 microseconds wide
// every pulse is 6 microseconds
// Create Date:    16:17:20 10/06/2012 
// Design Name: 
// Module Name:    NESController 
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
module NESController(
    input clock,
    input enable,
    input data,
	 input reset,
    output reg latch,
    output reg pulse,
    output reg [7:0] playerInput
    );
	 //registers that will be used to store the input from the controller
	reg a, b, start, select, up, down, left, right;
	
	//counter, the states should pregress every 12 microseconds
	reg [19:0] count;
	
	//state registers
	reg [5:0] NS, PS;
	
	//state names
	parameter 	IDLE 			= 	0;
	parameter 	LATCH 		= 	1;
	parameter	PULSE_OFF0	=	2;
	parameter	PULSE_ON0	=	3;
	parameter	PULSE_OFF1	=	4;
	parameter	PULSE_ON1	=	5;
	parameter	PULSE_OFF2	=	6;
	parameter	PULSE_ON2	=	7;
	parameter	PULSE_OFF3	=	8;
	parameter	PULSE_ON3	=	9;
	parameter	PULSE_OFF4	=	10;
	parameter	PULSE_ON4	=	11;
	parameter	PULSE_OFF5	=	12;
	parameter	PULSE_ON5	=	13;
	parameter	PULSE_OFF6	=	14;
	parameter	PULSE_ON6	=	15;
	parameter	PULSE_OFF7	=	16;
	
	//counter
	//counter will be used to progress states
	always@(posedge clock) begin
		if(reset)begin
			count <= 0;
		end
		else if(enable) begin
			count <= 0;
		end
		else begin
			count <= count + 1;
		end
	
	end
	
	always@(posedge clock) begin
		if(reset)
			PS <= IDLE;
		else
			PS <= NS;
	end
	
	//NS logic
	always@(*) begin
		NS = IDLE;
		// 300 cycles is 6microseconds
		// the counter is counting clock cycles
		// Clock is 50 Mhz = 50 * 10^6 cycles/ second
		// => 1/(50 * 10^6) seconds / cycle
		// => 1/(50 * 10^6) seconds / cycle  * X cycles = 6 * 10^(-6) seconds
		// => 50 * 6 cycles = 300 cycles
		case(PS)
			IDLE 			: 	NS = (enable) 			? LATCH 			: IDLE;
			//latch is 12 micro seconds, each pulse (on and off) will be 6  microseonds
			LATCH			: 	NS = (count >= 600) 	? PULSE_OFF0 	: LATCH;
			PULSE_OFF0	:	NS = (count >= 900) 	? PULSE_ON0 	: PULSE_OFF0;
			PULSE_ON0	: 	NS = (count >= 1200) ? PULSE_OFF1 	: PULSE_ON0;	
			PULSE_OFF1	:	NS = (count >= 1500) ? PULSE_ON1 	: PULSE_OFF1;
			PULSE_ON1	:	NS = (count >= 1800) ? PULSE_OFF2 	: PULSE_ON1;
			PULSE_OFF2	:	NS = (count >= 2100) ? PULSE_ON2 	: PULSE_OFF2;
			PULSE_ON2	:	NS = (count >= 2400) ? PULSE_OFF3	: PULSE_ON2;
			PULSE_OFF3	:	NS = (count >= 2700) ? PULSE_ON3 	: PULSE_OFF3;
			PULSE_ON3	:	NS = (count >= 3000) ? PULSE_OFF4	: PULSE_ON3;
			PULSE_OFF4	:	NS = (count >= 3300)	? PULSE_ON4 	: PULSE_OFF4;
			PULSE_ON4	:	NS = (count >= 3600) ? PULSE_OFF5 	: PULSE_ON4;
			PULSE_OFF5	:	NS = (count >= 3900) ? PULSE_ON5 	: PULSE_OFF5;
			PULSE_ON5	:	NS = (count >= 4200)	? PULSE_OFF6 	: PULSE_ON5;
			PULSE_OFF6	:	NS = (count >= 4500)	? PULSE_ON6 	: PULSE_OFF6;	
			PULSE_ON6	:	NS = (count >= 4800) ? PULSE_OFF7 	: PULSE_ON6;	
			PULSE_OFF7	:	NS =	(count >= 5100)? IDLE 			: PULSE_OFF7;
			default : NS = IDLE;
		endcase 
	end
	
	// PS Logic
	// Each state will send out the proper signal to the controller (latch, pulse)
	// it also detects the signal from the controller.  The controller data signal
	// is active low.  I convert the signal to high to send it out.
	always@(*) begin
		latch		<= 0;
		pulse	 	<= 0;
		a 			<= 0;
		b 			<= 0; 
		start	 	<= 0;
		select 	<= 0;
		up 		<= 0;
		down 		<= 0;
		left 		<= 0;
		right		<= 0;
		case(PS)
			IDLE			:	begin
									latch <= 0;
									pulse <= 0;
								end
			LATCH			:	begin
									latch 	<= 1;
									pulse 	<= 0;
									a			<= ~data;
								end
			PULSE_OFF0	:	begin
									latch 	<= 0;
									pulse 	<= 0;
									a			<= ~data;
								end
			PULSE_ON0	:	begin
									latch 	<= 0;
									pulse 	<= 1;
									b			<= ~data;
								end
			PULSE_OFF1	:	begin
									latch 	<= 0;
									pulse 	<= 0;
									b			<= ~data;
								end
			PULSE_ON1	:	begin
									latch 	<= 0;
									pulse 	<= 1;
									select 	<= ~data;
								end
			PULSE_OFF2	:	begin
									latch 	<= 0;
									pulse 	<= 0;
									select 	<= ~data;
								end
			PULSE_ON2	:	begin
									latch 	<= 0;
									pulse 	<= 1;
									start 	<= ~data;
								end
			PULSE_OFF3	:	begin
									latch 	<= 0;
									pulse 	<= 0;
									start 	<= ~data;
								end
			PULSE_ON3	:	begin
									latch 	<= 0;
									pulse 	<= 1;
									up		 	<= ~data;
								end
			PULSE_OFF4	:	begin
									latch 	<= 0;
									pulse 	<= 0;
									up		 	<= ~data;
								end
			PULSE_ON4	:	begin
									latch 	<= 0;
									pulse 	<= 1;
									down	 	<= ~data;
								end
			PULSE_OFF5	:	begin
									latch 	<= 0;
									pulse 	<= 0;
									down	 	<= ~data;
								end
			PULSE_ON5	:	begin
									latch 	<= 0;
									pulse 	<= 1;
									left	 	<= ~data;
								end
			PULSE_OFF6	:	begin
									latch 	<= 0;
									pulse	 	<= 0;
									left	 	<= ~data;
								end
			PULSE_ON6	:	begin
									latch 	<= 0;
									pulse 	<= 1;
									right 	<= ~data;
								end
			PULSE_OFF7	:	begin
									latch 	<= 0;
									pulse 	<= 0;
									right		<= ~data;
								end
			default		: 	begin
									latch <= 0;
									pulse <= 0;
								end
		endcase
	end
	
	//reg the data if in the proper state
	always@(posedge clock) begin
		
		if(0 <= count && count < 900)
			playerInput[0] = a;
		if(900 <= count && count < 1500)
			playerInput[1] = b;
		if(1500 <= count && count < 2100)
			playerInput[2] = select;
		if(2100 <= count && count < 2700)
			playerInput[3] = start;
		if(2700 <= count && count < 3300)
			playerInput[4] = up;
		if(3300 <= count && count < 3900)
			playerInput[5] = down;
		if(3900 <= count && count < 4500)
			playerInput[6] = left;
		if(4500 <= count && count < 5100)
			playerInput[7] = right;
		
	
	end


endmodule
