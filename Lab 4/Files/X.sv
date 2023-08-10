module x_reg(
   input Clk,
	input logic x_in, clear,
	output logic x_out

);


   always_ff @ (posedge Clk)  
      if (clear)  
         x_out <= 0;  
      else   
         x_out <= x_in;  
endmodule  

