module stable_function;
reg clk,a;

initial 
begin
clk=0;a=0;
end

always #5 clk=~clk;

initial begin
$dumpfile("dump.vcd");
$dumpvars;
#15;a=1;
#10;a=0;
#20;a=1;
#20;a=0;
#20;
$finish;
end
sequence seq1;
@(posedge clk)$stable(a);
endsequence
property p;
seq1;
endproperty
assert property (p)
$display("[%0t] Assersion passed",$time);
else
$error("[%0t] Assersion failed",$time);
endmodule
