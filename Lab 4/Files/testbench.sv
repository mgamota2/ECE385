module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk, Reset_Load_Clear, Run;
logic [7:0]			SW;

logic [7:0] Aval, Bval, A;
logic [2:0] counter;
logic Shift;
logic add;
logic sub;
logic [6:0]	HEX0, 
											HEX1, 
											HEX2, 
											HEX3,
											HEX4,
											HEX5;

				
// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
mult_toplevel toplevel1(.*);	

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
Reset_Load_Clear = 1;		// Toggle Rest
Run = 1;

SW = 8'hff;	// Specify Din, F, and R

#20 Reset_Load_Clear = 0;

#20 Reset_Load_Clear = 1;

SW = 8'hff;

#2 Run = 0;	// Toggle Execute
#40 Run =1;

#30 SW = 8'hff;

#10 Run=0;
#2 Run=1;

#40 Run=0;
#2 Run=1;

end
endmodule
