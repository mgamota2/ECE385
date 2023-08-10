/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [9:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic [31:0] LOCAL_REG  [601]; // Registers

//put other local variables here
logic [10:0] addr;
logic [7:0] curr_reg;
logic [0:7] data;
logic blank, sync;
logic [9:0] DrawX, DrawY;
logic pixel_clk;
logic [1:0] charX, charY;

//Declare submodules..e.g. VGA controller, ROMS, etc
vga_controller vga_control (.Clk(CLK),.Reset(RESET),.hs(hs), .vs(vs),  .pixel_clk(pixel_clk),
									 .blank(blank),     .sync(sync), .DrawX(DrawX),      .DrawY(DrawY)) ;  
									 
font_rom font_rom1(.addr(addr),.data(data) );


   
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff

always_ff @(posedge CLK) begin
	if(RESET)begin
		for (int i=0;i<=600;i++)
			begin
				LOCAL_REG[i]<=32'h0;
			end
	end
	
	else if (AVL_CS & AVL_WRITE) begin
		// Write each byte only if the corresponding byte enable is 1
		unique case(AVL_BYTE_EN)
			4'b1111: LOCAL_REG[AVL_ADDR][31:0]   <= AVL_WRITEDATA[31:0];
			4'b1100: LOCAL_REG[AVL_ADDR][31:16]   <= AVL_WRITEDATA[31:16];
			4'b0011: LOCAL_REG[AVL_ADDR][15:0]   <= AVL_WRITEDATA[15:0];
			4'b1000: LOCAL_REG[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
			4'b0100: LOCAL_REG[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
			4'b0010: LOCAL_REG[AVL_ADDR][15:8]  <= AVL_WRITEDATA[15:8];
			4'b0001: LOCAL_REG[AVL_ADDR][7:0]   <= AVL_WRITEDATA[7:0];
			default: ;
		endcase
	end
	
	else if (AVL_CS && AVL_READ) begin
		// Read
			
			AVL_READDATA[31:0] <=  LOCAL_REG[AVL_ADDR][31:0];
		
	end
			

end


//handle drawing (may either be combinational or sequential - or both).
logic [6:0] regX;
logic [6:0] regY;
assign charX = DrawX[4:3]; // divide by 8

assign regX=DrawX[9:5];  // divide by 32 which slice of 32 bits from 640   
assign regY=DrawY[9:4];  // divide by 16 row 
assign curr_reg=LOCAL_REG[(regY*20)+regX][8*charX+:8];


assign addr={curr_reg[6:0], DrawY[3:0]};


always_ff @ (posedge pixel_clk) begin
	if (~blank)begin
		red=4'h0;
		blue=4'h0;
		green=4'h0;
		end
	else if (blank) begin
		if (data[DrawX[2:0]]) begin
			if (~curr_reg[7]) begin
				//Flip colors, 0=foreground, 1=background
				red <= LOCAL_REG[600][24:21];
				green <= LOCAL_REG[600][20:17];
				blue <= LOCAL_REG[600][16:13];
				
			end
			else begin
				red <= LOCAL_REG[600][12:9];
				green <= LOCAL_REG[600][8:5];
				blue <= LOCAL_REG[600][4:1];			 
			end
		end
		else begin
			if (~curr_reg[7]) begin
				//Don't flip colors, 1=foreground, 0=background
				red <= LOCAL_REG[600][12:9];
				green<=LOCAL_REG[600][8:5];
				blue<=LOCAL_REG[600][4:1];
			end
			else begin
				red <= LOCAL_REG[600][24:21];
				green<=LOCAL_REG[600][20:17];
				blue<=LOCAL_REG[600][16:13];
				 
			end
			
		
		end
	end
end

endmodule
