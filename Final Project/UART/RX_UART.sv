//Final project ECE 385

module RX_UART	
										
					( input serial_data_in, //Exactly what the name implies
					  input Clk, Reset,		//System clock, reset
					  output done,				//Flag for end of 8 bit transmission
					  output [7:0] data_8		//8 bit output data
					);
					
					
					
					//Asynchronous nature of UART means we need to check new bit every x clock cycles
					//x is found using below equation
					//CLK_FREQ = 50,000,000 (50 mHz)
					//Default Baud rate is 9600
					//integer baud = CLK_FREQ/BAUD_RATE; 
					
					parameter n =13;
					parameter baud = 5208;
					reg [n:0] r_Clock_Count = 0; 
					
					logic [2:0] r_Bit_Index   = 0; //Keep track of bit index(least significant first)
					logic [7:0] r_RX_Byte     = 0; //Internal record of data
					logic       r_RX_D       = 0; //Lets us know when we've reached the end of data, "done" flag
					
					//Create states for FSM
					enum logic [2:0] {IDLE, START_BIT, DATA_BITS, STOP_BIT, WAIT} curr_state, next_state;
					
					
					//Run based on system clock
					always_ff @ (posedge Clk)
					begin
							curr_state=next_state; //Go to next state every clock cycle
							if (Reset)
								next_state=IDLE; //Go idle if reset
							case(curr_state)
								IDLE: 
										begin
										r_RX_D       <= 1'b0; //Set "done' flag to 0
										r_Clock_Count <= 0;    //set clock counter to 0
										r_Bit_Index   <= 0;    //Set bit index to 0
          
										if (serial_data_in == 1'b0)          // If start bit detected(start bit is 0)
											next_state <= START_BIT;		//Next state is START_BIT state
										else	
											next_state = IDLE;				//No start bit detected, stay in IDLE state
									   end
										
								
								START_BIT :
										begin
										if (r_Clock_Count == (baud-1)/2) //Check for when we are halfway through the start_bit
											begin
											if (serial_data_in == 1'b0) //If it is still a 0(start bit).  This is essentially a double check
												begin
													r_Clock_Count <= 0;  // reset counter because we found the middle.  
																				//This way we will always check the bits near the middle of their transmission to 
																				//avoid ambiguous signals
													next_state  = DATA_BITS; //Next state is DATA_BITS state
												end
											else
												next_state <= IDLE; //If the start bit is not still low it was not actually a start bit but interference,etc.
											end
										else
											begin
												r_Clock_Count <= r_Clock_Count + 1'b1; //If we are not in the middle of the perceived start bit transmission 
																								//cycle, increment counter
																								
												next_state     = START_BIT;  //Stay in START_BIT state so we can check if we are now in the middle
											 end
										end
										
								
								DATA_BITS :
										begin
										if (r_Clock_Count < baud-1) //If we have not reached the middle of the data bit
											 begin
												r_Clock_Count <= r_Clock_Count + 1'b1; //Increment counter
												next_state     = DATA_BITS; 			//Stay in DATA_BITS state, but don't sample anything
											 end
										else													//Once we hit the middle of the data bit
											 begin
												r_Clock_Count          <= 0;			//Reset the clock counter
												r_RX_Byte[r_Bit_Index] <= serial_data_in; //Store the bit in the respective bit of the data "register"
												
												// Check if we have received all bits
												if (r_Bit_Index < 7)
													begin
														r_Bit_Index <= r_Bit_Index + 1'b1;	//Increment bit index
														next_state   = DATA_BITS;			//If we have not gotten all 8, stay in DATA_BITS state
													end
												else
													begin											//If bit index is 7, we have reached the end
														r_Bit_Index <= 0;						//Reset bit index
														next_state   = STOP_BIT;		//Go to STOP_BIT state
													end
											 end
										  end 
										
										
									// Receive Stop bit.  Stop bit = 1
									STOP_BIT :
										 begin
											 
										 if (r_Clock_Count < baud-1) 	// Check to see where we are in bit transmission
											 begin
													r_Clock_Count <= r_Clock_Count + 1'b1; //Increment clock count 
													next_state     = STOP_BIT; 	//Stay in STOP_BIT state
											 end
										 else												//If we are in the middle of the bit
											 begin
												r_RX_D       <= 1'b1; 				//Reached stop bit, set "done" flag
												r_Clock_Count <= 0; 					//Reset clock count
												next_state     = IDLE;  //Go to 
											end
											done   = r_RX_D; //Assign end of data bit (triggered by stop bit)
											data_8 = r_RX_Byte; //Assign data out
										end
									endcase
				   
 end
endmodule									