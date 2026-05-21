class driver;

virtual intf b_intf;
transaction tx;
int que[$];

task run();
$display("///////////////DRIVER STARTED/////////////");
b_intf=cfg::vintf;
wait(!b_intf.rst);
forever
begin
cfg::mb.get(tx);

if(tx.wr_rd==1)begin
write_mem();
end
else begin
read_mem();
end
end
endtask

task write_mem();
$display("////////////WRITING////////////////");
@(b_intf.cb);
b_intf.mod.cb.addr<=tx.addr;
que.push_back(tx.addr);
b_intf.mod.cb.wr_data<=tx.wr_data;
b_intf.mod.cb.wr_rd<=1'b1;
$display("address=%0d data=%0d",tx.addr,tx.wr_data);
endtask

task read_mem();
$display("//////////////READING/////////////////");
@(b_intf.cb);
b_intf.mod.cb.addr<=que.pop_back();
b_intf.mod.cb.wr_rd<=1'b0;

@(b_intf.cb);//apply address
@(b_intf.cb);//wait for one clock to get data

tx.rd_data=b_intf.cb.rd_data;
$display("address : %0d reading data : %0d ",b_intf.mod.cb.addr,tx.rd_data);
endtask

endclass

