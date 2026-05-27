// Constraint to generate 0, 1, x and z randomly.

class cons;
  rand bit [1:0]sel;
  logic a;
  
  function void post_randomize();
    
    case(sel)
      0:a=0;
      1:a=1;
      2:a='bx;
      3:a='bz;
    endcase
    
    $display("a : %0b",a);
  endfunction
endclass

module top;
  cons c;
  initial begin
    c=new();
    repeat(5)
      assert(c.randomize());//for 4state variables randomization act as a 2state randomization
    
  end
endmodule
  
