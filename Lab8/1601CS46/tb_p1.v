module tb_p1(); //test_bench
	reg[3:0] D; //array D
	reg[1:0] S; //array S
	wire Z; 
	integer i;
	p1 UUT (Z, D, S);
	initial
		begin
			 #10 $monitor("D = %b", D, "  |  S = %b", S, "  |  Z = ", Z);
		   for( i = 0; i <= 15; i = i + 1) //D varies from 0 to 1111
			   begin
				  D = i;
				  S = 0;  #10; //corresponding variation of S
				  S = 1;  #10;
				  S = 2;  #10;
				  S = 3;  #10;
				  $display("-----------------------------------------");
				end
		end
endmodule