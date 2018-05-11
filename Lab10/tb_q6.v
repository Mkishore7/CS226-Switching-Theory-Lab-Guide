module tb_decade_counter();
wire [3:0]q;
reg clk = 0;
integer i;
decade_counter UUT(q, clk);
initial begin
for(i = 0; i < 100; i = i + 1)
#10;

end
always @(i) clk = ~clk;
initial begin
#7;
$monitor("%d", q);
end
endmodule

module tb_decoded_counter();
reg clk = 0;
wire ctrl;
integer i = -1;
decoded_counter UUT(ctrl, clk);
initial

for(i = 0; i < 50; i = i + 1)
#5;
always @(i) clk = ~clk;
always @(i/2)
$display("ctrl = %b", ctrl);
endmodule