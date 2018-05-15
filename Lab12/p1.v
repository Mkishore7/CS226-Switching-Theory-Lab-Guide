
module p1(Y,curr_state,clk,reset,inp); //module declaration with inputs and outputs
	output Y;
	input clk, reset,inp;
	output [2:0] curr_state;
	reg [2:0] next_state;
	reg[2:0] curr_state;

	parameter [2:0] S0= 3'b000;
	parameter [2:0] S1= 3'b001;
	parameter [2:0] S2 = 3'b010;
	parameter [2:0] S3=3'b011;
	parameter [2:0] S4=3'b100;

	initial
	begin
		curr_state = 3'b000;
		next_state = 3'b000;
	end

	always @(posedge clk) // sequential logic
	begin
		if (reset) curr_state <= S0;
		else curr_state <= next_state;
		end

		always @(curr_state or inp) // combinational logic
		begin
			case(curr_state)
				S0: if (reset) next_state = S0;
						else if(inp) next_state = S1;
						else next_state = S0;
				S1: if (reset) next_state = S0;
						else if(inp) next_state = S2;
						else next_state = S0;
				S2: if (reset) next_state = S0;
						else if(inp) next_state = S2;
						else next_state = S3;
				S3: if (reset) next_state = S0;
						else if(inp) next_state = S4;
						else next_state = S0;
				S4: if (reset) next_state = S0;
						else if(inp) next_state = S2;
						else next_state = S0;
		endcase 

	end
	// output logic described using continuous assignment
	assign Y = (curr_state == S4);
endmodule

// Test bench for p1.v
module tb_p1();
	reg clk, reset,inp;
	wire Y;
	wire[2:0] curr_state;
	integer i;
	p1 DUT(Y,curr_state,clk,reset,inp);
	reg[20:1] SEQUENCE = 20'b11101101001001101101;
	initial reset = 1'b1;
	always #10 clk = ~clk;
	initial
		begin
		clk = 1'b1;
		reset = 1'b0;
		for (i = 20; i >= 1; i = i - 1)
		begin
			inp = SEQUENCE[i]; #20
			$monitor("SEQUENCE_BIT = %b, Y = %b, reset = %b\n", inp, Y, reset, $time);
		end
	end
endmodule