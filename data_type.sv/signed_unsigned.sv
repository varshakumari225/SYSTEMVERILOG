module top;
byte b;
bit [7:0]c;
assign b=-10;
assign c=-10;
initial begin
$display("unsigned value=%0d signed value=%0d",c,b);
end
endmodule
module bottom;
byte b;
bit signed[7:0]c;
assign b=-10;
assign c=-10;
initial begin
$display("bit=%0d byte=%0d",c,b);
end
endmodule
