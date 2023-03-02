module REGFILE (
				input [15:0] BUS, IR,
				input [2:0] SR2,
				input LD_REG, DRMUX, SR1MUX,  Clk, Reset,
				output logic [15:0] SR1OUT, SR2OUT
);
	
	
	logic [2:0] DR_MUX_OUT;
	logic [2:0] SR1_MUX_OUT;
	
	logic [15:0] REG_FILE [0:7];
	
	mux2_1_3	SR1MUX_UNIT(.S(SR1MUX), .A_In(IR[11:9]), .B_In(IR[8:6]), .Q_Out(SR1_MUX_OUT));
	
	mux2_1_3	DRMUX_UNIT(.S(DRMUX), .A_In(3'b111), .B_In(IR[11:9]), .Q_Out(DR_MUX_OUT));
	
	//Output SR1, SR2, and update DR (may have to change)

	
	always_ff @ (posedge Clk)
	begin

		if (Reset) begin 
			REG_FILE [0]<=16'h0000;
			REG_FILE [1]<=16'h0000;
			REG_FILE [2]<=16'h0000;
			REG_FILE [3]<=16'h0000;
			REG_FILE [4]<=16'h0000;
			REG_FILE [5]<=16'h0000;
			REG_FILE [6]<=16'h0000;
			REG_FILE [7]<=16'h0000;
			
			end
			
		else if(LD_REG)
			begin
				REG_FILE[DR_MUX_OUT]<=BUS;	
			end
	end
	
	always_comb
	begin
		SR1OUT<=REG_FILE[SR1_MUX_OUT];
		SR2OUT<=REG_FILE[SR2];
	end


endmodule 