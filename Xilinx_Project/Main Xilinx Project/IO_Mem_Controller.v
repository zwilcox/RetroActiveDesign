`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RetroActive Design
// Engineer: Zachary Wilcox
// This is a memory controller for the pac-man object.  It redirects calls made to memory
// address in the IO range to the proper IO devices.  Otherwise it send the request to 
// memory.  
// Create Date:    15:51:59 11/08/2012 
// Design Name: 
// Module Name:    IO_Mem_Controller 
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
module IO_Mem_Controller(
    input clk,
	 
    input MemWrite_IN,
	 input [15:0] ADDR_IN,
    input [15:0] DATA_IN,
    input [15:0] ReadData_IN,
	 input PacmanCountRdy,
	 input Ghost1CountRdy,
	 input Ghost2CountRdy,
	 input Ghost3CountRdy,
	 input Ghost4CountRdy,
	 input DrawTimerCountRdy,
	 input MouthTimerCountRdy,
	 input GhostFlashCountRdy,
	 input ScatterModeCountRdy,
	 
	 output reg MemWrite_OUT,
	 output reg [13:0] ADDR_OUT,
    output reg [15:0] DATA_OUT,
	 output reg [15:0] ReadData_OUT,
	 output reg [15:0] PacmanToCount,
	 output reg [15:0] Ghost1ToCount,
	 output reg [15:0] Ghost2ToCount,
	 output reg [15:0] Ghost3ToCount,
	 output reg [15:0] Ghost4ToCount,
	 output reg [15:0] DrawTimerToCount,
	 output reg [15:0] MouthTimerToCount,
	 output reg [15:0] GhostFlashToCount,
	 output reg [15:0] ScatterModeToCount,
    
    input [7:0] NES_IN,
	 input [7:0] NES_IN2,
    
	 input [2:0] count3,
	 
	 output reg [5:0] MP3Trig_OUT,
    output reg [11:0] DACA_OUT,
    output reg [11:0] DACB_OUT,
    output reg [11:0] DACC_OUT,
	 output reg [7:0]	led7Seg_OUT
    );
	 

		reg [7:0] led7Seg;
		reg [5:0] MP3Trig;
		always@(*)
		begin
			led7Seg 					<= 0;
			MemWrite_OUT 			<= 0;
			ADDR_OUT 				<= 0;
			DATA_OUT 				<= 0;
			MemWrite_OUT			<= 0;
			ReadData_OUT			<= 0;
			MP3Trig					<= 0;
			DACA_OUT					<= 0;
			DACB_OUT					<= 0;
			DACC_OUT					<= 0;
			PacmanToCount			<= 0;
			Ghost1ToCount			<= 0;
			Ghost2ToCount			<= 0;
			Ghost3ToCount			<= 0;
			Ghost4ToCount			<= 0;
			DrawTimerToCount		<= 0;
			MouthTimerToCount   	<= 0;
			GhostFlashToCount   	<= 0;
			ScatterModeToCount  	<= 0;
			case(ADDR_IN)
				65535 	:	begin //A #FFFF  				255 255
									ReadData_OUT <=	{{15'b0},{NES_IN[0]}};
								end
				65534		:	begin //B #FFFE  				255 254
									ReadData_OUT <=	{{15'b0},{NES_IN[1]}};
								end
				65533		:	begin // SELECT #FFFD		255 253
									ReadData_OUT <=	{{15'b0},{NES_IN[2]}};
								end
				65532		:	begin //START #FFFC			255 252
									ReadData_OUT <=	{{15'b0},{NES_IN[3]}};
								end
				65531 	:	begin //UP #FFFB				255 251
									ReadData_OUT <=	{{15'b0},{NES_IN[4]}};
								end
				65530		:	begin //DOWN #FFFA			255 250
									ReadData_OUT <=	{{15'b0},{NES_IN[5]}};
								end		
				65529		:	begin // LEFT #FFF9			255 249
									ReadData_OUT <=	{{15'b0},{NES_IN[6]}};
								end
				65528		:	begin //RIGHT #FFF8			255 248
									ReadData_OUT <=	{{15'b0},{NES_IN[7]}};
								end
				65527		:	begin							// 255 247
									if(MemWrite_IN)
										MP3Trig <= DATA_IN;
								end
				65526		:	begin //right to dac A		255 246
									if(MemWrite_IN)
										DACA_OUT <= DATA_IN;
								end
				65525		:	begin //write to Dac B		255 245
									if(MemWrite_IN)
										DACB_OUT <= DATA_IN;
								end
				65524		:	begin //write to DAC c		255 244
									if(MemWrite_IN)
										DACC_OUT <= DATA_IN;
								end
									
				65523		:	begin											// 255 243
									if(MemWrite_IN) //writing to counter 2
										PacmanToCount	<= DATA_IN;
								end
				65522 	:	begin  //reading from counter 1		//255 242
										ReadData_OUT <= PacmanCountRdy;
								end
				
				65521		:	begin											// 255 241
									if(MemWrite_IN) //writing to counter 2
										Ghost1ToCount	<= DATA_IN;
								end
				65520 	:	begin  //reading from counter 1		// 255 240
										ReadData_OUT <= Ghost1CountRdy;
								end
								
				65519		:	begin											//255 239
									if(MemWrite_IN) //writing to counter 2
										Ghost2ToCount	<= DATA_IN;
								end
				65518 	:	begin  //reading from counter 1		//255 238
										ReadData_OUT <= Ghost2CountRdy;
								end
								
				65517		:	begin											//255 237
									if(MemWrite_IN) //writing to counter 2
										Ghost3ToCount	<= DATA_IN;
								end
				65516 	:	begin  //reading from counter 1		//255 236
										ReadData_OUT <= Ghost3CountRdy;
								end
								
				65515		:	begin											//255 235
									if(MemWrite_IN) //writing to counter 2
										Ghost4ToCount	<= DATA_IN;
								end
				65514 	:	begin  //reading from counter 1		//255 234
										ReadData_OUT <= Ghost4CountRdy;
								end
								
				65513		:	begin											//255 233
									if(MemWrite_IN) //writing to counter 2
										DrawTimerToCount	<= DATA_IN;
								end
				65512 	:	begin  //reading from counter 1		//255 232
										ReadData_OUT <= DrawTimerCountRdy;
								end
								
				65511		:	begin											//255 231
									if(MemWrite_IN) //writing to counter 2
										MouthTimerToCount	<= DATA_IN;
								end
				65510 	:	begin  //reading from counter 1		//255 230
										ReadData_OUT <= MouthTimerCountRdy;
								end
				
				65509		:	begin											//255 229
									if(MemWrite_IN) //writing to counter 2
										GhostFlashToCount	<= DATA_IN;
								end
				65508 	:	begin  //reading from counter 1		//255 228
										ReadData_OUT <= GhostFlashCountRdy;
								end
								
				65507		:	begin											//255 227
									if(MemWrite_IN) //writing to counter 2
										ScatterModeToCount	<= DATA_IN;
								end
				65506 	:	begin  //reading from counter 1		//255 226
										ReadData_OUT <= ScatterModeCountRdy;
								end
				13201		:	begin
									led7Seg 			<= DATA_IN[7:0];
									MemWrite_OUT 	<= MemWrite_IN;
									ADDR_OUT 		<= ADDR_IN;
									DATA_OUT 		<= DATA_IN;
									MemWrite_OUT	<= MemWrite_IN;
									ReadData_OUT	<= ReadData_IN;
								end
//				65526		:  begin
//									led7Seg			<= DATA_IN[7:0];
//								end
								
								
								
								
				65505 	:	begin //A # 				255 225
									ReadData_OUT <=	{{15'b0},{NES_IN2[0]}};
								end
				65504		:	begin //B   				255 224
									ReadData_OUT <=	{{15'b0},{NES_IN2[1]}};
								end
				65503		:	begin // SELECT 		255 223
									ReadData_OUT <=	{{15'b0},{NES_IN2[2]}};
								end
				65502		:	begin //START 			255 222
									ReadData_OUT <=	{{15'b0},{NES_IN2[3]}};
								end
				65501 	:	begin //UP 				255 221
									ReadData_OUT <=	{{15'b0},{NES_IN2[4]}};
								end
				65500		:	begin //DOWN 			255 220
									ReadData_OUT <=	{{15'b0},{NES_IN2[5]}};
								end		
				65499		:	begin // LEFT 			255 219
									ReadData_OUT <=	{{15'b0},{NES_IN2[6]}};
								end
				65498		:	begin //RIGHT 			255 218
									ReadData_OUT <=	{{15'b0},{NES_IN2[7]}};	
								end
								
								
				65497		:	begin //RIGHT 			255 217
									ReadData_OUT <=	count3;	
								end
				default	:	begin
									MemWrite_OUT 	<= MemWrite_IN;
									ADDR_OUT 		<= ADDR_IN;
									DATA_OUT 		<= DATA_IN;
									MemWrite_OUT	<= MemWrite_IN;
									ReadData_OUT	<= ReadData_IN;
								end
			endcase
		end
	//Reg Output to the user.  Otherwise they will only be displayed for a clock cycle
		always@(posedge clk)
		begin
			if(MemWrite_IN && ADDR_IN == 13201) //65526
				led7Seg_OUT <= led7Seg;
		end
		
		always@(posedge clk)
		begin
			if(MemWrite_IN && ADDR_IN == 65527)
				MP3Trig_OUT <= MP3Trig;
		end

endmodule
