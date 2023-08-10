//Top level for ECE 385 Lab 4


module mult_toplevel  (input logic Clk, Reset_Load_Clear, Run, 
						input [7:0]			SW,
						output logic [7:0] Aval, Bval,
						output logic [6:0]	HEX0, 
											HEX1, 
											HEX2, 
											HEX3,
											HEX4,
											HEX5
						//output logic [2:0] counter,
						//output logic [7:0] A,
						//output logic Shift,
						//output logic add,
						//output logic sub
						
											
);

		// Declare temporary values used by other modules
		//Sync buttons and switches
		logic Run_SH, RCL_SH;
		logic [7:0]SW_S;
		
		
		//X reg
		logic x_in;
		logic x_out;
		
		//Control unit
		logic M;
		logic Clr_Ld;
		logic Shift;
		logic add;
		logic sub;
		
		//Registers
		
		logic [7:0] A;
		logic B_in;
		
		//Counter
		logic [3:0] counter;
		
		//Adder
		logic cout;
		
		// Misc logic that inverts button presses and ORs the Load and Run signal
		always_ff @ (posedge Clk)
		begin
			
				
		end
		
		//Instantitate modules
		control control_unit(.Clk(Clk), .Reset(RLC_SH), .Run(Run_SH), 
								   .M_next(Bval[1]), .M_initial(Bval[0]), .counter(counter[2:0]), .Clr_Ld(Clr_Ld), 
									.Shift(Shift), .Add(add),.Sub(sub));
									
		ripple_adder ALU(.SW(SW_S[7:0]), .A(Aval[7:0]), .add(add), .sub(sub), .S(A[7:0]), .X(x_in));
		
		x_reg x_unit(.Clk(Clk), .x_in(x_in), .clear(RLC_SH | (Run_SH && Clr_Ld && counter==3'b000)), .x_out(x_out));
		
							
		reg_8 reg_A(.Clk(Clk), .Reset(RLC_SH | (Run_SH && Clr_Ld && counter==3'b000)), .Shift_In(x_out), .Load(add | sub), 
						.Shift_En(Shift), .D(A[7:0]), .Shift_Out(B_in), .Data_Out(Aval[7:0]));
						
		reg_8 reg_B(.Clk(Clk), .Reset(1'b0), .Shift_In(B_in), .Load(RLC_SH), 
						.Shift_En(Shift), .D(SW_S[7:0]), .Shift_Out(M), .Data_Out(Bval[7:0]));
						
		
									
		counter counter_7(.Clk(Clk), .asynch_clr(Clr_Ld && ~Run_SH), .enable(Shift), .up_down(Shift),
								.Q(counter[2:0]));



		// Hex units that display contents of registers A and B in hex
		HexDriver		AHex0 (
								.In0(Bval[3:0]),
								.Out0(HEX0) );
								
		HexDriver		AHex1 (
								.In0(Bval[7:4]),
								.Out0(HEX1) );
								
		HexDriver		BHex0 (
								.In0(Aval[3:0]),
								.Out0(HEX2) );
								
		HexDriver		BHex1 (
								.In0(Aval[7:4]),
								.Out0(HEX3) );
								
		HexDriver		unused1 (
								.In0(4'b0000),
								.Out0(HEX4) );
		HexDriver		unused21 (
								.In0(4'b0000),
								.Out0(HEX5) );
		
												
		sync button_sync[1:0] (Clk, {~Reset_Load_Clear, ~Run}, {RLC_SH, Run_SH});
	   sync SW_sync[7:0] (Clk, SW, SW_S);
		
endmodule