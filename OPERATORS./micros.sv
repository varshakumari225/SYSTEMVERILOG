//DESIGN

`define add 1'b0
`define sub 1'b1
module as #(parameter width=5,parameter operation=`add)(input clk,input [width-1:0]a,b,output reg [width-1:0]result);
  always @(posedge clk)begin
    if(operation==`add)begin
      result<=a+b;
    end
    else if(operation==`sub)begin
      result=a-b;
    end
    else
      result=a+b;
  end
endmodule

//TB
