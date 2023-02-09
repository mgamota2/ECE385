module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output logic [15:0] S,
	output logic cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic c4, c8, c12, Pout, Gout;
	  logic [3:0] P, G;
	  
	  lookahead_4bit la4_1(.A(A[3:0]), .B(B[3:0]), .Cin(cin), .S(S[3:0]), .Pout(P[0]), .Gout(G[0]));
	  assign c4 = ((G[0]) | (cin & P[0]));
	  
	  lookahead_4bit la4_2(.A(A[7:4]), .B(B[7:4]), .Cin(c4), .S(S[7:4]), .Pout(P[1]), .Gout(G[1]));
	  assign c8= ((G[1]) | (G[0] & P[1]) | (cin & P[0] & P[1]));
	  
	  lookahead_4bit la4_3(.A(A[11:8]), .B(B[11:8]), .Cin(c8), .S(S[11:8]), .Pout(P[2]), .Gout(G[2]));
	  assign c12 = ((G[2]) | (G[1] & P[2]) | (G[0] & P[2] & P[1]) | (cin & P[2] & P[1] & P[0]));
	  
	  lookahead_4bit la4_4(.A(A[15:12]), .B(B[15:12]), .Cin(c12), .S(S[15:12]), .Pout(P[3]), .Gout(G[3]));
	  
	  assign Pout = (P[0] & P[1] & P[2] & P[3]);
	
	  assign Gout = ((G[3]) | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]));
	  
	  assign cout = (Gout | (cin & Pout));
	  
	  

endmodule

module lookahead_4bit (
	input [3:0] A, B,
	input Cin,
	output logic [3:0] S,
	output logic Pout, Gout
	);
	
	logic c1, c2, c3;
	logic [3:0] P, G;
	
	full_adder_pg fapg1(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .P(P[0]), .G(G[0]));
	
	assign c1 = ((Cin & (P[0]))| G[0]);
	
	full_adder_pg fapg2(.A(A[1]), .B(B[1]), .Cin(c1), .S(S[1]), .P(P[1]), .G(G[1]));
	
	assign c2 = ((Cin & P[1] & P[0]) | (G[0] & P[1]) | (G[1]));
	
	full_adder_pg fapg3(.A(A[2]), .B(B[2]), .Cin(c2), .S(S[2]), .P(P[2]), .G(G[2]));
	
	assign c3 = ((Cin & P[0] & P[1] & P[2]) | (G[0] & P[1] & P[2]) | (G[1] & P[2]) |(G[2]));
	
	full_adder_pg fapg4(.A(A[3]), .B(B[3]), .Cin(c3), .S(S[3]), .P(P[3]), .G(G[3]));
	
	assign Pout = (P[0] & P[1] & P[2] & P[3]);
	
	assign Gout = ((G[3]) | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]));
	
	
endmodule
	

module full_adder_pg(	

	input A, B, Cin,
	output logic S, P, G
);
  
  assign S = A ^ B ^ Cin;
  assign P= A ^ B;
  assign G= A & B;
  
endmodule