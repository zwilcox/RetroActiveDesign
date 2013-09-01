`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:21 10/11/2012 
// Design Name: 
// Module Name:    ALUctrl 
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
module ALUctrl(
    input [1:0] ALUop,
    input [3:0] OPCodeExtension,
	 input [3:0] OPCode,
    output reg [2:0] ALUcontrol,
    output reg Ainv,
    output reg Binv,
    output reg Sub,
	 output reg ShiftImm
    );
	
	parameter RTYP = 2'b00;
	parameter ITYP = 2'b01;
	parameter SHFT = 2'b10;
	
	parameter ADD	= 4'b0101;
	parameter ADDU = 4'b0110;
	parameter ADDC = 4'b0111;
	parameter SUB 	= 4'b1001;
	parameter SUBC = 4'b1010;
	parameter CMP 	= 4'b1011;
	parameter AND	= 4'b0001;
	parameter OR	= 4'b0010;
	parameter XOR	= 4'b0011;
	
	always@(*) begin
		Ainv <= 0;
		ALUcontrol <= 3'b000;
		Binv <= 0;
		Sub <= 0;
		ShiftImm <= 0;
		case(ALUop)
			RTYP:
				case(OPCodeExtension)
					ADD:
						begin
							ALUcontrol <= 3'b000;
						end
					ADDU:
						begin
							ALUcontrol <= 3'b000;
						end
					ADDC:
						begin
							ALUcontrol <= 3'b000;
						end
					SUB:
						begin
							ALUcontrol <= 3'b000;
							Binv <= 1;
							Sub <= 1;
						end
					SUBC:
						begin
							ALUcontrol <= 3'b000;
							Binv <= 1;
							Sub <= 1;
						end
					CMP:
						begin
							ALUcontrol <= 3'b000;
							//Binv <= 1;
							//Sub <= 1;
						end
					AND:
						begin
							ALUcontrol <= 3'b001;
						end
					OR:
						begin
							ALUcontrol <= 3'b010;
						end
					XOR:
						begin
							ALUcontrol <= 3'b011;
						end
					default:
						begin
							ALUcontrol <= 3'b000;
						end
				endcase
			ITYP:
				case(OPCode)
					ADD:
						begin
							ALUcontrol <= 3'b000;
						end
					ADDU:
						begin
							ALUcontrol <= 3'b000;
						end
					ADDC:
						begin
							ALUcontrol <= 3'b000;
						end
					SUB:
						begin
							ALUcontrol <= 3'b000;
							Binv <= 1;
							Sub <= 1;
						end
					SUBC:
						begin
							ALUcontrol <= 3'b000;
							Binv <= 1;
							Sub <= 1;
						end
					CMP:
						begin
							ALUcontrol <= 3'b000;
							//Binv <= 1;
							//Sub <= 1;
						end
					AND:
						begin
							ALUcontrol <= 3'b001;
						end
					OR:
						begin
							ALUcontrol <= 3'b010;
						end
					XOR:
						begin
							ALUcontrol <= 3'b011;
						end
					default:
						begin
							ALUcontrol <= 3'b000;
						end
				endcase
			SHFT:
				case(OPCodeExtension)
					4'b0100:
						begin
							ALUcontrol <= 3'b101;
						end
					4'b0000:
						begin
							ALUcontrol <= 3'b101;
							ShiftImm <= 1;
						end
					4'b0001:
						begin
							ALUcontrol <= 3'b111;
							ShiftImm <= 1;
						end
					4'b0110:
						begin
							ALUcontrol <= 3'b101;
						end
					4'b0010:
						begin
							ALUcontrol <= 3'b101;
							ShiftImm <= 1;
						end
					4'b0011:
						begin
							ALUcontrol <= 3'b110;
							ShiftImm <= 1;
						end
					default:
						ALUcontrol <= 3'b000;
				endcase
			default:
				ALUcontrol <= 3'b000;
		endcase
	end
endmodule
