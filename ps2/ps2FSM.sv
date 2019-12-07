module ps2FSM(input logic clk_50MHz, clr, ps2_clk, ps2_data,
				output logic[7:0] keyval_1, keyval_2, keyval_3);

		enum {start, 
		wtclklow1, wtclkhigh1, getkey1, 
		wtclklow2, wtclkhigh2, getkey2, breakey, 
		wtclklow3, wtclkhigh3, getkey3} state; 
			
		logic ps2_clk_f, ps2_data_f;
		logic[7:0] ps2_clk_filter, ps2_data_filter;
			
		logic[10:0] shift_reg1, shift_reg2, shift_reg3;
		logic[7:0] keyval_1_s, keyval_2_s, keyval_3_s;
			
		logic[3:0] bit_count;
		logic[3:0] bit_count_max = 4'b1011; //11
			
		//filter
		
		always_ff@(posedge clk_50MHz, posedge clr)
		begin
			if(clr)
			begin
				ps2_clk_filter  <= 1;
				ps2_data_filter <= 1;
				ps2_clk_f  <= 1;
				ps2_data_f <= 1;
			end
			else
			begin
				ps2_clk_filter[7]    <= ps2_clk;
				ps2_clk_filter[6:0]  <= ps2_clk_filter[7:1];
				ps2_data_filter[7]   <= ps2_data;
				ps2_data_filter[6:0] <= ps2_data_filter[7:1];
				
				if		 (ps2_clk_filter == 8'hFF) ps2_clk_f <= 1;
				else if(ps2_clk_filter == 8'h00) ps2_clk_f <= 0;
				
				if		 (ps2_data_filter == 8'hFF) ps2_data_f <= 1;
				else if(ps2_data_filter == 8'h00) ps2_data_f <= 0;
				
			end
		end
		
		//state machine
		
		always_ff@(posedge clk_50MHz, posedge clr)
		begin
			if(clr)
			begin
				state <= start;
				bit_count   <= 0;
				shift_reg1  <= 0;
				shift_reg2  <= 0;
				shift_reg3  <= 0;
				keyval_1_s <= 0;
				keyval_2_s <= 0;
				keyval_3_s <= 0;
			end
			else
			begin
				case(state)
					start:
						if(ps2_data_f) state <= start;
						else 				state <= wtclklow1;
					//wait for clock to go low
					
					wtclklow1:
						if(bit_count < bit_count_max)
						begin
							if(ps2_clk_f) state <= wtclklow1;
							else 
							begin
								state <= wtclkhigh1;
								//shift in bit
								shift_reg1[10]  <= ps2_data_f;
								shift_reg1[9:0] <= shift_reg1[10:1];
							end
						end
						//when full get the key
						else state <= getkey1;
					//wait fo clock to go high
					
					wtclkhigh1:
						if(~ps2_clk_f) state <= wtclkhigh1;
						else
						begin
							state <= wtclklow1;
							bit_count <= bit_count + 1;
						end
						
					getkey1:
						begin
							keyval_1_s <= shift_reg1[8:1];
							bit_count <= 0;
							state <= wtclklow2;
						end
/************************again*********************/

					wtclklow2:
						if(bit_count < bit_count_max)
						begin
							if(ps2_clk_f) state <= wtclklow2;
							else 
							begin
								state <= wtclkhigh2;
								//shift in bit
								shift_reg2[10]  <= ps2_data_f;
								shift_reg2[9:0] <= shift_reg2[10:1];
							end
						end
						//when full get the key
						else state <= getkey2;
					//wait fo clock to go high
					
					wtclkhigh2:
						if(~ps2_clk_f) state <= wtclkhigh2;
						else
						begin
							state <= wtclklow2;
							bit_count <= bit_count + 1;
						end
						
					getkey2:
						begin
							keyval_2_s <= shift_reg2[8:1];
							bit_count <= 0;
							state <= breakey;
						end
/************************again*********************/

					breakey:
						if(keyval_2_s == 8'hF0) state <= wtclklow3;
						else
						begin
							if(keyval_1_s == 8'hE0) state <= wtclklow1;
							else state <= wtclklow2;
						end
						
					wtclklow3:
						if(bit_count < bit_count_max)
						begin
							if(ps2_clk_f) state <= wtclklow3;
							else 
							begin
								state <= wtclkhigh3;
								//shift in bit
								shift_reg3[10]  <= ps2_data_f;
								shift_reg3[9:0] <= shift_reg1[10:1];
							end
						end
						//when full get the key
						else state <= getkey3;
					//wait fo clock to go high
					
					wtclkhigh3:
						if(~ps2_clk_f) state <= wtclkhigh3;
						else
						begin
							state <= wtclklow3;
							bit_count <= bit_count + 1;
						end
						
					getkey3:
					begin
						keyval_3_s <= shift_reg3[8:1];
						bit_count <= 0;
						state <= wtclklow1;
					end
				endcase
			end
			keyval_1 <= keyval_1_s;
			keyval_2 <= keyval_2_s;
			keyval_3 <= keyval_3_s;
			
		end
			
			
endmodule 