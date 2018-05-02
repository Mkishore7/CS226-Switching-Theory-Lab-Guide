// listing all inputs and outputs, by convention outputs go first

module p2(Y, S, clk);
	output Y;  	// telling the compiler which lines are inputs and outputs
	input clk, S;
	reg Y;
	reg SS;
	initial SS = S;
	integer num = 0;
	always @(posedge clk)
		begin
			if(S == SS)
				begin //returning 1 only when S has same values over 3 clock cycles
					num = num + 1;
					if(num >= 3)
						Y = 1;
				end
			else 
				begin
					Y = 0;
					num = 1;
					SS = S;
				end
		end
endmodule
