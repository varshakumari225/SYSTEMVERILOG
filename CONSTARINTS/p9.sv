class c4;
rand int a[];
int i;
constraint s_a{a.size==10;}
constraint v_a{foreach (a[i])
		//a[i]==(i+2)/2;
		a[i]==(i/2)+1;
		}
function void post_randomize();
	$display("ARRAY VALUES : %0p",a);
endfunction

endclass

module top;
c4 c4_ex;

initial begin
c4_ex=new();
assert(c4_ex.randomize());
end

endmodule
