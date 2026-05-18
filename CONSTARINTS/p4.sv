// Write a constraint to genarate FACTORIAL of first 5 even numbers and odd numbers .
class const_gen;
randc int fact[5];
int even[5];

//constraint v_num{num inside{2,4,6,8,10};}

function int factorial(int n);
int fac=1;
int i;
for(i=1;i<=n;i++)begin
fac*=i;
end
return fac;
endfunction

constraint even_n{foreach(even[i])
			even[i]==2*(i+1);
		}
function void post_randomize();
foreach(even[i])
	fact[i]=factorial(even[i]);
	$display("even numbers : %0p | factorial : %0p",even,fact);
endfunction

endclass

module top;
const_gen gen;

initial begin
gen=new();
repeat(5)
assert(gen.randomize());
end

endmodule

