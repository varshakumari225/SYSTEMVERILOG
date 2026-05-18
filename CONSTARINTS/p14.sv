// random cyclic behaviour without randc keyword
/*class w_randc;
  rand logic [1:0]arr[];
 
  constraint s_arr{arr.size()==4;}
  constraint v_arr{foreach(arr[i])
    arr[i]==i;
                  }

  function void post_randomize();
    arr.shuffle();
    $display("array values : %0p",arr);
  endfunction
  
endclass
*/

class randc_gen;
  rand reg [2:0]x;
  int que[$];
  
 constraint v_x{!(x inside {que});}
  
  function void post_randomize();
    que.push_front(x);
    if(que.size==2**$size(x))begin
      que={};
    end
    
    $display("x : %0d",x);
  endfunction
endclass      
    
module top;
  randc_gen c_rand;
  initial begin
    c_rand=new();
    repeat(10)
    assert(c_rand.randomize());
  end
endmodule
