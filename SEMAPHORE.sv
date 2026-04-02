
// semaphore is a key based access.in the below code there are two processes start parellely.and only one key i am giving.the next processes will not start until the key is get back.


module semaphore_ex;
semaphore semap;
initial begin
  semap=new(1);//creating memory for semaphore with token 1
$display("------------------------------------------");
//Start two parallel processes that need access to theshare resources
fork

process_a();
process_b();

join
$display("------------------------------------------");
end

task process_a();

$display("[%0t] process a : waiting for semaphore",$time);
semap.get(1);
$display("[%0t] process a : Got the semaphore",$time);
#5;
$display("[%0t] process a : release the semaphore",$time);
semap.put(1);

endtask

task process_b();
#1;
$display("[%0t] process b : waiting for semaphore",$time);
semap.get(1);
$display("[%0t] process b : Got the semaphore",$time);
#5;
$display("[%0t] process b : release the semaphore",$time);
semap.put(1);

endtask 
endmodule
