module tb_p5();
	reg m2, m1, m0;
	wire A;
	
	p5 UUT (A, m2, m1, m0);
	initial
		begin
			m2 = 1'b0;
			m1 = 1'b0;
			m0 = 1'b0;
			#10;
			
			m2 = 1'b0;
			m1 = 1'b0;
			m0 = 1'b1;
			#10;
			
			m2 = 1'b0;
			m1 = 1'b1;
			m0 = 1'b0;
			#10;
			
			m2 = 1'b0;
			m1 = 1'b1;
			m0 = 1'b1;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b0;
			m0 = 1'b0;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b0;
			m0 = 1'b1;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b1;
			m0 = 1'b0;
			#10;
			
			m2 = 1'b1;
			m1 = 1'b1;
			m0 = 1'b1;
			#10;
		end
		
		initial
		begin
			$monitor("m2 = %b, m1 = %b, m0 = %b, A = %b, time = %t\n", m2, m1, m0, A, $time);
		end
endmodule