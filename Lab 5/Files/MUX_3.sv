module mux2_1_3	(input				S,
						input					[2:0] A_In,
						input 				[2:0] B_In,
						output logic		[2:0] Q_Out);
						
		// 3 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						1'b0	:	Q_Out <= A_In;
						1'b1	:	Q_Out <= B_In;
						default :  Q_Out=2'bxx;
				endcase
		end
		
		
endmodule