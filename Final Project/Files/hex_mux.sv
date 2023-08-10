module hex_mux (
				input SW0,
				input SW1,
				input [7:0] lat_min,
				input [7:0] lon_min,
				input [15:0] time_r,
				input [3:0] message,
				input [3:0] addr_r,
				input correct,
				output logic [3:0] hex_data [5]
);

always_comb begin
	if (SW0 & ~SW1)begin //Record mode, display coords
		hex_data[0]=(lat_min[7:0]%10);
		hex_data[1]=(lat_min[7:0]/10);
		hex_data[2]=(lon_min[7:0]%10);
		hex_data[3]=(lon_min[7:0]/10);
		hex_data[4]=message;
	end
	
	else if (~SW0 & SW1) begin//Plot mode, display time
		hex_data[0]=(time_r[3:0]);
		hex_data[1]=(time_r[7:4]);
		hex_data[2]=(time_r[11:8]);
		hex_data[3]=(time_r[15:12]);
		hex_data[4]=addr_r;
	end
	
	else begin
		hex_data[0]=4'h1;
		hex_data[1]=4'h1;
		hex_data[2]=4'h1;
		hex_data[3]=4'h1;
		hex_data[4]=message;
	end
end

endmodule