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

endinterface
