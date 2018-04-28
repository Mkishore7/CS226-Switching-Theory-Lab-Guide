// lines start with “//” is a comment
// name: p3.v // gate level model
module p3(f, g, h, a, b, c); //you list all inputs and outputs, by convention outputs go first
	output f, g, h; // this tells the compile which lines are inputs and outputs
	input a, b, c;
	
	not n2 (inv_b, b); // defines the inverter gate, see figure
	not n3 (inv_c, c); // defines the inverter gate, see figure
	
	and f_a1 (f_a1_o, a, inv_b); // defines the f_a1 gate, see figure
	and f_a2 (f_a2_o, inv_b, inv_c); // defines the f_a2 gate, see figure
	and f_a3 (f_a3_o, a, c); // defines the f_a3 gate, see figure
	or f_o (f, f_a1_o, f_a2_o, f_a3_o); // defines the f_o gate, see figure
	
	or g_o1 (g_o1_o, inv_b, c); // defines the g_o1 gate, see figure
	or g_o2 (g_o2_o, a, b, inv_c); // defines the g_o2 gate, see figure
	and g_a (g, g_o1_o, g_o2_o); // defines the g_a gate, see figure
	
	and h_a1 (h_a1_o, inv_b, inv_c); // defines the h_a1 gate, see figure
	and h_a2 (h_a2_o, b, c); // defines the h_a2 gate, see figure
	and h_a3 (h_a3_o, a, c); // defines the h_a3 gate, see figure
	or h_o (h, h_a1_o, h_a2_o, h_a3_o); // defines the h_o gate, see figure
endmodule