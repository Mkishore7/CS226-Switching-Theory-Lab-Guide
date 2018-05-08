module tb_p1(); //test_bench
	wire [3:0]G; 
	reg [3:0]B;
	integer i;
	p1 UUT (G,B); 
	initial
		begin
		    for( i = -1; i <= 15; i = i + 1) //varying B 
			    begin
				  B = i;#10
				  $monitor("B = %b", B, "  |  G = %b", G);
				  $display("-----------------------------------------");
				end
		end
endmodule