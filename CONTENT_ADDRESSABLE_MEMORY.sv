module cam;
bit [2:0]mem[byte];
byte index;
initial begin
  mem[8'h00] = 3'b001;
  mem[8'h01] = 3'b101;
  mem[8'h7F] = 3'b111;
for(int i=3;i<=7;i=i+2)begin
mem[i]=i[2:0];
end
$display("%0p",mem);

//printing value at particular index
$display("%0p",mem[5]);
//check if the particular index is present or not
if(mem.exists(8'h03))
$display("Index exists : index=8'h03 value=%0d",mem[8'h03]);
else
$display("Index not exists");
//Printing last conent of the memory
mem.last(index);
$display("index : %0h, value : %0d",index,mem[index]);
end
endmodule
