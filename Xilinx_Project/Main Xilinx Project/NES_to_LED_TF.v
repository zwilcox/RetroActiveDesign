// Verilog test fixture created from schematic C:\Users\Administrator\Desktop\ece3710\NESController\NES_To_LED.sch - Sat Oct 06 18:22:19 2012

`timescale 1ns / 1ps

module NES_To_LED_NES_To_LED_sch_tb();

// Inputs
   reg clock;
   reg reset;
   reg data;

// Output
   wire latch;
   wire pulse;
   wire [7:0] LED;

// Bidirs

// Instantiate the UUT
   NES_To_LED UUT (
		.clock(clock), 
		.latch(latch), 
		.pulse(pulse), 
		.LED(LED), 
		.reset(reset), 
		.data(data)
   );
// Initialize Inputs
	
   initial begin
		#10 clock = 0;
		#10 reset = 0;
		#10 reset = 1;
		#10 reset = 0;
		#10 data = 1;
		#100 data = 0;
	end
	always#2 clock = ~clock;
endmodule

