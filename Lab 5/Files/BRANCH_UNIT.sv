module BRANCH_UNIT (
				input [15:0] BUS, IR,
				input LD_CC, LD_BEN, Clk,
				output logic BEN
);
	
	logic N, Z, P;
	
	always_ff @ (posedge Clk)
	begin
		if(LD_CC)
			if (BUS[15] == 1'b1)		
				N=1'b1;
				Z=1'b0;
				P=1'b0;
			if (BUS == 16'h0000)		
				N=1'b0;
				Z=1'b1;
				P=1'b0;
			if (BUS!= 16'h0000 & BUS[15]==1'b0)		
				N=1'b0;
				Z=1'b0;
				P=1'b1;
			
		case (LD_BEN & (IR[11:9]!= 3'b000))
			(N==1'b1 & IR[11]==1):
				BEN=1'b1;
			(Z==1'b1 & IR[10]==1):
				BEN=1'b1;
			(P==1'b1 & IR[9]==1):
				BEN=1'b1;
			default: BEN=1'b0;
		endcase
			
	end


endmodule 