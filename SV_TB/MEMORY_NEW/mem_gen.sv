class gen;
transaction tx;
virtual intf g_intf;

task run();
$display("////////////////GENERATOR//////////////////////");
g_intf=cfg::vintf;
wait(g_intf.rst==0);
@(posedge g_intf.clk);

for(int i=0;i<255;i++)begin
tx=new();
assert(tx.randomize() with {wr_rd==1;});
$write("[%0d]",i);
cfg::mb.put(tx);
end

for(int j=0;j<255;j++)begin
tx=new();

//assert(tx.randomize() with {wr_rd==0;});
g_intf.wr_rd=0;
cfg::mb.put(tx);
$write("[%0d]",j);
end

endtask

endclass
