`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:36 10/09/2012 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
   input [15:0] aInput,
   input [15:0] bInput,
   input [2:0] opCode,
   input sub,
   input aInvert,
   input bInvert,
	input ShiftImm,
   output [15:0] res,
	output [4:0] CLFZN    // Todd changed ALU flags to a bus
   );
	
	reg [15:0] A; //rsrc
	reg [15:0] B; //rdest
	
	reg [15:0] aluResult;
	
	assign res = aluResult;

	// Todd changed this to a bus
	
	//fixed flag logic
	assign CLFZN[0] = ($signed(A) < $signed(B)); 										//N
	assign CLFZN[1] = (A == B); 													//Z
	assign CLFZN[2] = (A[15] == B[15]) && (aluResult[15] != A[15]);				//F
	assign CLFZN[3] = (A < B);																	//L
	assign CLFZN[4] = (A[15] && B[15]) || (!aluResult[15] && ( (!A[15] && B[15]) || (A[15] && !B[15]))); //C
	
	
	always @(*) begin
		if (aInvert) A = ~aInput;
		else A = aInput;
		
		if (bInvert) B = ~bInput;
		else B = bInput;
	end
	
	always@(*) begin
		case (opCode) 
			3'b000:	
				begin
					aluResult = A + B + sub; // Add/Subtract	
				end
			3'b001:			
				begin
					aluResult = A & B;		// AND
				end
			3'b010:
				begin
					aluResult = A | B;		// OR
				end
			3'b011:
				begin
					aluResult = A ^ B;		// XOR
				end
			3'b101:								
				begin
					if (!ShiftImm && B>=15)
						aluResult = A <<< 15;
					else
						case(B[3:0])
							0: aluResult = A <<< 0;
							1: aluResult = A <<< 1;
							2: aluResult = A <<< 2;
							3: aluResult = A <<< 3;
							4: aluResult = A <<< 4;
							5: aluResult = A <<< 5;
							6: aluResult = A <<< 6;
							7: aluResult = A <<< 7;
							8: aluResult = A <<< 8;
							9: aluResult = A <<< 9;
							10: aluResult = A <<< 10;
							11: aluResult = A <<< 11;
							12: aluResult = A <<< 12;
							13: aluResult = A <<< 13;
							14: aluResult = A <<< 14;
							15: aluResult = A <<< 15;
							default: aluResult = A <<< 0;
						endcase
				end
			3'b110:								
				begin
					if (!ShiftImm && B>=15)
						aluResult = A >>> 15;
					else
						case(B[3:0])
							0: aluResult = A >>> 0;
							1: aluResult = A >>> 1;
							2: aluResult = A >>> 2;
							3: aluResult = A >>> 3;
							4: aluResult = A >>> 4;
							5: aluResult = A >>> 5;
							6: aluResult = A >>> 6;
							7: aluResult = A >>> 7;
							8: aluResult = A >>> 8;
							9: aluResult = A >>> 9;
							10: aluResult = A >>> 10;
							11: aluResult = A >>> 11;
							12: aluResult = A >>> 12;
							13: aluResult = A >>> 13;
							14: aluResult = A >>> 14;
							15: aluResult = A >>> 15;
							default: aluResult = A >>> 0;
						endcase
				end
			3'b111:
				begin
					if (!ShiftImm && B>=15)
						aluResult = A >> 15;
					else
						case(B[3:0])
							0: aluResult = A >> 0;
							1: aluResult = A >> 1;
							2: aluResult = A >> 2;
							3: aluResult = A >> 3;
							4: aluResult = A >> 4;
							5: aluResult = A >> 5;
							6: aluResult = A >> 6;
							7: aluResult = A >> 7;
							8: aluResult = A >> 8;
							9: aluResult = A >> 9;
							10: aluResult = A>> 10;
							11: aluResult = A >> 11;
							12: aluResult = A >> 12;
							13: aluResult = A >> 13;
							14: aluResult = A >> 14;
							15: aluResult = A >> 15;
							default: aluResult = A >> 0;
						endcase
				end
			default: 
				begin
					aluResult = 0;						//	Wat, why did this happen???
				end
		endcase
	end
	
endmodule
