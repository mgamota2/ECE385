module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 10ns;



logic Clk, Reset, serial_data_in,done, finished;
//logic [31:0] latitude, longitude, speed;
logic [15:0] lat_min, lon_min;
logic [7:0] sentence [0:79]; //Store 80 bytes of data
logic correct;


 logic   [ 1: 0]   KEY;


 logic   [ 9: 0]   SW;

 logic   [ 9: 0]   LEDR;


 logic   [ 7: 0]   HEX0;
 logic   [ 7: 0]   HEX1;
 logic   [ 7: 0]   HEX2;
 logic   [ 7: 0]   HEX3;
 logic   [ 7: 0]   HEX4;
 logic   [ 7: 0]   HEX5;


 logic             DRAM_CLK;
 logic             DRAM_CKE;
 logic   [12: 0]   DRAM_ADDR;
 logic   [ 1: 0]   DRAM_BA;
 logic   [15: 0]   DRAM_DQ;
 logic             DRAM_LDQM;
 logic             DRAM_UDQM;
 logic             DRAM_CS_N;
 logic             DRAM_WE_N;
 logic             DRAM_CAS_N;
 logic             DRAM_RAS_N;


 logic             VGA_HS;
 logic             VGA_VS;
 logic   [ 3: 0]   VGA_R;
 logic   [ 3: 0]   VGA_G;
 logic   [ 3: 0]   VGA_B;


logic   [15: 0]   ARDUINO_IO;
logic             ARDUINO_RESET_N;

logic [7:0] location;

final_project GPS_UART_Inst(.MAX10_CLK1_50(Clk),.*);

integer UNITS_BETWEEN = (GPS_UART_Inst.gps.uart_rx_unit.CLKS_PER_BIT) *2;

//string nmea_gprmc = "$GPRMC,094505.00,A,3723.46591,N,12202.24704,W,0.089,,050321,,,E*7F\r\n";
string nmea_gpgll = "$GPGLL,3723.2449,N,12158.3436,W,161229.487,A,A*41";

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
	Reset = 1'b1;
	#20 Reset = 1'b0;
	
	//Initial start bit
	#1 serial_data_in = 1'b1;
	#UNITS_BETWEEN 
	serial_data_in = 1'b0;
	#UNITS_BETWEEN
	
	for (int i = 0; i < nmea_gpgll.len(); i++) begin
		automatic bit [7:0] data = nmea_gpgll[i];
		for (int j = 0; j < 8; j++) begin
			serial_data_in <= data[j];
			#(UNITS_BETWEEN);
		end
		// Transmit stop bit
		serial_data_in <= 1'b1;
		#(UNITS_BETWEEN);
		//Transmit start bit
		serial_data_in <= 1'b0;
		#UNITS_BETWEEN;
	end
	
	
end
endmodule
