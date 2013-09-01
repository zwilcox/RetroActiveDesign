// Verilog test fixture created from schematic U:\ece3710\SPI_Master_Controller\to_dac_test.sch - Fri Oct 26 13:40:56 2012

`timescale 1ns / 1ps

module to_dac_test_to_dac_test_sch_tb();

// Inputs
   reg clock;
   reg reset;

// Output
   wire MOSI;
   wire sClk;
   wire SPI_CS;
   wire resetDac;

// Bidirs

// Instantiate the UUT
   to_dac_test UUT (
		.MOSI(MOSI), 
		.sClk(sClk), 
		.clock(clock), 
		.SPI_CS(SPI_CS), 
		.reset(reset), 
		.resetDac(resetDac)
   );
always #2 clock = ~clock;
	initial begin
		// Initialize Inputs
		clock = 0;
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