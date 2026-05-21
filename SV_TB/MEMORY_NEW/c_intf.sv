interface intf(input logic clk,input logic rst);
	logic [7:0] addr;
	logic wr_rd;
	logic [7:0] rd_data;
	logic [7:0] wr_data;

	clocking cb@(posedge clk);
        output addr,wr_data,wr_rd;
	input rd_data;
	endclocking

	modport mod(clocking cb,input clk,input rst);
	
	covergroup c_group@(posedge clk);
	option.per_instance=1;
	option.auto_bin_max=64;
	
	cp1:coverpoint addr;
	cp2:coverpoint wr_rd{bins b1={0,1};}
	cp3:coverpoint rd_data;
	cp4:coverpoint wr_data;
        endgroup

	c_group cg=new();

endinterface
