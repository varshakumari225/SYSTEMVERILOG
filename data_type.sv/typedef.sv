typedef logic [3:0]nibble;
module nibble_dt;
nibble Nibble;
assign Nibble=4'b1011;
initial begin
$display("value=%0b",Nibble);
end
endmodule
