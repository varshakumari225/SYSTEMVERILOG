typedef struct{
	int data;
	string name;
}array;

module arrays_with_struct;
//fixed array
array static_array[6];

//dynamic array:size is declared during the runtime
array dynamic_array[];

//queue
array queue[$];

//associative array
array associate_array[string];
//assign 	queue='{"apple","banana","mango","water_apple","cherries"};
 initial begin
	 $display("    FIXED (OR) STATIC ARRAY     ");
	 foreach(static_array[i])begin
		 static_array[i].data=i*10;
		 static_array[i].name=$sformatf("index %0d",i);
		 $display("[%0t]  data=%0d name=%0s",$time,static_array[i].data,static_array[i].name);
#10;
	 end

	 $display("    DYNAMIC ARRAY     ");
	dynamic_array=new[10];
	foreach(dynamic_array[j])begin
	dynamic_array[j].data=j**2;
	dynamic_array[j].name=$sformatf("index %0d",j);
	$display("[%0t]  data=%0d name=%0s",$time,dynamic_array[j].data,dynamic_array[j].name);
	end

	$display("    QUEUE     ");
	
	$display("queue %p",queue);
	
 end
 endmodule
