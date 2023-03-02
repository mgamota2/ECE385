module ALU (
				input [15:0] SR1OUT, SR2OUT, IR,
				input [1:0] ALUK,
				input SR2MUX,
				output logic [15:0] ALU_OUT

);
	logic [15:0] B;
	
	mux2_1_16	SR2MUX_UNIT(.S(SR2MUX), .A_In(SR2OUT), .B_In(16'(signed'(IR[4:0]))), .Q_Out(B));
	
	//00 = and, 01 = not, 10=add
	always_comb
	begin
		case(ALUK)
			2'b00: 
				ALU_OUT = SR1OUT + B;
			2'b01:
				ALU_OUT = ~(SR1OUT);
			2'b10: 
				ALU_OUT = SR1OUT & B;	
			
			default: ALU_OUT={16{'Z}};	
		endcase
	end


endmodule 