// lines start with “//” is a comment
// name: p7.v

//in test_bench just change module name and get run all the modules

//6 ways to implement 4 to 1 MUX

//1
module p7_1(Z, D, S); //you list all inputs and outputs, by convention outputs go first
	
	output Z; // this tells the compile which lines are inputs and outputs
	input[3:0] D;
	input[1:0] S;
	
	not n0 (inv_S0, S[0]); // defines the inverter gate, see figure
	not n1 (inv_S1, S[1]); // defines the inverter gate, see figure
	
	and a0 (a0_o, D[0], inv_S1, inv_S0); // defines the a0 gate, see figure
	and a1 (a1_o, D[1], inv_S1, S[0]); // defines the a1 gate, see figure
	and a2 (a2_o, D[2], S[1], inv_S0); // defines the a2 gate, see figure
	and a3 (a3_o, D[3], S[1], S[0]); // defines the a3 gate, see figure
	or o0 (Z, a0_o, a1_o, a2_o, a3_o); // defines the o1 gate, see figure
endmodule
	
//2
module p7_2(Z, D, S);
	output Z;
	input[1:0] S;
	input[3:0] D;
	
	wire Z;
	wire[1:0] S;
	wire[3:0] D;

	assign Z = D[S];
endmodule
	
//3
module p7_3(Z, D, S);

	output Z; // this tells the compile which lines are inputs and outputs
	input[3:0] D;
	input[1:0] S;

	reg Z;
	wire[1:0] S;
	wire[3:0] D;

	always @(S or D)
	begin
		Z = D[S];
	end
endmodule

//4
module p7_4(Z, D, S);
	
	output Z;
	input[1:0] S;
	input[3:0] D;

	wire Z;
	wire[1:0] S;
	wire[3:0] D;

	assign Z = ( S == 0 )? D[0] : (( S == 1 )? D[1] : ((S == 2 )? D[2] : D[3]));
endmodule

//5
module p7_5(Z, D, S);

	output     Z;
	input[1:0] S;
	input[3:0] D;

	reg Z;
	wire[1:0] S;
	wire[3:0] D;

	always @( S or D )
	begin
	   case( S )
		   0 : Z = D[0];
		   1 : Z = D[1];
		   2 : Z = D[2];
		   3 : Z = D[3];
	   endcase
	end
endmodule

//6
module p7_6(Z, D, S); //behavioral module 

	output Z;
	input[1:0] S;
	input[3:0] D;
	

	reg Z;
	wire[1:0] S;
	wire[3:0] D;

	always @( S or D)
	begin
		Z = ( ~S[0] & ~S[1] & D[0] ) | (  S[0] & ~S[1] & D[1] ) | ( ~S[0] &  S[1] & D[2] ) | (  S[0] &  S[1] & D[3] );
	end
endmodule