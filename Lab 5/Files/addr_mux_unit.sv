module ADDR_MUX_UNIT(input logic [15:0] PC, SR1OUT,
							input [15:0] IR, 
							input [1:0] ADDR2MUX,
							input ADDR1MUX,
							output [15:0] ADDER_OUT
							);
			
logic [15:0] add_input_right, add_input_left;

		//ADDR1MUX (A is 'right' B is 'left')
		mux2_1_16	ADDR1MUX_UNIT(.S(ADDR1MUX),.A_In(PC),.B_In(SR1OUT), .Q_Out(add_input_right));
						


		//ADDR2 MUX (A is 'right' most D is 'left' most)
		mux4_1_16	ADDR2_MUX_UNIT(.S(ADDR2MUX),.A_In(16'h0000),.B_In(16'(signed'(IR[5:0]))),
											.C_In(16'(signed'(IR[8:0]))),.D_In(16'(signed'(IR[10:0]))), .Q_Out(add_input_left));
						
		assign ADDER_OUT= add_input_right + add_input_left;
		
endmodule