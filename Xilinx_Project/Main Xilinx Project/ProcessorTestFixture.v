				// Verilog test fixture created from schematic U:\ece3710\CR16\Processor.sch - Thu Oct 18 18:11:21 2012

`timescale 1ns / 1ps

module Processor_Processor_sch_tb();

// Inputs
   reg Clk;
   reg Reset;
   reg [15:0] ALUAinput3;

// Output
   wire C;
   wire L;
   wire F;
   wire Z;
   wire N;

// Bidirs

// Instantiate the UUT
   Processor UUT (
		.C(C), 
		.L(L), 
		.F(F), 
		.Z(Z), 
		.N(N), 
		.Clk(Clk), 
		.Reset(Reset), 
		.ALUAinput3(ALUAinput3)
   );
// Initialize Inputs
	initial begin
		Clk = 0;
		ALUAinput3 = 0;
		Reset = 1;
		#50;
		Reset = 0;


	end
	
	always #10 Clk = ~Clk;
endmodule
