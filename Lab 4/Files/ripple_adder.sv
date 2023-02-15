module ripple_adder
(
	input  logic [7:0] SW, A,
	input  logic add, sub,
	
	output logic [7:0] S,
	output logic       X
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic c1, c2;
	  logic [7:0] new_SW;
	  
	  always_comb
	  begin
			new_SW = ({8{sub}} ^ SW[7:0]);
		
	  end
	  
	  CRA_4bit a1(.A(new_SW[3:0]), .B(A[3:0]), .c_in(sub), .S(S[3:0]), .c_out(c1));
	  CRA_4bit a2(.A(new_SW[7:4]), .B(A[7:4]), .c_in(c1), .S(S[7:4]), .c_out(c2));
	  full_adder a3(.A(new_SW[7]), .B(A[7]), .Cin(c2), .S(X), .Cout(cout));

     
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


