
module GPS_UART (
  input logic Clk,
  input logic Reset, done, 
  input logic [7:0] uart_rx,
  output logic finished,
  //output logic [7:0] sentence [0:79], //Store 80 bytes of data
  output logic [7:0] lat_min,
  output logic [7:0] lon_min,
  output logic correct,
  output logic [3:0] message,
  output logic [3:0] timestamp[4]
  
  
);
	
   logic [7:0] sentence [120];
	logic [6:0] data_index;
	logic start_found;
	logic [1:0] checksum_count;

  enum logic [1:0] {
    WAIT_START,
    READ_SENTENCE,
    DONE,
	 CHECKSUM
  } curr_state, next_state;
  
//	initial begin
//   for (int i = 0; i < 80; i++) begin
//		sentence[i] = 8'b00000000;
//	end
//	end
  
  
  always_ff @ (posedge Clk)
		begin
		curr_state = next_state;
		if (Reset) begin
			message = 5'b0;
			for (int i = 0; i < 120; i++) begin
				sentence[i] = 8'b00000000;
			end
			 finished=1'b0;
			 correct=1'b0;
			 start_found = 1'b0;
			 data_index = 1'b0;
			 checksum_count = 2'b00;
			 //lat_min=5'b00000;
			 //lon_min=5'b00000;

			 next_state <= WAIT_START;
		end
		
		else begin
			case (curr_state)
			
			WAIT_START: begin
          if (uart_rx == 8'h24) begin //Look for the $ which signals the start of message
            start_found <= 1'b1;
            next_state <= READ_SENTENCE;
            end
			 else begin
				for (int i = 0; i < 120; i++) begin
				sentence[i] = 8'b00000000;
				end
				 finished=1'b0;
				 correct=1'b0;
				 start_found = 1'b0;
				 data_index = 1'b0;
				 checksum_count=2'b00;
				 next_state <= WAIT_START;
				 end 
          end
		  
		  //This state is when the 
        READ_SENTENCE: begin
			if (done) begin
				 if (uart_rx == ",") begin
					sentence[data_index] <= uart_rx;       //Put byte in sentence
					data_index <= data_index + 1'b1;
					next_state = READ_SENTENCE; 				//Stay in current state
				 end
				 else if (start_found && data_index < 80) begin
					sentence[data_index] <= uart_rx;			//Put byte in sentence
					data_index <= data_index + 1'b1;
					next_state = READ_SENTENCE;				//Stay in current state
					
				 end				//Stay in current state
				 
				 if (uart_rx == "*") begin //The next part of the message is the checksum
					next_state <= CHECKSUM;
				 end
			 end
			 else 
				next_state <=READ_SENTENCE;
			 
        end
		  
		  CHECKSUM: begin 
		  if (done) begin
					sentence[data_index] <= uart_rx;       //Put byte in sentence
					data_index <= data_index + 1'b1;
					next_state = CHECKSUM; 				//Stay in current state
					checksum_count +=1'b1;
		  end
		  if (checksum_count==2'b10) next_state=DONE;
		  
		  end
		  
		 DONE: begin
		 //If the message is a $GPGLL message, find the minutes and convert to x,y coordinates
			if (sentence[5]=="L" & (sentence[8]!=",")) begin
				lat_min[7:0] <= ((((sentence[12]-48)*10)+(sentence[13]-48)));
				lon_min[7:0] <= ((((sentence[26]-48)*10)+(sentence[27]-48)));
				timestamp[0] <= (sentence[37]-48);
				timestamp[1] <= (sentence[36]-48);
				timestamp[2] <= (sentence[35]-48);
				timestamp[3] <= (sentence[34]-48);
				correct = 1'b1;
				message+=1'b1;
			end
			
			else begin
				correct=1'b0;
			end
			next_state = WAIT_START;
			finished = 1'b1;
		 end

		 default: 
			next_state = WAIT_START;

	endcase
	end
	end
		
endmodule