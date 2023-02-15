module counter (input Clk, asynch_clr, enable, up_down,
					output reg [2:0] Q);
	
	always_ff @ (posedge Clk or posedge asynch_clr)

		begin
		
		if (asynch_clr)
			Q <= 3'b000;
		else if (enable && Q < 3'b111)
			if (up_down)
				Q <= Q + 1'b1;
		end
endmodule
