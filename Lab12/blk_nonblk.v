module fsm_trafic_light(clk,reset, red,yellow, green);
input clk, reset;
//output [1:0] state;
output red,yellow,green;
reg [1:0] next_state;
reg[1:0] state;
reg[1:0]  a,b,c,d,e,f;
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


initial
begin
   //a = #10 1'b1;// The simulator assigns 1 to a at time 10
  // b = #10 1'b0;// The simulator assigns 0 to b at time 30
  // c = #10 1'b1;// The simulator assigns 1 to c at time 70
end

initial
begin
 // d <=  #10  1'b1;// The simulator assigns 1 to d at time 10
 // e <=  #10  1'b0;// The simulator assigns 0 to e at time 20
  f  <= #10  1'b1;// The simulator assigns 1 to f at time 40
end

always @ (posedge clk )
  begin
  a=1;
  b=a;
  end

always @ (posedge clk )
  begin
 c<=1;
  d<=c;
  end
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
