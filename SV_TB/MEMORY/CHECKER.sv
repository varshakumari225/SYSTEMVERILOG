class check;
  transaction tx;
 virtual intf c_intf;
  bit [7:0] data[$];
  bit [7:0]temp;
 
task run();
    $display("////////////// CHECKER /////////////");
forever begin
cfg::mon2che.get(tx);
if(tx.wr_rd) begin
	data.push_front(tx.wr_data);
	$display("[%0t][CHECKER] Pushed: %0d",$time,tx.wr_data);
end
else if (!tx.wr_rd)begin
   
        if(data.size()>0) begin
        temp=data.pop_front();
       //$display("temp=%0d rd_data=%0d",temp,c_tx.rd_data);

        	if(tx.rd_data==temp)
            	$display("[%0t] address : %0d [MATCHED] expected : %0d | got : %0d",$time,tx.addr,temp,tx.rd_data);
        	
        	else 
            	$display("[%0t] address :%0d [MIS-MATCH] expected : %0d | got : %0d",$time,tx.addr,temp,tx.rd_data);
      
        end

	else 
	$display("              QUEUE IS EMPTY            ");

end

end
endtask
endclass
