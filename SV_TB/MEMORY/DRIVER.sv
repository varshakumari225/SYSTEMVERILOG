class driver;

virtual intf b_intf;
transaction tx;
int que[$];

task run();
$display("[%0t] ///////////////DRIVER STARTED/////////////",$time);
b_intf=cfg::vintf;
wait(b_intf.rst==1);
forever
begin
cfg::gen2drv.get(tx);
//$display("[%0t] 2[BFM]",$time);
//$display("[%0t] 2[BFM]",$time);
if(tx.wr_rd==1)begin
write_mem(tx);
end
else begin
read_mem(tx);
end
end
endtask

task write_mem(transaction t);

//$display("////////////WRITING////////////////");
@(b_intf.cb);
$display("[%0t] address : %0d data : %0d",$time,tx.addr,tx.wr_data);
b_intf.cb.addr<=t.addr;
que.push_back(t.addr);
b_intf.cb.wr_data<=t.wr_data;
b_intf.cb.wr_rd<=1'b1;

endtask

task read_mem(transaction t);
//$display("//////////////READING/////////////////");
@(b_intf.cb);
b_intf.cb.addr<=que.pop_back();
b_intf.cb.wr_rd<=1'b0;

@(b_intf.cb);//apply address
@(b_intf.cb);//wait for one clock to get data

t.rd_data=b_intf.cb.rd_data;
$display("[%0t] address : %0d reading data : %0d ",$time,b_intf.cb.addr,tx.rd_data);
endtask

endclass

