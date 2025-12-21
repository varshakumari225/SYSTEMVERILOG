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
