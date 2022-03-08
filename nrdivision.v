`include "cla2.v"
`include "dflipflop16.v"

module Algorithm(a,q,m,a2,q2);
input [15:0] a,q,m;
output [15:0] a2,q2;
 
wire [15:0] t,mr; 
 
reg [15:0] m1,a1,q1,q2;

assign t = ~m;

CLA mod0(t,16'd1,mr);    

always @(a,q,m,mr)
begin 

     if (a[15] == 1'b1)                                      
        begin 
             {a1[15:0],q1[15:0]} <= {a[14:0],q[15:0],1'b0};
             m1 <= m;
      
        end                                                  
     else if (a[15] == 1'b0)                                
        begin
            {a1[15:0],q1[15:0]} <= {a[14:0],q[15:0],1'b0};
             m1 <= mr; 
 
        end 
        
end  

CLA mod1(a1,m1,a2);

always @(a2,q1)
begin        
       if (a2[15] == 1'b1)                                
          begin 
               q2[15:0] <= {q1[15:1],1'b0};
          end                                             
       else if (a2[15] == 1'b0)
        begin
               q2[15:0] <= {q1[15:1],1'b1};
 
        end     

end

endmodule



module non_restoring_division(dividend,divisior,rem,quo,clk,reset);

input [15:0] dividend;
input [14:0] divisior;
input clk,reset;
output [15:0] rem,quo; 

wire [15:0] out,out1;
wire [15:0] m,qm,qm1,qm2,qm3,qm4,qm5,qm6,qm7,qm8,qm9,qm10,qm11,qm12,qm13,qm14,qm15;
wire [15:0] aa,aa1,aa2,aa3,aa4,aa5,aa6,aa7,aa8,aa9,aa10,aa11,aa12,aa13,aa14,aa15,aa16;
wire [15:0] qq,qq1,qq2,qq3,qq4,qq5,qq6,qq7,qq8,qq9,qq10,qq11,qq12,qq13,qq14,qq15,qq16;
wire [15:0] qaa1,qaa2,qaa3,qaa4,qaa5,qaa6,qaa7,qaa8,qaa9,qaa10,qaa11,qaa12,qaa13,qaa14,qaa15,qaa16;
wire [15:0] qqq1,qqq2,qqq3,qqq4,qqq5,qqq6,qqq7,qqq8,qqq9,qqq10,qqq11,qqq12,qqq13,qqq14,qqq15,qqq16;

assign m = {1'b0,divisior};
assign aa = 16'b0;
assign qq = dividend;  


//stage - 0
Algorithm mod2(aa,qq,m,aa1,qq1); 
//1st stage pipeline
dflipflop16 mod3(qq1,qqq1,clk,reset);
dflipflop16 mod4(aa1,qaa1,clk,reset);
dflipflop16 mod5(m,qm,clk,reset);

//stage - 1 
Algorithm mod6(qaa1,qqq1,qm,aa2,qq2);
//2nd stage pipeline
dflipflop16 mod7(qq2,qqq2,clk,reset);
dflipflop16 mod8(aa2,qaa2,clk,reset);
dflipflop16 mod9(qm,qm1,clk,reset); 

//satge - 2                       
Algorithm mod10(qaa2,qqq2,qm1,aa3,qq3);
//3rd stage pipeline
dflipflop16 mod11(qq3,qqq3,clk,reset);
dflipflop16 mod12(aa3,qaa3,clk,reset);
dflipflop16 mod13(qm1,qm2,clk,reset);

//stage - 3
Algorithm mod14(qaa3,qqq3,qm2,aa4,qq4);
//4th stage pipeline
dflipflop16 mod15(qq4,qqq4,clk,reset);
dflipflop16 mod16(aa4,qaa4,clk,reset);
dflipflop16 mod17(qm2,qm3,clk,reset);

//stage - 4
Algorithm mod18(qaa4,qqq4,qm3,aa5,qq5);
//5th stage pipeline
dflipflop16 mod19(qq5,qqq5,clk,reset);
dflipflop16 mod20(aa5,qaa5,clk,reset);
dflipflop16 mod21(qm3,qm4,clk,reset);

//stage - 5
Algorithm mod22(qaa5,qqq5,qm4,aa6,qq6);
//6th stage pipeline
dflipflop16 mod23(qq6,qqq6,clk,reset);
dflipflop16 mod24(aa6,qaa6,clk,reset);
dflipflop16 mod25(qm4,qm5,clk,reset);

//stage - 6
Algorithm mod26(qaa6,qqq6,qm5,aa7,qq7);
//7th stage pipeline
dflipflop16 mod27(qq7,qqq7,clk,reset);
dflipflop16 mod28(aa7,qaa7,clk,reset);
dflipflop16 mod29(qm5,qm6,clk,reset);

//stage - 7
Algorithm mod30(qaa7,qqq7,qm6,aa8,qq8);
//8th stage pipeline
dflipflop16 mod31(qq8,qqq8,clk,reset);
dflipflop16 mod32(aa8,qaa8,clk,reset);
dflipflop16 mod33(qm6,qm7,clk,reset);

//stage - 8
Algorithm mod34(qaa8,qqq8,qm7,aa9,qq9);
//9th stage pipeline
dflipflop16 mod35(qq9,qqq9,clk,reset);
dflipflop16 mod36(aa9,qaa9,clk,reset);
dflipflop16 mod37(qm7,qm8,clk,reset);


//stage - 9
Algorithm mod38(qaa9,qqq9,qm8,aa10,qq10); 
//10th stage pipeline
dflipflop16 mod39(qq10,qqq10,clk,reset);
dflipflop16 mod40(aa10,qaa10,clk,reset);
dflipflop16 mod41(qm8,qm9,clk,reset);

//stage - 10
Algorithm mod42(qaa10,qqq10,qm9,aa11,qq11);
//11th stage pipeline
dflipflop16 mod43(qq11,qqq11,clk,reset);
dflipflop16 mod44(aa11,qaa11,clk,reset);
dflipflop16 mod45(qm9,qm10,clk,reset);

//stage - 11
Algorithm mod46(qaa11,qqq11,qm10,aa12,qq12);
//12th stage pipeline
dflipflop16 mod47(qq12,qqq12,clk,reset);
dflipflop16 mod48(aa12,qaa12,clk,reset);
dflipflop16 mod49(qm10,qm11,clk,reset);

//stage - 12
Algorithm mod50(qaa12,qqq12,qm11,aa13,qq13);
//13th stage pipeline
dflipflop16 mod51(qq13,qqq13,clk,reset);
dflipflop16 mod52(aa13,qaa13,clk,reset);
dflipflop16 mod53(qm11,qm12,clk,reset);

//stage - 13
Algorithm mod54(qaa13,qqq13,qm12,aa14,qq14);
//14th stage pipeline
dflipflop16 mod55(qq14,qqq14,clk,reset);
dflipflop16 mod56(aa14,qaa14,clk,reset);
dflipflop16 mod57(qm12,qm13,clk,reset); 

//stage - 14
Algorithm mod58(qaa14,qqq14,qm13,aa15,qq15);
//15th stage pipeline
dflipflop16 mod59(qq15,qqq15,clk,reset);
dflipflop16 mod60(aa15,qaa15,clk,reset);
dflipflop16 mod61(qm13,qm14,clk,reset); 

//stage - 15
Algorithm mod62(qaa15,qqq15,qm14,aa16,qq16);
//16th stage pipeline
dflipflop16 mod63(qq16,qqq16,clk,reset);
dflipflop16 mod64(aa16,qaa16,clk,reset);
dflipflop16 mod65(qm14,qm15,clk,reset); 
 

assign quo = qqq16;

CLA mod66(qaa16,qm15,out);

mux16 mod67(qaa16,out,qaa16[15],clk,out1);

assign rem = out1; 



endmodule