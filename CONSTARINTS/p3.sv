// write a constraint to generate below pattern 5 -10 15 -20 25 -30

class c3;
rand int a[];
constraint s_a{a.size==10;}
constraint v_a{foreach(a[i])
 		if(i%2==0)
			a[i]==(5*i)+5;
		else
			a[i]==-5*(i+1);
		}
function void post_randomize();
	$display("ARRAY VALUES : %0p",a);
endfunction

endclass

module top;
c3 c3_ex;
initial begin 
c3_ex=new();
assert(c3_ex.randomize());
end

endmodule
