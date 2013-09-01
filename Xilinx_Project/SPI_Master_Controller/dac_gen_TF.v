`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:24:05 10/26/2012
// Design Name:   DAC_TEST
// Module Name:   U:/ece3710/SPI_Master_Controller/dac_gen_TF.v
// Project Name:  SPI_Master_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DAC_TEST
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dac_gen_TF;

	// Inputs
	reg clk;
	reg count_test;
	reg reset;

	// Outputs
	wire [31:0] toSPI;
	wire toEnable;
	wire toReset;

	// Instantiate the Unit Under Test (UUT)
	DAC_TEST uut (
		.clk(clk), 
		//.count_test(count_test), 
		.reset(reset), 
		.toSPI(toSPI), 
		.toEnable(toEnable), 
		.toReset(toReset)
	);
always #2 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		count_test = 0;
		reset = 0;
		#10;
		reset = 1;
		#10;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

