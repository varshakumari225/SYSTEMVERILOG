class coverage;
transaction tx;
//virtual intf cov_intf;
covergroup cg();
option.per_instance=1;
//option.auto_bin_max=256;
//cp_addr:coverpoint tx.addr{bins s[]={[0:255]};}
cp_addr:coverpoint tx.addr{option.auto_bin_max=8;}
cp_wr_rd:coverpoint tx.wr_rd{option.auto_bin_max=2;}
cp_wr_data:coverpoint tx.wr_data{option.auto_bin_max=8;}
cp_rd_data:coverpoint tx.rd_data{option.auto_bin_max=8;}
endgroup

function new();
cg=new();
endfunction

task run();
$display("////////// COVERAGES //////////");
//cov_intf=cfg::vintf;
//wait(cov_intf.rst==1);
forever begin
cfg::mon2cov.get(tx);
cg.sample();
end
endtask

endclass
