class const7;
rand int a[];
int temp[$];
constraint s_a{a.size==51;}
constraint v_a{foreach(a[i])
		a[i] inside {[50:100]};
		}
constraint v1_a{foreach(a[i])
		a[i]%2==0;}

function void post_randomize();
	a.sort();
        temp=a.unique();
	$display("ARRAY VALUES : %0p",temp);
endfunction

endclass

module top;
const7 c_ex7;

initial begin 
c_ex7=new();
assert(c_ex7.randomize());
end

endmodule
