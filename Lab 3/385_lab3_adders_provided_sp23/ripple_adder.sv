module ripple_adder
(
	input  logic [15:0] A, B,
	output logic [15:0] S,
	input  logic cin,
	output logic       cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic c1, c2, c3;
	  
		  CRA_4bit r1(.A(A[3:0]), .B(B[3:0]), .c_in(cin), .S(S[3:0]), .c_out(c1));
		  CRA_4bit r2(.A(A[7:4]), .B(B[7:4]), .c_in(c1), .S(S[7:4]), .c_out(c2));
		  CRA_4bit r3(.A(A[11:8]), .B(B[11:8]), .c_in(c2),.S(S[11:8]), .c_out(c3));
		  CRA_4bit r4(.A(A[15:12]), .B(B[15:12]), .c_in(c3), .S(S[15:12]), .c_out(cout));
	  

     
endmodule

module CRA_4bit(
	input  [3:0] A, B,
	input         c_in,
	output [3:0] S,
	output logic c_out
	  

);
	  logic c1, c2, c3;

	  full_adder fa1(.A(A[0]), .B(B[0]), .Cin(c_in), .S(S[0]), .Cout(c1));
	  full_adder fa2(.A(A[1]), .B(B[1]), .Cin(c1), .S(S[1]), .Cout(c2));
	  full_adder fa3(.A(A[2]), .B(B[2]), .Cin(c2), .S(S[2]), .Cout(c3));
	  full_adder fa4(.A(A[3]), .B(B[3]), .Cin(c3), .S(S[3]), .Cout(c_out));

endmodule


module full_adder(	

	input A, B, Cin,
	output logic S, Cout
);
  

	assign S = A^B^Cin;
  
	assign Cout = (A & B)|(B & Cin)|(A & Cin);
  
  
endmodule


