class coverage;
transaction tx;
covergroup cg();
option.per_instance=1;
option.auto_bin_max=256;
cp_addr:coverpoint tx.addr;
cp_wr_rd:coverpoint tx.wr_rd{bins read={0};
			     bins write={0};}
cp_wr_data:coverpoint tx.wr_data;
cp_rd_data:coverpoint tx.rd_data;
endgroup

function new();
cg=new();
endfunction

task run();
$display("////////// COVERAGES //////////");
forever begin
cfg::mon2cov.get(tx);
cg.sample();
end
endtask

endclass
