


module Combo_CA (Y,A, B, C, D);
output Y;
input A, B, C, D;
reg Y;
always@(A or B or C or D)
begin Y = (~(A | D)) & (B & C & ~D); end
endmodule

