`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:59 08/23/2008 
// Design Name: 
// Module Name:    exmem 
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
module exmem #(parameter WIDTH = 16, RAM_ADDR_BITS = 14)
   (input clk, en,
    input memwrite,
    input [RAM_ADDR_BITS-1:0] adr,
    input [WIDTH-1:0] writedata,
    output reg [WIDTH-1:0] memdata,
	 input pxlClk,
	 input [13:0] glyphAdd,
	 output reg [15:0] glyphData
    );

   reg [WIDTH-1:0] mips_ram [(2**RAM_ADDR_BITS)-1:0];



 // The following $readmemh statement is only necessary if you wish
 // to initialize the RAM contents via an external file (use
 // $readmemb for binary data). The fib.dat file is a list of bytes,
 // one per line, starting at address 0.  Note that in order to
 // synthesize correctly, fib.dat must have exactly 256 lines
 // (bytes). If that's the case, then the resulting bitstream will
 // correctly initialize the synthesized block RAM with the data. 
 
initial
$readmemb("testInitLevel.bin", mips_ram);

 // This "always" block simulates as a RAM, and synthesizes to a block
 // RAM on the Spartan-3E part. Note that the RAM is clocked. Reading
 // and writing happen on the rising clock edge. This is very important
 // to keep in mind when you're using the RAM in your system! 
   always @(posedge clk)
      if (en) begin
         if (memwrite)
            mips_ram[adr] <= writedata;
         memdata <= mips_ram[adr];
      end
		
   always @(posedge pxlClk)
      if (en) begin
         glyphData <= mips_ram[glyphAdd];
      end
							
						
endmodule
