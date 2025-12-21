//QUEUE 

module queue;
string seeds[$];
  assign seeds={"pumpkin","sunflower","chia","sabja","watermilon"};
initial begin
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
  seeds.insert(1,"papaya");//inserting papaya seeds at index 1
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
  seeds.delete(0);//deleting the ele at index 0
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
  seeds.push_back("tulasi");//inserting ele from back
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);
  seeds.push_front("apple");//inserting ele from front
$display("Types of seeds=%0d names=%p",seeds.size(),seeds);

$display("Types of seeds=%0d names=%p",seeds.size(),seeds.pop_front());

$display("Types of seeds=%0d names=%p",seeds.size(),seeds.pop_back());

//slicing

  $display(seeds[1:2]);//printing values from index 1 to 2

end
endmodule 

//QUEUE 1


module que;
int que[$];
int i;
initial begin
$display("----------------------------------------");
$display("                  Q5(B)                 ");
$display("----------------------------------------");
for(i=0;i<=5;i++)begin
que.push_front(i**2);
que.push_back(2**i);
end
$display("%0p",que);
$display("---------------------------------");
repeat(2)begin
$display("pop front :%0d",que.pop_front());
$display("pop back :%0d",que.pop_back());
end
$display("---------------------------------");
que.delete();
$display("The size of the queue is : %0d",que.size());

end
endmodule

//RANDOM QUEUE

module r_que;
int q[$];
parameter size=5;
int intx,temp;

initial begin
$display("----------------------------------------");
$display("                  Q5(A)                 ");
$display("----------------------------------------");
//assigning values for queue

for(int i=1;i<size;i++)begin
q.push_back(i**2);
end

//printin all values along with index
$display("-------------------------------------");
foreach(q[i])begin
$display("queue values index : %0d value : %0d",i,q[i]);
end

//Display the size of queue
$display("-------------------------------------");
$display("Size of the queue : %0d",q.size());

//Randomize the intx and print the value of the queue randomly
$display("-------------------------------------");
repeat(2)begin
std::randomize(intx) with {intx>=0;intx<q.size();};
//$display("intx : %0d",intx);
$display("Random index : %0d value : %0d ",intx,q[intx]);
end

//Deleting value at random index and printing the size of the queue
$display("--------------------------------------------");
$display("The size of the queue before deleting : %0p",q.size());
q.delete(intx);
$display("-----------------------------------------------------------------");
$display("The size of the queue after deleting : %0p index :%0d  value :%0d",q.size(),intx,q[intx]);
$display("-----------------------------------------------------------------");
q.delete(intx);
$display("The size of the queue after deleting : %0p index :%0d value :%0d",q.size(),intx,q[intx]);

//Inserting value 10 at index 2
$display("-----------------------------------------------------------------");
q.insert(2,10);
$display("%0p",q);

end
endmodule
 
