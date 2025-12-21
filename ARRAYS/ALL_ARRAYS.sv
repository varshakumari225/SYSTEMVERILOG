
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

//DYNAMIC ARRAYS

module dynamic_a;
int dyn_arr[];
int dyn1[];
initial begin
dyn_arr=new[10];
dyn1=new[6];
foreach(dyn_arr[i])begin
dyn_arr[i]=2**i;
$display("dyanamic array[%0d]=%0d",i,dyn_arr[i]);
end
$display("dynamic array=%p",dyn_arr);

foreach(dyn1[j])begin
dyn1[j]=2*j;
end
$display("dyn1=%p",dyn1);

//increasing thesize of dynamic array

//method 1:existing elements are deleted and size is increased.

/*dyn_arr=new[20];
$display("dynamic array=%p",dyn_arr);*/

//method 2:elements are kept as it is and size is increased. 

dyn_arr=new[20](dyn_arr);
$display("dynamic array=%p",dyn_arr);

//BUILT IN FUNCTIONS

$display("array size=%0d",dyn_arr.size());
dyn1.delete();
$display("dyn1 size=%0d",dyn1.size());

end
endmodule

//QUEUE 

module queue;
string seeds[$];
assign seeds={"pupkin","sunflower","chia","sabja","watermilon"};
initial begin
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
seeds.insert(1,"papaya");
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
seeds.delete(0);
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
seeds.push_back("tulasi");
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
seeds.push_front("apple");
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);

$display("Types of seeds=%0d names=%p",seeds.size(),seeds.pop_front());

$display("Types of seeds=%0d names=%p",seeds.size(),seeds.pop_back());

//slicing

$display(seeds[1:2]);

end
endmodule 

//ASSOCIATIVE ARRAY 

module associate_array;
string branch[string];
int marks[string];
initial begin
branch["alice"]="EEE";
branch["bob"]="ECE";
branch["charlies"]="MECH";
$display("name,branch",branch);
marks["alice"]=85;
marks["bob"]=70;
marks["charlies"]=90;
$display("name,marks:",marks);
$display("no.of students=%0d",branch.num());
begin
string f;
branch.first(f);
$display("first student=%0s s.no=%0d",f,branch.first(f));
end
begin
string g,h;
branch.last(g);
$display("Last student=%0s s.no=%0d",g,branch.last(g));
end
begin
string g;
branch.next(g);
$display(" student=%0s s.no=%0d",g,branch.next(g));
end 

if(branch.exists("bob"))
$display("exixts ");
else
$display("not exists");

end
endmodule
