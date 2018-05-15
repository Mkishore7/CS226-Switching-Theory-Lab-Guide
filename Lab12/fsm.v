module fsm(pause,restart,clk, rst, state,odd,even, terminal);
input pause,restart,clk, rst, odd,even;
output [1:0] state;
output terminal;

reg[1:0] next_state,state;
parameter [1:0] FIRST= 2'b11;
parameter [1:0] SECOND= 2'b01;
parameter [1:0] THIRD = 2'b10;
always @(posedge clk) // sequential
begin
if (rst) state <= FIRST;
else state <= next_state;
end

always @* // combinational
begin
case(state)
FIRST: if (restart | pause)
 	next_state = FIRST;
	else next_state = SECOND;
SECOND: if (restart)
	 next_state = FIRST;
	else 	if (pause) next_state = SECOND;
	else next_state = THIRD;
THIRD: if (!restart & pause) next_state = THIRD;
	else next_state = FIRST;
	default: next_state = FIRST;
	endcase end
// output logic described using continuous assignment
assign odd = (state == FIRST) | (state == THIRD);
assign even = (state == SECOND);
assign terminal = (state == THIRD) & (restart | !pause);
endmodule


module tb_fsm();
reg pause,restart, rst;
wire state,odd,even;
wire terminal;
reg clk=0;

fsm DUT (pause,restart,clk, rst, state,odd,even, terminal);

always #5 clk = ~clk;



initial
begin

pause=1'b0;restart=1'b1;rst=1'b1; #5;
pause=1'b0;restart=1'b1;rst=1'b1; #5;
pause=1'b0;restart=1'b0;rst=1'b0; #5;
pause=1'b0;restart=1'b0;rst=1'b0; #5;
pause=1'b0;restart=1'b1;rst=1'b0; #5;
pause=1'b0;restart=1'b1;rst=1'b0; #5;
pause=1'b0;restart=1'b0;rst=1'b0; #5;
pause=1'b0;restart=1'b0;rst=1'b0; #5;

end
endmodule
