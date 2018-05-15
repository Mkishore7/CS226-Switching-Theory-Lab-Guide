module p2(output reg [3:0]Q, output upper, input reset, input clk); //counter module with inputs and outputs
	always@(posedge clk)
	begin
		if(reset) //reset
			Q = 4'b0000;
		else
			Q = Q + 4'b0001; //increment by 1
	end
	assign upper = Q[3];
endmodule

module tb_p2(); //the test_bench
	reg clk, reset;
	wire upper;
	wire [3:0]Q;
	p2 UUT(Q, upper, reset, clk);
		initial begin //clock definition
			clk = 0;
			forever #5 clk = ~clk;
		end
		initial begin //simulation
			$monitor("COUNT  = %b", Q, " | UPPER = %b", upper);
			reset = 1;
			#20;
			reset = 0;
		end
	initial //stop after 200 time units
	#200 $finish; 
endmodule
	