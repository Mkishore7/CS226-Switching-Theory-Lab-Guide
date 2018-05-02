module mux(out, in1, in2, cntrl);
output [15:0]out;
input [15:0] in1, in2;
input cntrl;
always@(in1, in2, cntrl)
begin
	if(cntrl)	out = in1;
	else out = in2;	
end
endmodule
