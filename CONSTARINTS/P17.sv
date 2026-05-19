// write a constraint for rand int array[100] to generate 1 to 50 values, with 10 & 20 values should be manadatory by using post_randomization?
class cons;
  rand int array[100];
  constraint v_a{foreach (array[i])
    array[i] inside {[1:50]};}
  
  function void post_randomize();
    array[0]=10;
    array[1]=20;
    $display("ARRAY VALUES : %0p",array);
  endfunction
endclass

module top;
  cons c;
  initial begin
    c=new();
    assert(c.randomize());
  end
endmodule
