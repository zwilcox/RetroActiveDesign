`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:31:23 10/24/2012
// Design Name:   SPI_Master
// Module Name:   U:/ece3710/SPI_Master_Controller/SPI_Master_TF.v
// Project Name:  SPI_Master_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_Master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SPI_Master_TF;

	// Inputs
	reg clk;
	reg [31:0] ToSPI;
	reg enable;
	reg reset;

	// Outputs
	wire MOSI;
	wire SPI_CS;
	wire sClk;

	// Instantiate the Unit Under Test (UUT)
	SPI_Master uut (
		.clk(clk), 
		.sClk(sClk),
		.ToSPI(ToSPI), 
		.enable(enable), 
		.reset(reset), 
		.MOSI(MOSI), 
		.SPI_CS(SPI_CS)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ToSPI = 0;
		enable = 0;
		reset = 1;
		#5
		reset = 0;
		#5;
		reset = 1;
		#5;
		enable =1;
		ToSPI = 32'b10110011100011110000111110000010;
		        
		// Add stimulus here

	end
always#2 clk = ~clk;      
endmodule

