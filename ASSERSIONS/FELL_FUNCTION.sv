module fell_function;
reg clk,a;

initial 
begin
clk=0;a=0;
end

always #5 clk=~clk;

initial begin
$dumpfile("dump.vcd");
$dumpvars;

a=1;
#15;a=0;
#10;a=1;
#20;a=0;
#20;a=1;
/*
repeat(10)begin
a=$urandom_range(0,1);
#5;
end
*/
#20;
$finish;
end
sequence seq1;
@(posedge clk)$fell(a);
endsequence
property p;
seq1;
endproperty
assert property (p)
$display("[%0t] Assersion passed",$time);
else
$error("[%0t] Assersion failed",$time);
endmodule
