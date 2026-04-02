
// we cannot assign child class to the parent class. we use $cast to do that.

class parent;
bit [7:0] addr;
function void display();
$display("addr : 0x%0h",addr);
endfunction
endclass

class child extends parent;
bit [7:0] data;
function void display();
super.display();
$display("data : 0x%0h",data);
endfunction
endclass

module top;
parent p;
child c,c1;
initial begin
p=new();
c=new();
c1=new();
c.addr=8'haa;
c.data=8'hbb;
p=c;
$display("");
p.display();
$display("-----------------");
$cast(c1,p);
c1.display();
end
endmodule
