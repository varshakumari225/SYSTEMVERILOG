
//DESIGN CODE

module FIFO(
input [7:0] data_in,
input w_fifo,
input r_fifo,
input clk,
input rst,
output empty,
output full,
output reg[7:0] data_out
);
localparam int depth=8;
logic [7:0]fifo[$:depth];

always @(posedge clk or posedge rst)begin
if(rst)begin
fifo.delete();
data_out<=8'b0;
end
else if(w_fifo && !full)begin
	fifo.push_front(data_in);
end

else if(r_fifo && !empty)begin
	data_out<=fifo.pop_back();
end

end

assign full=(fifo.size()==depth);
assign empty=(fifo.size()==0);

endmodule

//TB

module tb;
reg [7:0] data_in;
reg w_fifo;
reg r_fifo;
reg clk;
reg rst;
wire empty;
wire full;
wire [7:0] data_out;

FIFO dut(
.data_in(data_in),
.w_fifo(w_fifo),
.r_fifo(r_fifo),
.clk(clk),
.rst(rst),
.empty(empty),
.full(full),
.data_out(data_out)
);

task alternate_read_write();
@(posedge clk)
w_fifo=1'b1;
r_fifo=1'b0;
data_in=$random;
@(posedge clk)
r_fifo=1'b1;
w_fifo=1'b0;
endtask

task display();
$display("Writing data : %0d",data_in);
//$display("data inside the fifo : %0p",dut.fifo);
$display("Reading data : %0d",data_out);
endtask
 
initial clk=0;
always #5 clk=~clk;
initial begin

$display("------------------------------------------------");
$display("                 	Q(A)                      ");
$display("------------------------------------------------");

rst=1'b1;

repeat(2)begin
@(posedge clk)
rst=1'b0;
end
repeat(9)begin
@(posedge clk)
w_fifo=1'b1;
r_fifo=1'b0;
data_in=$random;
$display("[%0t] input data :%0d fifo : %0p ",$time,data_in,dut.fifo);
end
@(posedge clk)
w_fifo=1'b0;
$display("[%0t] fifo full : %0d empty : %0d",$time,full,empty);

//Reading data

repeat(10)begin
@(posedge clk)
r_fifo=1'b1;
$display("[%0t] Reading data : %0d ",$time,data_out);
end
$display("[%0t] fifo full : %0d empty : %0d",$time,full,empty);
@(posedge clk);
r_fifo=1'b0;
#90;

$display("%0p",dut.fifo);

repeat(5)begin
alternate_read_write();
display();
end

$finish;
end
endmodule



