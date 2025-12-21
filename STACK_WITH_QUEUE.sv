
//DESIGN CODE

module stack(
input [7:0] data_in,
input w_lifo,
input r_lifo,
input clk,
input rst,
output empty,
output full,
output reg[7:0] data_out
);
localparam int depth=8;
logic [7:0]lifo[$:depth];

always @(posedge clk or posedge rst)begin
if(rst)begin
lifo.delete();
data_out<=8'b0;
end
else if(w_lifo && !full)begin
	lifo.push_front(data_in);
end

else if(r_lifo && !empty)begin
	data_out<=lifo.pop_front();
end

end

assign full=(lifo.size()==depth);
assign empty=(lifo.size()==0);

endmodule

//TB

module stack_tb;
reg [7:0] data_in;
reg w_lifo;
reg r_lifo;
reg clk;
reg rst;
wire empty;
wire full;
wire [7:0] data_out;

stack dut(
.data_in(data_in),
.w_lifo(w_lifo),
.r_lifo(r_lifo),
.clk(clk),
.rst(rst),
.empty(empty),
.full(full),
.data_out(data_out)
);

task alternate_read_write();
@(posedge clk)
w_lifo=1'b1;
r_lifo=1'b0;
data_in=$random;
@(posedge clk)
r_lifo=1'b1;
w_lifo=1'b0;
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
$display("                 	Q(B)                      ");
$display("------------------------------------------------");
rst=1'b1;

repeat(2)begin
@(posedge clk)
rst=1'b0;
end
repeat(9)begin
@(posedge clk)
w_lifo=1'b1;
r_lifo=1'b0;
data_in=$random;
$display("[%0t] input data :%4d lifo : %0p ",$time,data_in,dut.lifo);
end
@(posedge clk)
w_lifo=1'b0;
$display("[%0t] lifo full : %0d empty : %0d",$time,full,empty);

//Reading data

repeat(10)begin
@(posedge clk)
r_lifo=1'b1;
$display("[%0t] Reading data : %0d ",$time,data_out);
end
$display("[%0t] lifo full : %0d empty : %0d",$time,full,empty);
@(posedge clk);
r_lifo=1'b0;
#90;

$display("%0p",dut.lifo);

repeat(5)begin
alternate_read_write();
display();
end

$finish;
end
endmodule


