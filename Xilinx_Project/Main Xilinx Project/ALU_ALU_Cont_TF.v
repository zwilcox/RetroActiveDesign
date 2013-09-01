// Verilog test fixture created from schematic U:\ece3710\CR16\ALU_ALUCont_test_schematic.sch - Mon Oct 15 16:48:00 2012

`timescale 1ns / 1ps

module ALU_ALUCont_test_schematic_ALU_ALUCont_test_schematic_sch_tb();

// Inputs
   reg [2:0] ALUop;
   reg [3:0] OpCodeExtention;
   reg [15:0] A;
   reg [15:0] B;

// Output
   wire [15:0] ALUResult;
   wire [4:0] CLFZN;

// Bidirs

// Instantiate the UUT
   ALU_ALUCont_test_schematic UUT (
		.ALUop(ALUop), 
		.OpCodeExtention(OpCodeExtention), 
		.A(A), 
		.B(B), 
		.ALUResult(ALUResult), 
		.CLFZN(CLFZN)
   );
// Initialize Inputs
	integer errorCount, i, k;
   initial begin
	// Initialize Inputs
		ALUop = 0;
		OpCodeExtention = 0;
		Op_errorCount = 0;    // Todd added 'Op_' prefix to differentiate 
		                      // arithmetic operation errors from flag errors
		Flag_errorCount = 0;  // Flag errors
		A = 0;
		B = 0;
	  CLFZN = 0;
	  
		// Wait 100 ns for global reset to finish
		#100;
      $display("Testing Add");
		for(i = 0; i < 512; i = i + 1)
		begin
			#10;	
			A = i;
			for(k = 0; k < 512; k = k + 1) 
			begin
				#10
				B = k;
				#10;
				if( (A + B) != ALUResult)
				begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A + B);
					Op_errorCount = Op_errorCount + 1;
				end
				
				// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
			end
		end	
		
		$display("Testing subtract");
		ALUop = 4;
		#100
		for(i = 0; i< 1024; i = i + 1)
		begin
			#10;
			{A, B} = i;
			#10;
			if( A - B != ALUResult)
			begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A - B);
					Op_errorCount = Op_errorCount + 1;
			end	
			
			// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
		end
		
		$display("Testing AND");
		ALUop = 1;
		#100
		for(i = 0; i< 1024; i = i + 1)
		begin
			#10;
			{A, B} = i;
			#10;
			if( A & B != ALUResult)
			begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A & B);
					Op_errorCount = Op_errorCount + 1;
			end	
			
			// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
		end
		
		$display("Testing OR");
		ALUop = 2;
		#100
		for(i = 0; i< 1024; i = i + 1)
		begin
			#10;
			{A, B} = i;
			#10;
			if( A | B != ALUResult)
			begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A | B);
					Op_errorCount = Op_errorCount + 1;
			end	
			
			// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
		end
		
		
		$display("Testing XOR");
		ALUop = 3;
		#100
		for(i = 0; i< 1024; i = i + 1)
		begin
			#10;
			{A, B} = i;
			#10;
			if( A ^ B != ALUResult)
			begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A ^ B);
					Op_errorCount = Op_errorCount + 1;
			end	
			
			// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
		end
		
		$display("Testing SLL");
		ALUop = 5;
		#100
		for(i = 0; i< 1024; i = i + 1)
		begin
			#10;
			{A, B} = i;
			#10;
			if( A << B != ALUResult)
			begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A << B);
					Op_errorCount = Op_errorCount + 1;
			end
			
			// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
					
		end
		
		$display("Testing SRA");
		ALUop = 5;
		#100
		for(i = 0; i< 1024; i = i + 1)
		begin
			#10;
			{A, B} = i;
			#10;
			if( A >>> B != ALUResult)
			begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A >>> B);
					Op_errorCount = Op_errorCount + 1;
			end	
			
			// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
		end

		$display("Testing SRL");
		ALUop = 7;
		#100
		for(i = 0; i< 2^32-1 ; i = i + 1)
		begin
			#10;
			{A, B} = i;
			#10;
			if( A >> B != ALUResult)
			begin
					#10;
					$display("There was an error. A is %d. B is %d, F is %d. F should be %d.", A, B, ALUResult, A >> B);
					errorCount = errorCount + 1;
			end	
			
			// Todd added the following test code for the ALU flags
				// they will be tested with each operation execution				
				if(CLFZN[0] != ($signed(A) > $signed(B)))
				  begin
				      #10
				      $display("There was an error. N is %d. N should be %d.", CLFZN[0], $signed(A) > $signed(B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				 
				if(CLFZN[1] != (A == B))
				  begin
				      #10
				      $display("There was an error. Z is %d. Z should be %d.", CLFZN[1], (A == B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[2] != (A[15] == B[15]) && (aluResult[15] != A[15]))
				  begin
				      #10
				      $display("There was an error. F is %d. F should be %d.", CLFZN[2], (A[15] == B[15]) && (aluResult[15] != A[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
				if(CLFZN[3] != (A > B))
				  begin
				      #10
				      $display("There was an error. L is %d. L should be %d.", CLFZN[3], (A > B));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				  
				if(CLFZN[4] != (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]))
				  begin
				      #10
				      $display("There was an error. C is %d. C should be %d.", CLFZN[4], (A[15] & B[15]) || ((A[15] | B[15]) && ~aluResult[15]));
				      Flag_errorCount = Flag_errorCount + 1;
				  end
				
		end
		
		
				$display("Testing finished.  Operation error count is %d, & Flag Error Count is %d", Op_errorCount, FLag_errorCount);	
	end
endmodule
