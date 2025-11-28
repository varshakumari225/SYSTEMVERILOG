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

//increasing the size of dynamic array
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
