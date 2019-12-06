module keyboard_to_nes(input logic[7:0] keyval_1, keyval_2, keyval_3,
							  output logic NES_A, NES_LEFT, NES_RIGHT, NES_UP, NES_DOWN);
			always_comb
			begin
				if(~(keyval_1 == 8'hF0))
				begin
					NES_UP    = (keyval_2 == 8'h1D); //w
					NES_LEFT  = (keyval_2 == 8'h1C); //a
					NES_DOWN  = (keyval_2 == 8'h1B); //s
					NES_RIGHT = (keyval_2 == 8'h23); //d
					NES_A     = (keyval_2 == 8'h29); //space
				end
			end
endmodule 
				