module asyn_fifo #(parameter data_width=8,depth=8)(
	input wr_clk, 
	input rd_clk, 
	input rst, 
	input [data_width-1:0] data_i, 
	input wr_valid, 
	input rd_valid,
	output reg [data_width-1:0]data_o,
	output fifo_full, 
	output fifo_empty, 
	output error);
localparam addr=$clog2(depth);
reg [addr:0]rd_ptr,rd_ptr_g_s1,rd_ptr_g_s2;
reg [addr:0]wr_ptr,wr_ptr_g_s1,wr_ptr_g_s2;
reg [data_width-1:0]temp[0:depth-1];
wire [addr:0]rd_ptr_g,wr_ptr_g;
//Write operation
always @(posedge wr_clk or posedge rst)begin
	if(rst)begin
		wr_ptr<=0;
	end
	else begin
	       	if(wr_valid && !fifo_full && !error)begin
			temp[(wr_ptr[addr-1:0])]<=data_i;
			wr_ptr<=wr_ptr+1;
		end
	end
end
//read operation
always @(posedge rd_clk or posedge rst)begin
	if(rst)begin
		rd_ptr<=0;
		data_o<='b0;
	end
	else begin
		if(rd_valid && !fifo_empty && !error)begin
			data_o<=temp[(rd_ptr[addr-1:0])];
			rd_ptr<=rd_ptr+1;
		end
	end
end

//gray pointers

assign rd_ptr_g=rd_ptr^(rd_ptr>>1);
assign wr_ptr_g=wr_ptr^(wr_ptr>>1);

//2 Stage synchronizers

always @(posedge wr_clk or posedge rst)begin
	if(rst)begin
		rd_ptr_g_s1<='b0;
		rd_ptr_g_s2<='b0;
	end
	else begin
		rd_ptr_g_s1<=rd_ptr_g;// 1 ff (metastable state)
		rd_ptr_g_s2<=rd_ptr_g_s1;//2 ff (stable state)
	end
end
always @(posedge rd_clk or posedge rst)begin
	if(rst)begin
		wr_ptr_g_s1<='b0;
		wr_ptr_g_s2<='b0;
	end
	else begin
		wr_ptr_g_s1<=wr_ptr_g;
		wr_ptr_g_s2<=wr_ptr_g_s1;
	end
end
//empty and full conditions

assign fifo_empty=rd_ptr_g==wr_ptr_g_s2;
assign fifo_full=wr_ptr_g=={~rd_ptr_g_s2[addr:addr-1],rd_ptr_g_s2[addr-2:0]};
assign error=(wr_valid && fifo_full) || (rd_valid && fifo_empty);
endmodule
