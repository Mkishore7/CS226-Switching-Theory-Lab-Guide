// lines start with “//” is a comment
// name: p1.v // gate level model
module p1(Z, D, S); //you list all inputs and outputs, by convention outputs go first
	output Z; // this tells the compile which lines are inputs and outputs
	input[3:0] D;
	input[1:0] S;
	
	not n0 (inv_S0, S[0]); // defines the inverter gate, see figure
	not n1 (inv_S1, S[1]); // defines the inverter gate, see figure
	
	and a0 (a0_o, D[0], inv_S1, inv_S0); // defines the a0 gate, see figure
	and a1 (a1_o, D[1], inv_S1, S[0]); // defines the a1 gate, see figure
	and a2 (a2_o, D[2], S[1], inv_S0); // defines the a2 gate, see figure
	and a3 (a3_o, D[3], S[1], S[0]); // defines the a3 gate, see figure
	nor o0 (Z, a0_o, a1_o, a2_o, a3_o); // defines the o1 gate, see figure
endmodule