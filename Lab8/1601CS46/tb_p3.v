module tb_p3(); //test_bench
	reg a, b, c;
	wire f, g, h;
	
	p3 UUT (f, g, h, a, b, c);
	initial
		begin //
			a = 1'b0;
			b = 1'b0;
			c = 1'b0;
			#10;
			
			a = 1'b0;
			b = 1'b0;
			c = 1'b1;
			#10;
			
			a = 1'b0;
			b = 1'b1;
			c = 1'b0;
			#10;
			
			a = 1'b0;
			b = 1'b1;
			c = 1'b1;
			#10;
			
			a = 1'b1;
			b = 1'b0;
			c = 1'b0;
			#10;
			
			a = 1'b1;
			b = 1'b0;
			c = 1'b1;
			#10;
			
			a = 1'b1;
			b = 1'b1;
			c = 1'b0;
			#10;
			
			a = 1'b1;
			b = 1'b1;
			c = 1'b1;
			#10;
		end
		
		initial
		begin
			$monitor("a = %b, b = %b, c = %b, f = %b, g = %b, h = %b, time = %t\n", a, b, c, f, g, h, $time);
		end
endmodule