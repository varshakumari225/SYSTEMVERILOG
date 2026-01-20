class gen;
transaction tx;
virtual intf g_intf;

task run();
$display("////////////////GENERATOR//////////////////////");
g_intf=cfg::vintf;
wait(g_intf.rst==1);
@(g_intf.cb);

for(int i=0;i<=5;i++)begin
tx=new();
assert(tx.randomize() with {wr_rd==1;});
cfg::gen2drv.put(tx);
end

for(int j=0;j<=5;j++)begin
tx=new();

assert(tx.randomize() with {wr_rd==0;});
g_intf.wr_rd=0;
cfg::gen2drv.put(tx);
end

endtask

endclass
