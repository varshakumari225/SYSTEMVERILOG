module fork_join;
initial begin
	#1 $display($time,"fork join start");
	fork 
		#6 $display($time,"thread 1: Nice to meet u");
		begin
			#2 $display($time,"thread 2: Hi ");
			//#3 $display($time,"thread 2:how is ur day?");
		end
		#4 $display($time,"thread 3:how are you");
	join
$display($time,"fork join finished");
end
endmodule
