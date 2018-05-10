// Test bench for p2.v

module tb_p2();
	reg clk = 0, S;
	integer i;
	wire Y;
	always #5 clk = ~clk; //clock definition
	p2 UUT(Y, S, clk);
	initial 
		begin
			for(i = 0; i < 100; i = i + 1) 
				begin
					S = $urandom($realtime)%2; //randomly generating S
					#10;
					$monitor(" S = %b | Y = %b ",S,Y);
				end
		end
endmodule