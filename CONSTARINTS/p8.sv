class ex5;
rand real a;

constraint s_a{a inside{[1.35:2.57]};}


function void post_randomize();
	$display("VALUES OF A : %.2f",a);
endfunction

endclass

module top;
ex5 c5_ex;

initial begin
c5_ex=new();
repeat(10)
assert(c5_ex.randomize());
end

endmodule
