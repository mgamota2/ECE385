module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 10ns;

///////// Clocks /////////
logic    MAX10_CLK1_50;

/// KEY /////////
logic   [ 1: 0]   KEY;

/// SW /////////
logic   [ 9: 0]   SW;

/// LEDR /////////
logic   [ 9: 0]   LEDR;

/// HEX /////////
logic   [ 6: 0]   HEX0;
logic   [ 6: 0]   HEX1;
logic   [ 6: 0]   HEX2;
logic   [ 6: 0]   HEX3;
logic   [ 6: 0]   HEX4;
logic   [ 6: 0]   HEX5;


/// VGA /////////
logic             VGA_HS;
logic             VGA_VS;
logic   [ 3: 0]   VGA_R;
logic   [ 3: 0]   VGA_G;
logic   [ 3: 0]   VGA_B;

/// ARDUINO /////////
logic  [15: 0]   ARDUINO_IO;
//inout           ARDUINO_RESET_N;


logic serial_data_in;
			
logic [7:0] lon_min;
logic [7:0] lat_min;
logic correct;
logic finished;
logic [3:0] message;
logic [7:0] uart_rx;
logic done;
logic [3:0] timestamp[4];


final_project final_project(.*);
integer UNITS_BETWEEN = (final_project.gps.uart_rx_unit.CLKS_PER_BIT) *2;

//string nmea_gprmc = "$GPRMC,094505.00,A,3723.46591,N,12202.24704,W,0.089,,050321,,,E*7F\r\n";
string nmea_gpgll = "$GPGLL,3723.2445,N,2158.3438,W,161229.487,A,A*41";

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 MAX10_CLK1_50 = ~MAX10_CLK1_50;
end

initial begin: CLOCK_INITIALIZATION
    MAX10_CLK1_50 = 0;
end 
// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
	#20
	KEY[1] = 1'b0;
	KEY[0] = 1'b0;
	#20 
	KEY[1] = 1'b1;
	KEY[0] = 1'b1;
	SW[1]=1'b1;
	#20
	
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

	#20
	KEY[1] = 1'b0;
	KEY[0] = 1'b0;
	#20 
	KEY[1] = 1'b1;
	KEY[0] = 1'b1;
	
	
	KEY[1] = 1'b0;
	#5
	KEY[1] = 1'b1;
	#20
	KEY[1] = 1'b0;
	#5
	KEY[1] = 1'b1;
	#20
	KEY[1] = 1'b0;
	#5
	KEY[1] = 1'b1;
	#20
	KEY[1] = 1'b0;
	#5
	KEY[1] = 1'b1;
	#20
	KEY[1] = 1'b0;
	#5
	KEY[1] = 1'b1;
	

end
endmodule
