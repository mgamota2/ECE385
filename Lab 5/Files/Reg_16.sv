//Used for MAR, MDR, IR, PC

module reg_16 (input  logic clk, clear, load, 
              input  logic [15:0]  input_vals,
              output logic [15:0]  output_vals);

    always_ff @ (posedge clk)
    begin
	 	 if (clear) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  output_vals = 16'h0000;
		 else if (load)
			  output_vals = input_vals;
    end
	
 

endmodule
