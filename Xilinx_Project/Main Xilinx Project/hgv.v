// Verilog test fixture created from schematic U:\ece3710\CR16\Processor.sch - Thu Nov 01 16:54:04 2012

`timescale 1ns / 1ps

module Processor_Processor_sch_tb();

// Inputs
   reg Clk;
   reg Reset;
   reg [15:0] MULT;
   reg [15:0] ALUB_input3;
   reg [15:0] PCSource3;

// Output

// Bidirs

// Instantiate the UUT
   Processor UUT (
		.Clk(Clk), 
		.Reset(Reset), 
		.ALUB_input3(ALUB_input3), 
		.PCSource3(PCSource3)
   );
// Initialize Inputs
	initial begin
		Clk = 0;
		ALUB_input3 = 0;
		
		Reset = 1;
		#50;
		Reset = 0;

	end
	
	always #10 Clk = ~Clk;
	
endmodule
