module testbench();

// Half clock cycle at 50 MHz
// This is the amount of time represented by #1
timeunit 10ns;
timeprecision 1ns;

   // Internal variables
	logic [15:0]IR, MDR, MAR, PC;
	
	logic [9:0] SW;
	logic	Clk, Run, Continue;
	logic [9:0] LED;
	logic [6:0] HEX0, HEX1, HEX2, HEX3;
	
	
	
	// initialize the toplevel entity
	slc3_testtop test(.*);
	
	logic [15:0] r0, r1, r2, r3, r4, r5, r6, r7;
	assign r0=test.slc.d0.registers.REG_FILE[0];
	assign r1=test.slc.d0.registers.REG_FILE[1];
	assign r2=test.slc.d0.registers.REG_FILE[2];
	assign r3=test.slc.d0.registers.REG_FILE[3];
	assign r4=test.slc.d0.registers.REG_FILE[4];
	assign r5=test.slc.d0.registers.REG_FILE[5];
	assign r6=test.slc.d0.registers.REG_FILE[6];
	assign r7=test.slc.d0.registers.REG_FILE[7];
	
	// set clock rule
   always begin : CLOCK_GENERATION 
		#1 Clk = ~Clk;
   end

	// initialize clock signal 
	initial begin: CLOCK_INITIALIZATION 
		Clk = 0;
   end
	
	// begin testing
	initial begin: TEST_VECTORS
		Continue = 0;
		Run = 0;
	#10 SW=10'b00001011010;
	#20 Run = 1;
		 Continue =1;
	 
	#25 Run =0;
	
	#30 Run =1;
	
	#1000 SW=10'b0000000011;
	
	#10 Continue = 0;
	#10 Continue =1;
	
	#1000 Continue = 0;
	#5 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#20 Continue =1;
	
	#200 Continue = 0;
	#20 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	
	//Sort
	#1000 SW=10'b0000000010;
	
	#10 Continue = 0;
	#10 Continue =1;
	
		
	//Display sorted

	#40000 SW=10'b0000000011;
	
	#10 Continue = 0;
	#10 Continue =1;
	
	#1000 Continue = 0;
	#5 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#20 Continue =1;
	
	#200 Continue = 0;
	#20 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;
	
	#200 Continue = 0;
	#10 Continue =1;


	
	
	
	
//	
//	Continue =0;
//	Run=0;
//	#20 Continue =1;
//	#50 Run=1;
	
	

	end
	 
endmodule