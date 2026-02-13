class gen;
transaction tx;
virtual intf g_intf;

task run();
$display("////////////////GENERATOR//////////////////////");
g_intf=cfg::vintf;

wait(g_intf.rst==1);
@(g_intf.cb);
for(int i=0;i<=255;i++)begin
tx=new();
/*tx.randomize()with {wr_rd==1;};
$display("%0d write=%0d",tx.addr,tx.wr_rd);*/
assert(tx.randomize() with {wr_rd==1;addr==i;wr_data==i;});
//$display("[%0t] 1[GEN]",$time);
/*if(i==255)
$display("i=[%0d]",i);
*/
cfg::gen2drv.put(tx);
end

for(int i=0;i<=255;i++)begin
tx=new();
//tx.randomize() with {wr_rd==0;};
assert(tx.randomize() with {wr_rd==0;});
/*
if(i==255)
$display("i=[%0d]",i);
*/
//$display("[%0t] 1[GEN]",$time);
cfg::gen2drv.put(tx);
end

endtask

endclass
