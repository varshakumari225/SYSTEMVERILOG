class c1;
	rand int a[];
	constraint s_a{a.size==10;}
	constraint v_a{foreach(a[i])
			if(i<5)
				a[i]==i+1;
			else
				a[i]==10-i;
		}

	function void post_randomize();

		$display("ARRAY VALUES : %0p ",a);
	endfunction

endclass


module top;
c1 c1_ex;

initial begin
	c1_ex=new();
	assert(c1_ex.randomize());
end

endmodule
