class c_gen;
  rand int a[];
  
  
  constraint s_a{a.size==10;}
  constraint v_a{foreach(a[i])
    //a[i]==2*(i+1);//even
                 a[i]==(2*i)+1;
                }
  function void post_randomize();
    $display("a : %0p",a);
  endfunction
  
endclass

module top;
  c_gen gen;
  initial begin
    gen=new();
    assert(gen.randomize());
  end
endmodule
  
