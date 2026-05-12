//constraint code specifically for burst transfers in AXI memory size 5
class AXI_C;
  
  rand bit [31:0]awaddr;
  rand bit [2:0]awsize;
  rand bit [3:0]awlen;
  rand bit [1:0]awburst;
  rand bit [31:0]wdata[];
  //memory size 5
  constraint s_awsize{awsize==5;}//2^5 is 32bytes each beat 
  
  constraint s_awlen{awlen inside {[0:15]};}
  
  constraint t_burst{awburst inside{00,01,10};}
  
  constraint a_addr{awaddr%32==0;awaddr inside {[0:1000]};}

  constraint s_wdata{wdata.size()==awlen+1;}
  
  function void post_randomize();
    $display("awaddr : 0X%0h | awsize : 0X%0h | awlen : %0d | awburst : %0b | wdata :%0p",awaddr,awsize,awlen,awburst,wdata);
  endfunction
  
endclass

module top;
  AXI_C axi;
/*  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end*/
  initial begin 
    axi=new();
    repeat(10)
    assert(axi.randomize());
  end
endmodule
  
  
  
  
