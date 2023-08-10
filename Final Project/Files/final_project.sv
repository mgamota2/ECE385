//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module final_project (

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
//      output             DRAM_CLK,
//      output             DRAM_CKE,
//      output   [12: 0]   DRAM_ADDR,
//      output   [ 1: 0]   DRAM_BA,
//      //inout    [15: 0]   DRAM_DQ,
//      output             DRAM_LDQM,
//      output             DRAM_UDQM,
//      output             DRAM_CS_N,
//      output             DRAM_WE_N,
//      output             DRAM_CAS_N,
//      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      input    [15: 0]   ARDUINO_IO,
      //inout              ARDUINO_RESET_N ,
		
		//GPS//
		input serial_data_in,
							
		output [7:0] lon_min,
		output [7:0] lat_min,
		output correct,
		output finished,
		output [3:0] message,
		output [7:0] uart_rx,
		output done,
		output [3:0] timestamp[4]
		

);




logic Reset_h, vssig, blank, VGA_Clk;

//Write port
logic [15:0] location_w;
logic [7:0] addr_w;
logic [15:0] time_w;

//Read port
logic [15:0] location_r;
logic [7:0] addr_r;
logic [15:0] time_r;

//Hex driver data
logic [3:0] hex_data[5];



//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [3:0] Red, Blue, Green;

//=======================================================
//  Structural coding
//=======================================================

	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	logic user_on;	  
	int Size;
	logic [11:0] DistX, DistY;
	
	//i is longitude(0,9), j is latitude (0,12)

	
	assign Size = 5;	
	
//Record data
always_ff @ (posedge correct) begin
if (SW[0] & ~SW[1]) begin
    if (message == 4'b0010) begin
      addr_w = addr_w + 1'b1;
    end
    else addr_w = addr_w;
end
else begin
	addr_w=0;
end
end

always_ff @ (negedge KEY[1]) begin
	if (SW[1] & ~SW[0]) addr_r = addr_r +1'b1;
	else if (~SW[1] & ~SW[0]) addr_r=0;
	else addr_r <= addr_r;
end


//Draw the locations visited (Read mode)
always_comb begin
if (SW[1] & ~SW[0]) begin
		//Plot mode				
		DistX = drawxsig - ((location_r[15:8]-43)*(-71)); //Longitude might also have to subtract 39 from value, issue with position being shifted
		DistY = drawysig - ((location_r[7:0]-58)*(-40)); //Latitude
		
		if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
			user_on = 1'b1;
		else 
			user_on = 1'b0;
		 
		begin:RGB_Display
			if ((user_on == 1'b1)) 
			begin 
					VGA_R = 4'hf;
					VGA_G = 4'h0;
					VGA_B = 4'h0;
			end       
			else 
			begin 
					VGA_R = Red; 
					VGA_G = Green;
					VGA_B = Blue;
			end      
		end
	
end
else begin
	DistX = 0;
	DistY = 0;
	user_on = 1'b0;
	VGA_R = 1'b0; 
	VGA_G = 1'b0;
	VGA_B = 1'b0;
end
end

	
//Data comes in on arduino pin 15
gps_toplevel gps(
				.Clk(MAX10_CLK1_50), .Reset(Reset_h), .serial_data_in(serial_data_in),
				.finished(finished),
				.correct(correct),
				.lat_min(lat_min),
				.lon_min(lon_min),
				.message(message),
				.timestamp(timestamp),
				.*

);

hex_mux hex_m (
				.SW0(SW[0]),
				.SW1(SW[1]),
				.addr_r(addr_r[3:0]),
				.time_r(time_r),
				.*
);

img_example img(
	.vga_clk(VGA_Clk),
	.DrawX(drawxsig), .DrawY(drawysig),
	.blank(blank),
	.red(Red), .green(Green), .blue(Blue)
);

vga_controller vga( .Clk(MAX10_CLK1_50), .Reset(Reset_h),  
                         .hs(VGA_HS),        
								 .vs(VGA_VS),
								 .pixel_clk(VGA_Clk),
								 .DrawX(drawxsig),
								 .DrawY(drawysig),
								 .blank(blank),
								 .sync()
								 );

//Hex driver
HexDriver		AHex0 (
								.In0(hex_data[0]),
								.Out0(HEX0) );
								
HexDriver		AHex1 (
								.In0(hex_data[1]),
								.Out0(HEX1) );
								
HexDriver		BHex0 (
								.In0(hex_data[2]),
								.Out0(HEX2) );
								
HexDriver		BHex1 (
								.In0(hex_data[3]),
								.Out0(HEX3) );
								
HexDriver		CHex1 (
								.In0(hex_data[4]),
								.Out0(HEX4) );
								
HexDriver		CHex2 (
								.In0({3'b000, ((SW[0] & SW[1]) | (~SW[1] & ~SW[0]))}),
								.Out0(HEX5) );

//LED shows every time message is received
assign LEDR[0]=finished;
assign LEDR[1]=correct;
assign LEDR[2]=done;
assign LEDR[3]=serial_data_in;

assign LEDR[8]=SW[0];
assign LEDR[9]=SW[1];

////Demo storing capabilities
////Store locations in OCM (dual port)
//loc_ram	loc_ram_inst (
//	.address_a ( addr_w ),
//	.address_b ( addr_r ),
//	.clock ( MAX10_CLK1_50 ),
//	.data_a ( {lon_min[7:0], lat_min[7:0]} ),
//	.data_b ( 16'h0000 ),
//	.wren_a ((message==4'b0001) & SW[0] & ~SW[1] ),
//	.wren_b ( 1'b0 ),
//	.q_a ( location_w ),
//	.q_b ( location_r )
//	);
//
////Store timestamps in OCM
//time_ram	time_ram_inst (
//	.address_a ( addr_w ),
//	.address_b ( addr_r ),
//	.clock ( MAX10_CLK1_50 ),
//	.data_a ( {timestamp[3], timestamp[2], timestamp[1], timestamp[0]} ),
//	.data_b ( 16'h0000 ),
//	.wren_a ((message==4'b0001) & SW[0] & ~SW[1]  ),
//	.wren_b ( 1'b0 ),
//	.q_a ( time_w ),
//	.q_b ( time_r )
//	);

//Demo plotting capabilities
loc_rom	time_rom_inst (
	.address ( addr_r ),
	.clock ( MAX10_CLK1_50 ),
	.q ( time_r )
	);
	
location_rom	location_rom_inst (
	.address ( addr_r ),
	.clock ( MAX10_CLK1_50 ),
	.q ( location_r )
	);

endmodule
