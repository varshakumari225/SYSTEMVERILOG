//UNPACKED ARRAYS

module up_arrays;
int unpack[8:0];
bit upa[5:0][1:0];//6 rows 2 coloums
int j,k;
initial begin
//unpack[0]=32'feabcdae;
foreach(unpack[i])begin
unpack[i]=2**i;
$display("unpack[%0d]=%d",i,unpack[i]);
end

foreach(upa[j])
foreach(upa[j][k])begin
upa[j][k]=$random;
$display("unpacked array[%0d][%0d]=%0d",j,k,upa[j][k]);
end
  
$display("unpacked array=%p",upa);
end
endmodule
