module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic c4, c8, c12;
	  
	  //First 4 bits
	  CRA_4bit add1(.A(A[3:0]), .B(B[3:0]), .c_in(cin), .S(S[3:0]), .c_out(c4));
	  
	  addr_mux am1(.A(A[7:4]), .B(B[7:4]), .c_select(c4), .S(S[7:4]), .Cout(c8));
	  
	  addr_mux am2(.A(A[11:8]), .B(B[11:8]), .c_select(c8), .S(S[11:8]), .Cout(c12));
	  
	  addr_mux am3(.A(A[15:12]), .B(B[15:12]), .c_select(c12), .S(S[15:12]), .Cout(cout));
	  
	  

endmodule

//Module incldues 2 adders with hardcoded Cin and a 4 bit 2:1 mux

module addr_mux(
	input [3:0] A, B,
	input c_select,
	output [3:0] S,
	output Cout

);
	logic c_temp0, c_temp1;
	logic [3:0] input0, input1;
	
	CRA_4bit if0(.A(A[3:0]), .B(B[3:0]), .c_in(1'b0), .S(input0[3:0]), .c_out(c_temp0));
	
	CRA_4bit if1(.A(A[3:0]), .B(B[3:0]), .c_in(1'b1), .S(input1[3:0]), .c_out(c_temp1));
	
	always_comb begin
			Cout = (c_temp0)|(c_temp1 & c_select);
	end
	
	
	mux_2 selector(.A(input0[3:0]), .B(input1[3:0]), .S(c_select), .Y(S[3:0]));
	
	


endmodule


module mux_2 (

		input [3:0] A, B, 
		input S,
		output logic [3:0] Y

);

	always_comb begin
			case (S)
				1'b0 : Y = A;
				1'b1 : Y = B;
				default : Y = 4'b0000;
			endcase
			end
	
endmodule