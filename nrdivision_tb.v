`include "nrdivision.v"

module nrdivision_tb;
reg [15:0] dividend;
reg [14:0] divisior; 
reg clk,reset ;
wire [15:0] rem,quo;

non_restoring_division mod0(dividend,divisior,rem,quo,clk,reset);
initial
begin
$dumpfile("assi10.vcd");
$dumpvars(0,nrdivision_tb);
reset=1'b0;
clk=1'b0;
dividend = 16'b0110100010011010;
divisior = 15'b000000110001010;


#2
dividend = 16'b1101010100100001;
divisior = 15'b000000010011100;
reset = 1'b0;
                              
#2
dividend = 16'b1101010100110001;
divisior = 15'b000001001011101;
reset = 1'b0;

#2
dividend = 16'b1101011100111010;
divisior = 15'b110101000000110; 
reset = 1'b0;
 
#2
dividend = 16'b0101010100111010;
divisior = 15'b100000000110001; 
reset = 1'b0;

end
always
begin
#1 clk=~clk; 

end
always
begin
#60
$finish;
end 


initial
$monitor($time,"  dividend=%d,  divisior=%d,  rem=%d,  quo=%d",dividend,divisior,rem,quo);
endmodule