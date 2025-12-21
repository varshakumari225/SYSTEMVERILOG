//PACKED ARRAYS

module p_array;
bit [8:0]bit_packed_array;
bit [2:0][1:0]ex;
//int [4:0]error;//packed array only have bit,logic,reg datatype;
initial begin
	bit_packed_array=9'b010101011;
	ex=6'o66;//6'b110110
	foreach(bit_packed_array[i])begin
		$display("bit_packed_array[%0d]=%b ",i,bit_packed_array[i]);
	end
	for(int j=0;j<=$size(ex[j]);j++)begin
		$display("ex[%0d]=%b ",j,ex[j]);
	end
end
endmodule

//PACKED ARRAYS

module packed_array;
bit [4:0]a;//4,3,2,1,0
bit [4:0]b;
bit [4:0]c;
bit [1:0]d;
bit [1:5]e;//1,2,3,4,5
//assign c=a&b;
//assign c=a|b;
assign c=a^b;
//assign e=a;
assign d=b;
assign e=$urandom_range(0,100);
initial begin
a=4'b1011;
b=4'b1010;
$display("array A=%0b",a);
$display("array B=%0b",b);
$display("array c=%0b",c);
$display("array d=%0b",d);
$display("array e=%0b",e);
end
endmodule
