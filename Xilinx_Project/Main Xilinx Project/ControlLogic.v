`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:33 10/17/2012 
// Design Name: 
// Module Name:    ControlLogic 
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
module ControlLogic(
    input [3:0] OPCode,
    input [3:0] OPCodeExtension,
	 input [3:0] JCond,
	 input [3:0] cond,
	 input reset,
	 input Clk,
	 output reg PCWrite,
	 output reg InstrWrite,
	 output reg RegWrite,
	 output reg [1:0] ALUop,
	 output reg [2:0] RegDataSRC,
	 output reg [1:0] ALUSrcB,
	 output reg MemWrite,
	 output reg SignExtend,
	 output reg SetF, 
	 output reg SetL, 
	 output reg SetC, 
	 output reg SetN, 
	 output reg SetZ,
	 output reg [1:0] PCSource,
	 output reg [15:0] SCond,
	 input [4:0] PSR_Value
    );
	 
	 
	reg [4:0] CurState;
	reg [4:0] NextState;
	
	reg SCond_Valid;
	reg Cond_Valid;
	wire C;
	wire L;
	wire F;
	wire Z;
	wire N; 
	
	assign C = PSR_Value[4];
	assign L = PSR_Value[3];
	assign F = PSR_Value[2];
	assign Z = PSR_Value[1];
	assign N = PSR_Value[0];
	
	//STATES
	parameter   IFETCH  	=	5'b00000; //INSTRUCTION FETCH          0
	parameter 	RFETCH	=	5'b00001; //REGISTER FETCH             1
	parameter	RTYPEX	= 	5'b00010; //General R-TYPE Executuion  2
	parameter	ITYPEX	=	5'b00011; //General I-TYPE Executuion  3
	parameter	MOVEX		= 	5'b00100; //MOV Executuion					4
	parameter	MOVIEX	=	5'b00101; //MOVI Executuion			5
	parameter	LUIEX		= 	5'b00110; //LUI Executuion			6
	parameter	LOADEX	= 	5'b00111; //LOAD Executuion		7
	parameter	STOREX	=	5'b01000; //STOR Executuion		8
	parameter	CMPEX 	=	5'b01001; //CMP Executuion			9
	parameter 	CMPIEX	=	5'b01010; //CMPI Executuion		10
	parameter	BRANEX	=	5'b01011; //Bcond Executuion		11
	parameter	JUMPEX	=	5'b01100; //Jcond Executuion		12
	parameter 	JALEX		=	5'b01101; //JAL Executuion			13
	parameter	RETEX		=	5'b01110; //RETX Exectution
	parameter	SEX		=	5'b01111; //Scond Execution
	parameter	MULEX		= 	5'b10000; //MULT Execution
	parameter	MULIEX	=	5'b10010; //MULTI Execution
	parameter	NOPEX		= 	5'b11111; //NOP Execution
	
	//OP CODES/CONDITION CODES/OP CODE EXTENSIONS:

	//Rtype opcode
	parameter 	RINSTR	= 4'b0000; //also includes MULT, MOV
	
	//Itype opcodes && rtype opcode extensions
	parameter 	ADDI		= 4'b0101;
	parameter 	ADDUI		= 4'b0110;
	parameter 	ADDCI		= 4'b0111;
	parameter 	SUBI 		= 4'b1001;
	parameter 	SUBCI		= 4'b1010;
	parameter 	CMPI 		= 4'b1011;
	parameter 	ANDI		= 4'b0001;
	parameter 	ORI		= 4'b0010;
	parameter 	XORI		= 4'b0011;
	parameter 	MULI 		= 4'b1110;
	
	//others other opcodes
	parameter	MOVI		= 4'b1101;	//also opcode extension for mov
	parameter	LUI		= 4'b1111;
	parameter	LDSTORJ	= 4'b0100;
	parameter	BRAN		= 4'b1100;

	
	//jump conditions:
	
	parameter EQ = 4'b0000;
	parameter NE = 4'b0001;
	parameter GE = 4'b1101;
	parameter CS = 4'b0010;
	parameter CC = 4'b0011;
	parameter HI = 4'b0100;
	parameter LS = 4'b0101;
	parameter LO = 4'b1010;
	parameter HS = 4'b1011;
	parameter Gt = 4'b0110; //apparently capital 'GT' is reserved for something in verilog.. Hence 'Gt' instead.
	parameter LE = 4'b0111;
	parameter FS = 4'b1000;
	parameter FC = 4'b1001;
	parameter LT = 4'b1100;
	parameter UC = 4'b1110;
	parameter NJ = 4'b1111;
	
	always@(*) begin
		Cond_Valid = 0;
		case(JCond)
			EQ: if (Z) 			Cond_Valid = 1;
			NE: if (!Z) 		Cond_Valid = 1;
			GE: if (N || Z)	Cond_Valid = 1;
			CS: if (C) 			Cond_Valid = 1;
			CC: if (!C)			Cond_Valid = 1;
			HI: if (L)			Cond_Valid = 1;
			LS: if (!L)			Cond_Valid = 1;
			LO: if (!L && !Z) Cond_Valid = 1;
			HS: if (L || Z)	Cond_Valid = 1;
			Gt: if (N)			Cond_Valid = 1;
			LE: if (!N)			Cond_Valid = 1;
			FS: if (F)			Cond_Valid = 1;
			FC: if (!F)			Cond_Valid = 1;
			LT: if (!N && !Z) Cond_Valid = 1;
			UC:					Cond_Valid = 1;
			default:				Cond_Valid = 0; //default.
		endcase
	end
		
	always@(*) begin
		SCond_Valid = 0;
		case(cond)
			EQ: if (Z) 			SCond_Valid = 1;
			NE: if (!Z) 		SCond_Valid = 1;
			GE: if (N || Z)	SCond_Valid = 1;
			CS: if (C) 			SCond_Valid = 1;
			CC: if (!C)			SCond_Valid = 1;
			HI: if (L)			SCond_Valid = 1;
			LS: if (!L)			SCond_Valid = 1;
			LO: if (!L && !Z) SCond_Valid = 1;
			HS: if (L || Z)	SCond_Valid = 1;
			Gt: if (N)			SCond_Valid = 1;
			LE: if (!N)			SCond_Valid = 1;
			FS: if (F)			SCond_Valid = 1;
			FC: if (!F)			SCond_Valid = 1;
			LT: if (!N && !Z) SCond_Valid = 1;
			UC:					SCond_Valid = 1;
			default:				SCond_Valid = 0; //default.
		endcase	
	end
	
	always@(posedge Clk) begin
		if (reset) CurState <= IFETCH;
		else CurState <= NextState;
	end
	
	//output logic
	always@(*) begin
		InstrWrite = 0;
		ALUSrcB = 2;
		RegDataSRC = 0;
		RegWrite = 0;
		PCWrite = 0;
		ALUop = 2'b00;
		MemWrite = 0;
		SignExtend = 0;
		SetC = 0;
		SetL = 0;
		SetF = 0;
		SetZ = 0;
		SetN = 0;
		PCSource = 0;
		SCond = 0;
		case (CurState)
			IFETCH:
				begin
					InstrWrite = 1;
					ALUSrcB = 2;
				end
			RFETCH:
				begin
					//wait 1 clock cycle
				end
			RTYPEX:
				begin
					RegDataSRC = 0;
					ALUSrcB = 1;
					ALUop = 2'b00;
					RegWrite = 1;
					PCWrite = 1;
					case(OPCodeExtension)
						ADDI:
							begin
								SetC = 1;
								SetF = 1;
							end
						ADDCI:
							begin
								SetF = 1;
							end
						SUBI:
							begin
								SetC = 1;
								SetF = 1;
							end
						SUBCI:
							begin
								SetF = 1;
							end
						default: 
							begin 
							end
					endcase
				end
			ITYPEX:
				begin
					RegDataSRC = 0;
					ALUSrcB = 0;
					ALUop = 2'b01;
					RegWrite = 1;
					PCWrite =1;
					case (OPCode)
						ADDI:
							begin
								SignExtend = 1;
								SetC = 1;
								SetF = 1;
							end
						ADDUI:	
							begin 
								SignExtend = 1; 
							end
						ADDCI:
							begin 
								SignExtend = 1;
								SetF = 1;								
							end
						SUBI:	
							begin 
								SignExtend = 1;
								SetC = 1;
								SetF = 1;								
							end
						SUBCI:
							begin 
								SignExtend = 1; 
								SetF = 1;
							end
						default:	
							begin 
								SignExtend = 0; 
							end
					endcase
				end
			MOVEX:
				begin
					RegDataSRC = 4;
					RegWrite = 1;
					PCWrite = 1;
				end
			MOVIEX:
				begin
					RegDataSRC = 2;
					RegWrite = 1;
					PCWrite =1;
				end
			LUIEX:
				begin
					RegDataSRC = 3;
					RegWrite = 1;
					PCWrite = 1;
				end
			LOADEX:
				begin
					ALUSrcB = 1;
					RegDataSRC = 1;
					RegWrite = 1;
					PCWrite = 1;
				end
			STOREX:
				begin
					ALUSrcB = 1;
					MemWrite = 1;
					PCWrite = 1;
				end
			NOPEX:
				begin
					PCWrite = 1;
				end
			CMPEX:
				begin
					PCWrite = 1;
					ALUSrcB = 1;
					SetZ = 1;
					SetL = 1;
					SetN = 1;
				end
			CMPIEX:
				begin
					PCWrite = 1;
					ALUSrcB = 0;
					SignExtend = 1;
					SetZ = 1;
					SetL = 1;
					SetN = 1;
				end
			BRANEX:
				begin
					PCWrite = 1;
					if (Cond_Valid) begin
						PCSource = 2;
						SignExtend = 1;
					end
				end
			JUMPEX:
				begin
					PCWrite = 1;
					if (Cond_Valid) PCSource = 1;
				end
			JALEX:
				begin
					PCWrite = 1;
					RegWrite = 1;
					RegDataSRC = 5;
					PCSource = 1;
				end
			RETEX:
				begin
					PCWrite = 1;
					PCSource = 1;
				end
			SEX:
				begin
					PCWrite = 1;
					RegWrite = 1;
					RegDataSRC = 7;
					if (SCond_Valid)
						SCond = 1;
					else
						SCond = 0;
				end
			MULEX:
				begin
					ALUSrcB = 1;
					PCWrite = 1;
					RegWrite = 1;
					RegDataSRC = 6;
				end
			MULIEX:
				begin
					ALUSrcB = 0;
					SignExtend = 1;
					PCWrite = 1;
					RegWrite = 1;
					RegDataSRC = 6;
				end
			default: begin end
		endcase
	end
	
	//nextstate logic
	always @(*) begin
		case (CurState)
			IFETCH:	NextState <= RFETCH;
			RFETCH:
				case(OPCode)
					RINSTR:
						case(OPCodeExtension)
							4'b1101:
								NextState <= MOVEX;		//MOVE
							4'b1110:
								NextState <= MULEX;		//MULTIPLY
							4'b0000:
								NextState <= NOPEX; 		//NOP NOP NOP NOP NOP NOP
							4'b1011:
								NextState <= CMPEX;		//COMPARE
							default:
								NextState <= RTYPEX;
						endcase
					ADDI:		NextState <= ITYPEX;
					ADDUI:	NextState <= ITYPEX;
					ADDCI:	NextState <= ITYPEX;
					SUBI:		NextState <= ITYPEX;
					SUBCI:	NextState <= ITYPEX;
					CMPI:		NextState <= CMPIEX;
					ANDI:		NextState <= ITYPEX;
					ORI:		NextState <= ITYPEX;
					XORI:		NextState <= ITYPEX;
					MOVI:		NextState <= MOVIEX;
					LUI:		NextState <= LUIEX;
					MULI:		NextState <= MULIEX;
					LDSTORJ:	
						case(OPCodeExtension)
							4'b0000:			//LOAD
								NextState <= LOADEX;
							4'b0100:			//STORE
								NextState <= STOREX;
							4'b1100:			//JUMP
								NextState <= JUMPEX;
							4'b1000:			//JAL
								NextState <= JALEX;
							4'b1001:			//RETX
								NextState <= RETEX;
							4'b1101:			//Scond
								NextState <= SEX;
							default:
								NextState <= IFETCH;
						endcase
					BRAN:		NextState <= BRANEX;
					default:	NextState <= IFETCH;
				endcase
			default:	NextState <= IFETCH;
		endcase
	end
endmodule
