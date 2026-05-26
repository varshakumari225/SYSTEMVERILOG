// Write a constraint for two random variables such that one variable should not match with the other & the total number of bits toggled in one variable should be 5 w.r.t the other.

class cons;
  rand bit [7:0]a;
  rand bit [7:0]b;
  
  constraint v_a{a != b;}
  constraint v_b{$countones(a)==5;}
  
  function void post_randomize();
    $display("\t\t a : %0b | b : %0b",a,b);
  endfunction
  
endclass

module top;
  cons c;
  initial begin
    c=new();
    repeat(10)
    assert(c.randomize());
  end
  
endmodule
