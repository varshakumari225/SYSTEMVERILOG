
class monitor;
transaction tx;
virtual intf m_intf;

task run();
$display("//////////MONITOR//////////");
m_intf=cfg::vintf;
wait(m_intf.rst==1);
	forever begin
	@(m_intf.cb);
	tx=new();
	tx.addr=m_intf.cb.addr;
	tx.wr_rd=m_intf.cb.wr_rd;
	tx.wr_data=m_intf.cb.wr_data;

	if(m_intf.cb.wr_rd==0)begin
	@(m_intf.cb);
	@(m_intf.cb);
	tx.rd_data=m_intf.cb.rd_data;
	end
	cfg::mon2cov.put(tx);
	cfg::mon2che.put(tx);
	
	end
endtask

endclass
