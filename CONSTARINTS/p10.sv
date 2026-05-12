//Write a constraint for pcie to generate 10 packets 2 packets should be memory write and 2 packets are memory read remaining 6 packets can be any random packet? 

class pcie_c;
  rand bit wr_rd;
  rand int n_trans;
  constraint c_trans{n_trans==10;}
  
  function void post_randomize();
    $display("wr_rd : %0d | n_trans :%0p",wr_rd,n_trans);
  endfunction
endclass

module top;
  pcie_c pcie;
  initial begin
    pcie=new();
    pcie.randomize();
    for(int i=0;i<pcie.n_trans;i++)begin
      if(i<=1)
        pcie.randomize() with {wr_rd==1'b1;};
      else if(i>1 && i<=3)
        pcie.randomize() with {wr_rd==1'b0;};
      else
        pcie.randomize();
    end
      
    
  end
endmodule
             
