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
