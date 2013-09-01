`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:34:00 10/15/2012
// Design Name:   ALU
// Module Name:   U:/ece3710/CR16/ALU_TF.v
// Project Name:  CR16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TF;

	// Inputs - ALU
	reg [15:0] aInput;
	reg [15:0] bInput;

	// Inputs - ALUctrl
	reg [2:0] ALUop;
	reg [3:0] OPCodeExtention;


	// Outputs - ALU
	wire [15:0] aluResult;
	wire C;
	wire L;
	wire F;
	wire Z;
	wire N;
	

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.aInput(aInput), 
		.bInput(bInput), 	
		.aluResult(aluResult), 
		.C(C), 
		.L(L), 
		.F(F), 
		.Z(Z), 
		.N(N)
	);
	
		ALUctrl uut (
		.ALUop(ALUop), 
		.OPCodeExtention(OPCodeExtention), 
	);
	
	integer i;
	integer errorCount, k;

	initial begin
		// Initialize Inputs
		aInput = 0;
		bInput = 0;
		ALUop  = 0;
		OPCodeExtention = 0;
		errorCount = 0;
		
		// Wait 100 ns for global reset to finish
		
		
		#100
      $display("testing add"); 
		
		ALUOp = 0;
		for(i = 0; i < 512; i = i + 1)
		begin
			#10;	
			aInput = i;
			for(k = 0; k < 512; k = k + 1) 
			begin
				#10
				bInput = k;
				#10;
				if( (aInput + bInput) != aluResult)
				begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", aInput, bInput, aluResult, aInput + bInput);
					errorCount = errorCount + 1;
				end
			end
		end
		
		
		
		
		
		#10;
		ALUOp = 4;
		#10
		$display("testing subtract");
		for(i = 0; i < 512; i = i + 1)
		begin
			#10
			{aInput, bInput} = i;
			#10
				if( (aInput - bInput) != aluResult)
				begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", aInput, bInput, aluResult, aInput - bInput);
					errorCount = errorCount + 1;
				end
			
			#10;
		end
		$display("testing carry");
		for(i = 0; i < 512; i = i + 1)
		begin
			#10
			{aInput, bInput} = i;
			#10
				if( (aInput+ bInput) && CLFZN[4])
				begin
					#10;
					$display("A is %d. B is %d, F is %d.", aInput, bInput, aluResult);
				end
	
		end
		
		$display("Testing finished.  Error count is %d.", errorCount);	
		
	end
      
endmodule

