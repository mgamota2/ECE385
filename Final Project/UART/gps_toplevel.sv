module gps_toplevel(
							input Clk, Reset, serial_data_in,
							//output logic done, finished,
							output logic [7:0] lat_min,
							output logic [7:0] lon_min,
							output logic correct,
							output logic finished,
							output logic [3:0] message,
							output logic [7:0] uart_rx,
							output logic [3:0] timestamp[4],
							output logic done
							

);


RX_UART uart_rx_unit(.*, .data_8(uart_rx)); //Instantiate uart receiver
GPS_UART data_processor(.*); //Instantiate data processor


endmodule