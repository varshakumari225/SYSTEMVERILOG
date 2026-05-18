// Write a constraint to generate the pattern 0102030405.
class const5;
rand int a[];

constraint s_a{a.size==10;}
constraint v_a{foreach(a[i])
		if(i%2==0)
			a[i]==0;
		else
			a[i]==(i/2)+1;
		}

function void post_randomize();
	$display("ARRAY VALUES : %0p",a);
endfunction

endclass

module top;
const5 c_ex5;

initial begin
c_ex5=new();
assert(c_ex5.randomize());
end

endmodule
