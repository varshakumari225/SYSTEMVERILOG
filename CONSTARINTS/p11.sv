//constraint 25 axi wr and 25 axi rd, in that 10 aw length more than 8. for other it can be random

class axi_c;
  rand bit wr_rd;
  rand bit [3:0]awlen;
  rand bit [3:0]arlen;
  int count=0;
  //constraint c_awlen{awlen>=8;}
 
  
 /* function void post_randomize();
    $display("wr_rd : %0d | awlen : %0d | arlen : %0d ",wr_rd,awlen,arlen);
  endfunction*/
  
endclass

module top;
  axi_c axi;
  int i,j;
  initial begin
    axi=new();
    
    
    repeat(25)begin
     
      i=i+1;
      axi.randomize()with{wr_rd==1'b1;
                          if(i<=10)
                         		awlen>=8;
                         /*else
                            awlen<=8;*/
                         };
      $display("[%0d] awlen : %0d | wr_rd :%0d",i,axi.awlen,axi.wr_rd);
    end
    repeat(25)begin
     j=j+1;
      axi.randomize()with{wr_rd==1'b0;if(j<=10)
        								arlen>=8;
                         };
      $display("[%0d] arlen : %0d | wr_rd : %0d",j,axi.arlen,axi.wr_rd);
    end
    
  end
endmodule
      
