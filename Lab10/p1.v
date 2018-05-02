module p1(g, b); //// listing all inputs and outputs, by convention outputs go first
	output [3:0]g; //gray code
	input [3:0]b; //binary code
	//conversion
	assign g[3]=b[3];
	assign g[2]=b[3]^b[2];
	assign g[1]=b[2]^b[1];
	assign g[0]=b[1]^b[0];
endmodule