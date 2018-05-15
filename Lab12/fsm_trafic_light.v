module fsm_trafic_light(clk,reset, red,yellow, green);
input clk, reset;
//output [1:0] state;
output red,yellow,green;
reg [1:0] next_state;
reg[1:0] state;
parameter [1:0] FIRST= 2'b00;
parameter [1:0] SECOND= 2'b01;
parameter [1:0] THIRD = 2'b10;
parameter [1:0] FOURTH=2'b11;
always @(posedge clk) // sequential
begin
if (reset) state <= FIRST;
else state <= next_state;
end

always @* // combinational
begin
case(state)
FIRST: if (reset)
 	next_state = FIRST;
	else next_state = SECOND;
SECOND: if (reset)
	next_state = FIRST;
	else 	next_state = THIRD;
THIRD: if (reset) 
	next_state = FIRST;
	else 	next_state = FOURTH;
FOURTH: if (reset) 
	next_state = FIRST;
	else 	next_state = FIRST;	
	endcase end
// output logic described using continuous assignment

assign red = (state == FIRST);
assign yellow = (state == SECOND | (state == FOURTH));
assign green = (state == THIRD);
endmodule


module tb_fsm_trafic_light();
reg reset;
wire red, yellow, green;
reg clk=0;

fsm_trafic_light DUT (clk,reset, red, yellow, green);

always #5 clk = ~clk;

 

initial
begin

reset=1'b1; #5;
reset=1'b1; #5;
reset=1'b0; #5;
reset=1'b0; #5;
reset=1'b0; #5;
reset=1'b0; #5;
reset=1'b0; #5;
reset=1'b0; #5;
reset=1'b0; #5;
reset=1'b1; #5;
reset=1'b1; #5;

end
endmodule
