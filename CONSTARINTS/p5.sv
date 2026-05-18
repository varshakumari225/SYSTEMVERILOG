//Write a for a 32 bit rand variable such that it should have 12 number of 1's non consecutively.


class const_gen;
rand bit [31:0]a;
constraint no_of_1{$countones(a)==12;}
constraint v_a{foreach (a[i])
			if(i>0)
		//Removing i > 0 causes an out-of-bound access (a[-1]) when i = 0, leading to constraint failure.
				sa[i]!=a[i-1];
				//a[i]+a[i-1]<=1;
		}

function void post_randomize();
	$display("VALUES OF A :%0b",a);
endfunction

endclass

module top;

const_gen gen;

initial begin
gen=new();
assert(gen.randomize());
end

endmodule
