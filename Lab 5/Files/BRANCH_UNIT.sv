module BRANCH_UNIT (
				input [15:0] BUS, IR,
				input LD_CC, LD_BEN, Clk, Reset,
				output logic BEN
);
	
	logic [2:0] NZP_1, NZP_2;
	
	
	always_ff @ (posedge Clk)
	begin
		if (Reset)
			BEN <= 1'b0;
		if(LD_CC) begin 
			NZP_2<=NZP_1;
		end
		if (LD_BEN) begin
			BEN <= ((NZP_2 & IR[11:9]) != 3'b000);
		end
	end
	
	always_comb 
	begin
			if (BUS == 16'h0000)	begin
				NZP_1=3'b010;
			end
			
			else if (BUS[15] == 1'b1)	begin
				NZP_1=3'b100;
			end
			
			else if(BUS[15] == 0 & BUS != 16'h0000) begin
				NZP_1=3'b001;
			end
			else begin
				NZP_1=3'b111;
			end
	end
	
endmodule 