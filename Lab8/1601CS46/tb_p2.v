module tb_p2(); //test_bench
	reg[2:0] D; 
	wire L;
	
	integer i;
	p2 UUT (L, D); 
	initial
		begin
			#10 $monitor("D = %b", D, "  |  L = ", L);
		    for( i = 0; i <= 7; i = i + 1)
			    begin
				  D = i;#10
				  $display("-----------------------------------------");
				end
		end
endmodule