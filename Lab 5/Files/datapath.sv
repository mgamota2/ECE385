`include "SLC3_2.sv"
import SLC3_2::*;

module datapath( input logic Clk, Reset,
						input logic GateMARMUX, GateALU, GatePC, GateMDR,
						input logic LD_PC, LD_MDR, LD_MAR, LD_IR, LD_REG, DRMUX, LD_BEN, LD_CC,
						input logic MIO_EN, ADDR1MUX, SR1MUX, SR2MUX,
						input logic [1:0] PCMUX, ADDR2MUX, ALUK, 
						input logic [15:0] MDR_In,
						output logic [15:0] PC, MDR, MAR, IR,
						output logic BEN
					
);


logic [3:0] buffer_mux;
logic [15:0] PC_IN, BUS, ADDER_OUT, MIO_OUT, ALU_OUT, MDR_NEXT, PC_NEXT
					,SR1OUT, SR2OUT;

assign buffer_mux = {GateMDR, GateMARMUX, GatePC, GateALU};


		//PC register
		reg_16 PC_REG(.clear(Reset), .load(LD_PC), .clk(Clk), .input_vals(PC_IN),.output_vals(PC));
		
		
		assign PC_NEXT=PC+16'h0001;
	
		//PC Mux
		mux4_1_16	PC_MUX(.S(PCMUX), .A_In(PC_NEXT), .B_In(ADDER_OUT), .C_In(BUS), .D_In({16{1'bX}}),.Q_Out(PC_IN));
		
		//MIO Mux
		mux2_1_16	MDR_MUX(.S(MIO_EN), .A_In(BUS), .B_In(MDR_In),.Q_Out(MDR_NEXT));
		
		//MAR register
		reg_16 MAR_REG(.clear(Reset), .load(LD_MAR), .clk(Clk), .input_vals(BUS),.output_vals(MAR));
		
		//MDR register
		reg_16 MDR_REG(.clear(Reset), .load(LD_MDR), .clk(Clk), .input_vals(MDR_NEXT),.output_vals(MDR));
		
		//IR register
		reg_16 IR_REG(.clear(Reset), .load(LD_IR), .clk(Clk), .input_vals(BUS),.output_vals(IR));
		
		//Branch logic
		BRANCH_UNIT br_unit(.*);
		
		
		//Register file
		REGFILE registers(.SR2(IR[2:0]),.*);
		
		//Adder
		ADDR_MUX_UNIT adder_unit(.*);
		
		//ALU
		ALU alu_unit(.*);
		
		//Tri state buffer implementation	
		tristate_mux tm1(.S(buffer_mux), .Gate_MDR_16(MDR) ,.Gate_MARMUX_16(ADDER_OUT), .Gate_PC_16(PC),.Gate_ALU_16(ALU_OUT), .Q_Out(BUS));

	endmodule