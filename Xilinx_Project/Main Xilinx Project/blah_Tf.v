`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:17:32 10/15/2012
// Design Name:   ALUctrl
// Module Name:   U:/ece3710/CR16/blah_Tf.v
// Project Name:  CR16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUctrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blah_Tf;

	// Inputs
	reg [2:0] ALUop;
	reg [3:0] OPCodeExtention;

	// Outputs
	wire [2:0] ALUcontrol;
	wire Ainv;
	wire Binv;
	wire Sub;

	// Instantiate the Unit Under Test (UUT)
	ALUctrl uut (
		.ALUop(ALUop), 
		.OPCodeExtention(OPCodeExtention), 
		.ALUcontrol(ALUcontrol), 
		.Ainv(Ainv), 
		.Binv(Binv), 
		.Sub(Sub)
	);
	integer errorCount, i;
	
	initial begin
		
		// Add stimulus here

	end
      
endmodule

