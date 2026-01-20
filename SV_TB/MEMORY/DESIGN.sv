module mem(
input [7:0]addr,
input wr_rd,
output reg [7:0] rd_data,
input [7:0] wr_data,
input clk,rst
);
reg [7:0]memory[255:0];

always @(posedge clk)begin

if(!rst)begin
rd_data<=8'b0;
end

else begin
if(wr_rd)begin
memory[addr]<=wr_data;
end

else begin
rd_data<=memory[addr];
end
end

end
endmodule
