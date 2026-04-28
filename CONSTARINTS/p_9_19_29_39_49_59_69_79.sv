class c2;
	rand int a[];
	constraint s_a{a.size==8;}
	constraint v_a{foreach(a[i])
	           	a[i]==(i*10)+9;
			}

	function void post_randomize();
		$display("ARRAY VALUES : %0p",a);
	endfunction

endclass

module top;
c2 c2_ex;

initial begin
	c2_ex=new();
	assert(c2_ex.randomize());
end

endmodule
