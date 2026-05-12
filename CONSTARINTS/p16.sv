//lower triangular matrix
class c_gen;
  rand byte unsigned a[4][4];
  
  constraint v_a{foreach(a[i,j])
    				if(i<j)
      					a[i][j]==0;
             	}
  constraint s_a{}
  
  function void post_randomize();
    $display("a : %0p",a);
    //$display(" %0d ",a[i,j]);
  endfunction
  
endclass

module top;
  c_gen gen;
  initial begin
    gen=new();
    assert(gen.randomize());
  end
endmodule
