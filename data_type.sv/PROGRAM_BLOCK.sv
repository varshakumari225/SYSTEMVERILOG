
  //Program block executes in reactive region.the initial block inside the program block will executes only once. 

module top(output bit [2:0] data);

initial begin
data<=7;
end
endmodule

module tb_top;
wire [2:0] data;
top dut(.data(data));
program_b p(data);
endmodule

program program_b(input bit [2:0] data);
//module program_b(input bit [2:0] data);
initial begin
$display("data : ",data);
end
//endmodule
endprogram


//OUTPUT 

data : 7
