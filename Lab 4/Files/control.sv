module control(
	input logic Reset, Clk, Run, M_initial, M_next,
	input logic [2:0] counter,
	output logic Clr_Ld, Shift, Add, Sub

);
	 enum logic [1:0] {Clear_state, Add_state, Shift_state, Sub_state}   curr_state, next_state; 
	 
	 
	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk or posedge Reset)  
    begin
        if (Reset)
            curr_state <= Clear_state;
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	 always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            Clear_state :    
				
						if (Run && M_initial && counter == 3'b000)
                       next_state = Add_state;
							  
						else if (Run && !M_initial && counter == 3'b000)
							  
							  next_state = Shift_state;
							  
						else
							  next_state = Clear_state;
							  
            
				Add_state :    
								next_state = Shift_state;
								
            
				Shift_state :
							  
						if (M_next!=1'b1 && counter < 3'b110)
							  next_state = Shift_state;
						
						else if (M_next==1'b1 && counter < 3'b110)
							  next_state = Add_state;
	  
						else if (M_next==1'b1 && (counter == 3'b110))
							  next_state=Sub_state;
									  
						else if (M_next!=1'b1 && (counter == 3'b110))
							  next_state=Shift_state;
							  
						else if (counter == 3'b111)
							  next_state=Clear_state;
		  
				Sub_state:	
							  next_state=Shift_state;
							  
					  
        endcase
		  end
		  always_comb
		  begin
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   Clear_state: 
					begin
						 Clr_Ld = 1'b1;
						 Shift = 1'b0;
						 Add = 1'b0;
						 Sub = 1'b0;
					end
	   	   Add_state: 
					begin
						 Clr_Ld = 1'b0;
						 Shift = 1'b0;
						 Add = 1'b1;
						 Sub = 1'b0;
					end
				Shift_state:
					begin
						 Clr_Ld = 1'b0;
						 Shift = 1'b1;
						 Add = 1'b0;
						 Sub = 1'b0;
						 
					end
				Sub_state:
					begin
						 Clr_Ld = 1'b0;
						 Shift = 1'b0;
						 Add = 1'b0;
						 Sub = 1'b1;
						 
					end
	   	   
				default:  //default case, can also have default assignments for outputs
					begin 
						 Clr_Ld = 1'b0;
						 Shift = 1'b0;
						 Add = 1'b0;
						 Sub = 1'b0;
					end
        endcase
    end

endmodule


