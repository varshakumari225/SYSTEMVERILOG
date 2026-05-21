module top;
logic clk;
logic rst;
intf h_intf(.clk(clk),.rst(rst));//interface
test tb();
mem dut(.clk(h_intf.clk),.rst(h_intf.rst),.addr(h_intf.addr),.wr_rd(h_intf.wr_rd),.wr_data(h_intf.wr_data),.rd_data(h_intf.rd_data));

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin 
cfg::vintf=h_intf;
end

initial begin
#200000;$display("Coverage =%0.2f%%",h_intf.cg.get_inst_coverage());
$finish;
end

initial begin
$display("////////////////////TOP MODULE/////////////////////");
rst=1;
repeat(2)
@(posedge clk);
rst=0;
end

endmodule
