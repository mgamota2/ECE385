module BRANCH_UNIT (
				input [15:0] BUS, IR,
				input LD_CC, LD_BEN, Clk,
				output logic BEN
);
	
	logic [2:0] NZP_1, NZP_2;
	
	always_comb 
	begin
			if (BUS == 16'h0000)	
				NZP_1=3'b010;
				
			else if (BUS[15] == 1'b1)	begin
				NZP_1=3'b100;
			end
			
			else begin
				NZP_1=3'b001;
			end
	end
	
	
	always_ff @ (posedge Clk)
	begin
		if(LD_CC) begin 
			NZP_2=NZP_1;
		end
		if (LD_BEN & IR[11:9]!=3'b000) begin
			BEN = NZP_2 & IR[11:9];
		end
	end
endmodule 