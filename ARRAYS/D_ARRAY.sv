
module top;
int a;
longint b;
byte c;
string d;

//PACKED ARRAYS

bit [8:0]bit_packed_array;
bit [2:0][1:0]ex;

//UNPACKED ARRAYS

int unpack[8:0];
bit upa[5:0][1:0];

//QUEUE 

string seeds[$];
assign seeds={"pupkin","sunflower","chia","sabja","watermilon"};

initial begin
a=32'd90;
b=64'h1234567891234567;
c=8'b10101101;
d="assignments 1 completed";
$display("a=%0d b=%0h c=%ob d=%0s",a,b,c,d);

$display("------------------------------------------");
$display("PACKED ARRAY SINGLE AND MULTI DIMENTIONAL");
$display("------------------------------------------");

	bit_packed_array=9'b010101011;
	ex=6'o66;//6'b110110
	foreach(bit_packed_array[i])begin
		$display("bit_packed_array[%0d]=%b ",i,bit_packed_array[i]);
	end
	for(int j=0;j<=$size(ex[j]);j++)begin
		$display("ex[%0d]=%b ",j,ex[j]);
	end
	$display("bit packed array=%p",bit_packed_array);


$display("----------------------------------------------");
$display("UNPACKED ARRAY SINGLE AND MULTI DIMENTIONAL");
$display("----------------------------------------------");


	foreach(unpack[p])begin
	unpack[p]=2**p;
	$display("unpack[%0d]=%d",p,unpack[p]);
	end

	foreach(upa[k])
	foreach(upa[k][l])begin
	upa[k][l]=$random;
	$display("unpacked array[%0d][%0d]=%0d",k,l,upa[k][l]);
	end
	$display("unpacked array=%p",upa);


$display("------------------------------------------");
$display("                 QUEUE                    ");
$display("------------------------------------------");

	
	foreach(seeds[q])begin
	$display("seed=%s",seeds[q]);
	end
	$display("seeds=%p",seeds);
end
endmodule
