class eth_pkt;
rand bit [32:0]DA=10;//destination address
rand bit [15:0] len;
rand byte payload[];

constraint payload_c {payload.size()>10;
	payload.size()<20;}

task print();
$display("");
$display("Destination address of the eth_pkt : 0x%0d",DA);
$display("lenth of the eth_pkt               : %0d",len);
$display("payload                            : [%0p]",payload);
$display("");
endtask

endclass : eth_pkt

module top;

eth_pkt pkt1;
eth_pkt pkt2;
initial begin
pkt1=new();
assert(pkt1.randomize());
$display("======== 1ST PRINT ========");
pkt1.print();

$display("======== 2ND PRINT ========");

pkt2=pkt1;
pkt1.print();
pkt2.print();

$display("======== 3RD PRINT ========");

pkt1.len=5;
pkt1.print();
pkt2.print();

end
endmodule
