// Verilog test fixture created from schematic U:\ece3710\NESCONTROLLER\NES_To_LED.sch - Sat Nov 10 18:01:29 2012

`timescale 1ns / 1ps

module NES_To_LED_NES_To_LED_sch_tb();

// Inputs
   reg clock;
   reg reset;
   reg From_Controller;

// Output
   wire latch;
   wire pulse;
   wire [7:0] Buttons;

// Bidirs

// Instantiate the UUT
   NES_To_LED UUT (
		.clock(clock), 
		.latch(latch), 
		.pulse(pulse), 
		.Buttons(Buttons), 
		.reset(reset), 
		.From_Controller(From_Controller)
   );
// Initialize Inputs

	always #10 clock = ~clock;
	
   initial begin
		clock = 0;
		reset = 1;
		From_Controller = 0;
		
		#20;
		
		reset = 0;
	end
endmodule
