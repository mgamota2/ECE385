//16-bit parallel MUXs (5:1, 4:1, and 2:1) for MIO, ADDR1 MUX, ADDR2 MUX, SR2 MUX, PC MUX


//2:1 MUX used for MIO, ADDR1 MUX, SR2MUX
module mux2_1_16	(input				S,
						input					[15:0] A_In,
						input 				[15:0] B_In,
						output logic		[15:0] Q_Out);
						
		// 16 bit parallel multiplexer implemented using case statement
		always_comb
		begin
				unique case(S)
						1'b0	:	Q_Out = A_In;
						1'b1	:	Q_Out = B_In;
						default :  Q_Out=16'hxx;
				endcase
				
		end
		
		
endmodule


//4:1 MUX used for ADDR2 MUX and PC MUX(3:1)
module mux4_1_16	(input				[1:0] S,
						input					[15:0] A_In,
						input 				[15:0] B_In,
						input					[15:0] C_In,
						input 				[15:0] D_In,
						output logic		[15:0] Q_Out);
						
		
		always_comb
		begin
				unique case(S)
						2'b00	:	Q_Out = A_In;
						2'b01	:	Q_Out = B_In;
						2'b10	:	Q_Out = C_In;
						2'b11	:	Q_Out = D_In;
						default :  Q_Out=16'hxx;
				endcase
		end
		
		
endmodule

module tristate_mux (input [3:0] S,
							input [15:0] Gate_MDR_16,
							input [15:0] Gate_MARMUX_16,
							input [15:0] Gate_PC_16,
							input [15:0] Gate_ALU_16,
							output logic [15:0] Q_Out
							);
							
		always_comb
		begin
				unique case(S)
						4'b1000	:	Q_Out = Gate_MDR_16;
						4'b0100	:	Q_Out = Gate_MARMUX_16;
						4'b0010	:	Q_Out = Gate_PC_16;
						4'b0001	:	Q_Out = Gate_ALU_16;
						
						default :  Q_Out=16'hZZ;
				endcase
				
		end
							
							
							
endmodule

//module tristate (input S,
//						input [15:0] A_In,
//						input [15:0] B_In,
//						output logic [15:0] Q_Out
//						);
//						
//		always_comb
//		begin
//				unique case(S)
//						1'b0	:	Q_Out = A_In;
//						1'b1	:	Q_Out = B_In;
//						default :  Q_Out=16'hxx;
//				endcase
//				
//		end
//						
//endmodule