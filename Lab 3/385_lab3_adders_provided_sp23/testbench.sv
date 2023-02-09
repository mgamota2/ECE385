// To test your adder one in a time. 
// Leave the adder you want to test uncomment in the top level


module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the adder will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset_Clear, Run_Accumulate;
logic [9:0] SW;
logic [9:0] LED;
logic [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4,HEX5;

adder_toplevel top(.*);

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
//test 1

end
endmodule