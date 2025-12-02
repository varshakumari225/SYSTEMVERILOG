//FORK JOIN_ANY

module fork_join_any;
initial begin
	#1 $display("[%0t] fork join_any start",$time);
	fork 
		#6 $display("[%0t] thread 1",$time);
		begin
			#2 $display("[%0t] thread 2",$time);
			#3 $display("[%0t] thread 2a",$time);
		end
		#4 $display("[%0t] thread 3",$time);
	join_any
$display("[%0t] fork join_any finished",$time);
end
endmodule
