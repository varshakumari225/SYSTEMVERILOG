class monitor;
transaction tx;
virtual intf m_intf;

task run();
$display("//////////MONITOR//////////");
m_intf=cfg::vintf;
wait(m_intf.rst==1);
forever begin
tx=new();
@(m_intf.cb);
tx.addr=m_intf.cb.addr;
tx.wr_rd=m_intf.cb.wr_rd;
tx.wr_data=m_intf.cb.wr_data;
tx.rd_data=m_intf.cb.rd_data;
cfg::mon2cov.put(tx);
cfg::mon2che.put(tx);
end

endtask

endclass
