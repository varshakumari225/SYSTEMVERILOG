module array;

typedef int queue[$];
typedef queue array_of_queue[5];
array_of_queue arr;
initial begin
arr[0]={1,2,3};
arr[1]={10,80};
arr[2]={1,2,3,4,5,6,7,8,9,10};
arr[3]={90,90};
arr[4]={};
arr[5]={1,2,3,4,5,6};
$display("array=%p",arr);
end
endmodule
