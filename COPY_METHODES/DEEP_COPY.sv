class my_pkt;
int m_count;
endclass

class eth_pkt;

my_pkt m_pkt;

rand bit [32:0]DA=10;//destination address
rand bit [15:0] len;
rand byte payload[];

constraint payload_c {payload.size()>10;
	payload.size()<20;}

function new();
m_pkt=new();
endfunction

function copy(output eth_pkt pkt);
pkt=new this;
pkt.m_pkt=new this.m_pkt;
endfunction

task print();
$display("");
$display("my count : %0d ",m_pkt.m_count);
$display("Destination address of the eth_pkt : 0x%0d",DA);
$display("lenth of the eth_pkt               : %0d",len);
$display("payload                            : [%0p]",payload);
$display("");
endtask

endclass : eth_pkt

module top;
eth_pkt pkt1,pkt2;

initial begin
pkt1=new();
assert(pkt1.randomize());
pkt1.m_pkt.m_count='h5;
$display("");
$display("-------------------------------------------");
$display("PKT1");
$display("-------------------------------------------");
pkt1.print();

pkt2=new();
$display("-------------------------------------------");
$display("PKT2");
$display("-------------------------------------------");
pkt2.print();
pkt1.copy(pkt2);
$display("-------------------------------------------");
$display("PKT2 AFTER COPY");
$display("-------------------------------------------");
pkt2.print();

pkt1.m_pkt.m_count='h4;
pkt1.DA='h1;
pkt1.len='h5;
$display("-------------------------------------------");
$display("PKT1");
$display("-------------------------------------------");
pkt1.print();
$display("-------------------------------------------");
$display("PKT2");
$display("-------------------------------------------");
pkt2.print();

end
endmodule
