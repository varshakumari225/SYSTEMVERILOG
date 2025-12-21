
//real data type

module real_sr_dt;
real a;
shortreal b;
initial begin
 a=3.141592653589793;
 b=3.141592653589793;
$display("[%0t] real=%f shortreal=%1.10f",$time,a,b);
end
endmodule

//difference between int and integer 

module diff_int_integer;
int a;//2 state data type
integer b;//4 state data type
initial begin
	$monitor("[%0t] a=%0d b=%0d",$time,a,b);
a=32'h12385979;#5;
a=-10;#5;
a='bz;#5;
b=64'h12385979;//truncated to 32bit
#5;
b=-10;#5;
b='bz;
end
endmodule

// string data type

module s_operators;
string a;
string temp;
initial begin
	a="vlsi";
	$display("lenth of the string=%0d",a.len());
	temp=a;
	temp.putc(0,"u");
	$display("a=%0s temp=%0s",a,temp);
	temp=temp.toupper();
	$display("temp=%0s",temp);
	$display("comparing %0s with %0s %0d ",temp,a,temp.compare(a));

end
endmodule
