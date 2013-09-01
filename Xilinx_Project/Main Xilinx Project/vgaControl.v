`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 3710 
// Engineer: Ari Ferro, Zach Wilcox
// 
// Create Date:    13:47:58 09/22/2012 
// Design Name:	VGA/Firebird FSM
// Module Name:   vgaControl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module is a VGA controller.  It takes in a 50 MHz Clock and runs it
// in a clock divider, dividing it to a 25 MHz enable signal.  The horizontal timing is
// kept track by counting the number of enable signals comging from the clock divider.
// The vertical timing is kept track by counting horzzontal lines. When the horizontal
// count is in [143, 783), we are in the horizontal display area.  When the vertical
// count is in [31, 510), we are in the horzontal display area.  We are in the screen 
// display area if and only if BOTH the horziontal and vertical are in their display 
// area.  We output the current pixel when we're in the screen display area.  This is
// done by subtracting the  horizontal and vertical count with the number we're not in
// the display area.  
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vgaControl(
input clk, clear, // system clock and clear
output hSync,
output vSync, // sync signals to the VGA interface
output bright, // asserted when the pixel is bright
output reg enable,
output reg [10:0] hCount, vCount // horiz and vertical count (you pick the X!)
// these tell you where you are on the screen
    );


	reg count = 0;
	reg [11:0] XCount;
	reg [11:0] YCount;

	
	//everything is synchronous
	always@(posedge clk) begin
		//check to see if reset is pressed.  If so, reset cound and enable signal
		if(clear) begin
			count  <= 0;
			enable <= 0;
		end
	
		else begin
	
		//count the pos edge clocks, if we get to 2, send out an enable pulse
		//and start the count over
			
			if (count == 1) begin
				count  <= 0;
				enable <= 1;
			end
			else begin
				//increase count, reset enable pulse
					count <= 1;
					enable <= 0;
			end		
		end
	
	end
	// Set's up our horizontal and vertical counters
	always@(posedge clk) begin
		if (clear) begin
			XCount <= 799;
			YCount <= 520; 
			
		end
		else if(enable) begin
			XCount <= XCount + 1;
			// The count should be 799 when we've reached the front porch, back porch
			// pulse, and sync time.   Go to next line, restart horizontal count
			// increase veritcal count
			
			if(XCount >= 799) begin
				XCount <= 0;
				YCount <= YCount + 1;
			end
			//we've reached the bottom right of the screen when the vertical line
			//is 520 and reached end of horiztonal line
			//restart both counters to go back to top left corner
			if(YCount >= 520 && XCount == 799)
				YCount <= 0;
			
		end	
	end
	
	// Use both counters to figure out what stage we're in
	// This will return the horizontal pixel we're on
	always@(posedge clk) begin
		if(enable) begin
			hCount <= 0;
			// in the display area, figure out pixel by description above
			if(143 <= XCount && XCount < 783)
				hCount <= XCount - 143;
		end		
	end
	
	// Use both counters to figure out what pixel
	// This will return the vertical pixel we're on	
	always@(posedge clk) begin
		
		if(enable) begin
			vCount <= 0;
			// in the display area, figure out pixel by description above
			if(31 <= YCount && YCount < 510)
				vCount <= YCount - 31;
		end
	end
	
	//hSync is 0 when we need to reset
	// this resuls in a low signal at the beginning of our count
	// for the 96 clock ticks 
	assign hSync = !(0 <= XCount && XCount < 96);
	
	// vSync is 0 when we need to reset
	// this resuls in a low signal at the beginning of our line count
	// for the 2 horizontal lines
	assign vSync = !(YCount == 0 || YCount == 1);
	
	// Bright just indicates when we're in the screen display area.
	// we're in the screen area if and only if both the horizontal and vertical
	// lines are in the display area, as described above. 
	assign bright = (144 <= XCount && XCount < 784 && 31 <= YCount && YCount < 511);
	
	
	
endmodule
