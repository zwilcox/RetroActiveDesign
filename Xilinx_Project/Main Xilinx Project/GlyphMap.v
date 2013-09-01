`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RetroActive Design
// Engineer: Zachary Wilcox 
// 
// Create Date:    10:33:15 11/17/2012 
// Design Name: 
// Module Name:    FrameBuffer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: The module keeps track of what row and column the VGA controller is "displaying"
// It uses this to calculate what glyph the GlyphGen needs to generate.  It also sends the  
// correct row information to the BitGen to display the proper color to the VGA screen.
// Our project uses a 12x12 pixel glyph.  This is why we increment the horizonatal and vertical
// count by 12. 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GlyphMap(
    input [10:0] hCount,
    input [10:0] vCount,
	 input clock,
	 input enable,
	 output reg [3:0] glyphRow,
	 output reg [3:0] glyphCol,
    output [13:0] address
    );

	 reg [5:0] col;
	 reg [5:0] row;
 
 //12x12 pixels, count every 12 rows and 12 columns
always@(*)
begin
		col = 0;
		row = 0;
		if(0 <= hCount && hCount < 12)
			col = 0;
		else if(12 <= hCount && hCount < 24)
			col = 1;
		else if(24 <= hCount && hCount < 36)
			col = 2;	
		else if(36 <= hCount && hCount < 48)
			col = 3;
		else if(48 <= hCount && hCount < 60)
			col = 4;
		else if(60 <= hCount && hCount < 72)
			col = 5;
		else if(72 <= hCount && hCount < 84)
			col = 6;			
		else if(84 <= hCount && hCount < 96)
			col = 7;			
		else if(96 <= hCount && hCount < 108)
			col = 8;	
		else if(108 <= hCount && hCount < 120)
			col = 9;	
			
		else if(120 <= hCount && hCount < 132)
			col = 10;		
		else if(132 <= hCount && hCount < 144)
			col = 11;
		else if(144 <= hCount && hCount < 156)
			col = 12;	
		else if(156 <= hCount && hCount < 168)
			col = 13;
		else if(168 <= hCount && hCount < 180)
			col = 14;
		else if(180 <= hCount && hCount < 192)
			col = 15;
		else if(192 <= hCount && hCount < 204)
			col = 16;			
		else if(204 <= hCount && hCount < 216)
			col = 17;			
		else if(216 <= hCount && hCount < 228)
			col = 18;	
		else if(228 <= hCount && hCount < 240)
			col = 19;	

					
		else if(240 <= hCount && hCount < 252)
			col = 20;
		else if(252 <= hCount && hCount < 264)
			col = 21;	
		else if(264 <= hCount && hCount < 276)
			col = 22;
		else if(276 <= hCount && hCount < 288)
			col = 23;
		else if(288 <= hCount && hCount < 300)
			col = 24;
		else if(300 <= hCount && hCount < 312)
			col = 25;	
			
		else if(312 <= hCount && hCount < 324)
			col = 26;			
		else if(324 <= hCount && hCount < 336)
			col = 27;	
		else if(336 <= hCount && hCount < 348)
			col = 28;	
			
		else if(348 <= hCount && hCount < 360)
			col = 29;		
		else if(360 <= hCount && hCount < 372)
			col = 30;
		else if(372 <= hCount && hCount < 384)
			col = 31;	
		else if(384 <= hCount && hCount < 396)
			col = 32;
		else if(396 <= hCount && hCount < 408)
			col = 33;
		else if(408 <= hCount && hCount < 420)
			col = 34;
		else if(420 <= hCount && hCount < 432)
			col = 35;			
		else if(432 <= hCount && hCount < 444)
			col = 36;			
		else if(444 <= hCount && hCount < 456)
			col = 37;	
		else if(456 <= hCount && hCount < 468)
			col = 38;
			
		else if(468 <= hCount && hCount < 480)
			col = 39;
		else if(480 <= hCount && hCount < 492)
			col = 40;	
		else if(492 <= hCount && hCount < 504)
			col = 41;
		else if(504 <= hCount && hCount < 516)
			col = 42;
		else if(516 <= hCount && hCount < 528)
			col = 43;
		else if(528 <= hCount && hCount < 540)
			col = 44;			
		else if(540 <= hCount && hCount < 552)
			col = 45;			
		else if(552 <= hCount && hCount < 564)
			col = 46;	
		else if(564 <= hCount && hCount < 576)
			col = 47;	
			
		else if(576 <= hCount && hCount < 588)
			col = 48;		
		else if(588 <= hCount && hCount < 600)
			col = 49;
		else if(590 <= hCount && hCount < 612)
			col = 50;
		else if(612 <= hCount && hCount < 624)
			col = 51;
		else if(624 <= hCount && hCount < 636)
			col = 52;			



		if(0 <= vCount && vCount < 12)
			row = 0;
		else if(12 <= vCount && vCount < 24)
			row = 1;
		else if(24 <= vCount && vCount < 36)
			row = 2;	
		else if(36 <= vCount && vCount < 48)
			row = 3;
		else if(48 <= vCount && vCount < 60)
			row = 4;
		else if(60 <= vCount && vCount < 72)
			row = 5;
		else if(72 <= vCount && vCount < 84)
			row = 6;			
		else if(84 <= vCount && vCount < 96)
			row = 7;			
		else if(96 <= vCount && vCount < 108)
			row = 8;	
		else if(108 <= vCount && vCount < 120)
			row = 9;	
			
		else if(120 <= vCount && vCount < 132)
			row = 10;		
		else if(132 <= vCount && vCount < 144)
			row = 11;
		else if(144 <= vCount && vCount < 156)
			row = 12;	
		else if(156 <= vCount && vCount < 168)
			row = 13;
		else if(168 <= vCount && vCount < 180)
			row = 14;
		else if(180 <= vCount && vCount < 192)
			row = 15;
		else if(192 <= vCount && vCount < 204)
			row = 16;			
		else if(204 <= vCount && vCount < 216)
			row = 17;			
		else if(216 <= vCount && vCount < 228)
			row = 18;	
		else if(228 <= vCount && vCount < 240)
			row = 19;	

					
		else if(240 <= vCount && vCount < 252)
			row = 20;
		else if(252 <= vCount && vCount < 264)
			row = 21;	
		else if(264 <= vCount && vCount < 276)
			row = 22;
		else if(276 <= vCount && vCount < 288)
			row = 23;
		else if(288 <= vCount && vCount < 300)
			row = 24;
		else if(300 <= vCount && vCount < 312)
			row = 25;	
			
		else if(312 <= vCount && vCount < 324)
			row = 26;			
		else if(324 <= vCount && vCount < 336)
			row = 27;	
		else if(336 <= vCount && vCount < 348)
			row = 28;	
			
		else if(348 <= vCount && vCount < 360)
			row = 29;		
		else if(360 <= vCount && vCount < 372)
			row = 30;
		else if(372 <= vCount && vCount < 384)
			row = 31;	
		else if(384 <= vCount && vCount < 396)
			row = 32;
		else if(396 <= vCount && vCount < 408)
			row = 33;
		else if(408 <= vCount && vCount < 420)
			row = 34;
		else if(420 <= vCount && vCount < 432)
			row = 35;			
		else if(432 <= vCount && vCount < 444)
			row = 36;			
		else if(444 <= vCount && vCount < 456)
			row = 37;	
		else if(456 <= vCount && vCount < 468)
			row = 38;
			
		else if(468 <= vCount && vCount < 480)
			row = 39;
end


always@(posedge clock)
begin
	if (enable)
	begin
		if(vCount == 0 && hCount != 0)
			glyphRow <= 0;
		if(hCount == 639)
		begin
			if(glyphRow < 11)
				glyphRow <= glyphRow + 1;
			else
				glyphRow <= 0;
		end
		
	end
end

always@(posedge clock)
begin
	
	if(enable)
	begin
		glyphCol <= 0;
		if(hCount > 0)
		begin
			if( hCount >= (53 * 12))
				glyphCol <= 0;
			else if ( glyphCol >= 11)
				glyphCol <= 0;
			else
				glyphCol <= glyphCol + 1;
		end
	end	
	
end

//16383 is the bottom most memory address
//the glyphs starts here and decrements here
assign address = 16383 - (row * 53 + col);


endmodule
