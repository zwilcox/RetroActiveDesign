`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  RetroActive Design
// Engineer: Zachary Wilcox
// 
// Create Date:    15:33:35 11/21/2012 
// Design Name: 
// Module Name:    BitGen 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module receives the color of a glyph from the glyph generator.  It also
// receives information from the GlyphMap on which row to be displayed.  It then send the output
// to the screen.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BitGen(
input [3:0]		glyphCol, 
input [11:0] 	glyphR,
input [11:0] 	glyphG,
input [11:0] 	glyphB,
input [10:0] 	hCount,
input 			bright,
output reg 		red,
output reg 		green,
output reg 		blue
);

always@(*)
begin
	red 	<= 0;
	green <= 0;
	blue 	<= 0;
	if(bright)
		if(636 <= hCount)
		begin
			red 	<= 0;
			green <= 0;
			blue 	<= 0;
		end
		else
		begin
			//display colors of glyph
			red 	<= glyphR[11 - glyphCol];
			green <= glyphG[11 - glyphCol];
			blue 	<= glyphB[11 - glyphCol];
		end
end
endmodule
