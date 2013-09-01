// Verilog test fixture created from schematic U:\ece3710\CR16\Asteroid_System.sch - Wed Nov 21 17:04:47 2012

`timescale 1ns / 1ps

module Asteroid_System_Asteroid_System_sch_tb();

// Inputs
   reg controller_data;
   reg Clock;
   reg [15:0] XLXN_68;
   reg [15:0] XLXN_69;
   reg reset;

// Output
   wire [11:0] XLXN_31;
   wire [11:0] XLXN_32;
   wire NES_Latch;
   wire NES_Pulse;
   wire SevenSegCat;
   wire [6:0] SevenSegs;
   wire [11:0] XLXN_57;
   wire [18:1] MP3Trig;
   wire hSync;
   wire vSync;
   wire red;
   wire green;
   wire blue;

// Bidirs

// Instantiate the UUT
   Asteroid_System UUT (
		.XLXN_31(XLXN_31), 
		.XLXN_32(XLXN_32), 
		.controller_data(controller_data), 
		.NES_Latch(NES_Latch), 
		.NES_Pulse(NES_Pulse), 
		.SevenSegCat(SevenSegCat), 
		.SevenSegs(SevenSegs), 
		.XLXN_57(XLXN_57), 
		.Clock(Clock), 
		.XLXN_68(XLXN_68), 
		.XLXN_69(XLXN_69), 
		.reset(reset), 
		.MP3Trig(MP3Trig), 
		.hSync(hSync), 
		.vSync(vSync), 
		.red(red), 
		.green(green), 
		.blue(blue)
   );
// Initialize Inputs
	always #10 Clock = ~Clock;
	always #100 controller_data = ~controller_data;
	
	initial begin
	controller_data = 1;
	Clock = 0;
	XLXN_68 = 0;
	XLXN_69 = 0;
	reset = 1;
	
	#100;
	
	reset = 0;
	

	
	end
	
	
endmodule
