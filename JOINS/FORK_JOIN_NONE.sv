//FORK JOIN_NONE

module fork_join_none;

task automatic display(int _time,string _name);
#(_time)$display("[%0t] %s",_time,_name);
endtask

initial begin
	display(1,"fork join_none start");
	fork 
		display(6,"thread 1");
		begin
			display(2,"thread 2");
			display(3,"thread 2a");
		end
		display(4,"thread 3");
	join_none
$display("[%0t] fork join_none finished",$time);
end
endmodule
