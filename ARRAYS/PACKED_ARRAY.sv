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
