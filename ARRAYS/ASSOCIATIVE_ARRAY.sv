//ASSOCIATIVE ARRAY 

module associate_array;
string branch[string];
int marks[string];
initial begin
branch["alice"]="EEE";
branch["bob"]="ECE";
branch["charlies"]="MECH";
$display("name,branch",branch);
marks["alice"]=85;
marks["bob"]=70;
marks["charlies"]=90;
$display("name,marks:",marks);
$display("no.of students=%0d",branch.num());
begin
string f;
branch.first(f);
$display("first student=%0s s.no=%0d",f,branch.first(f));
end
begin
string g,h;
branch.last(g);
$display("Last student=%0s s.no=%0d",g,branch.last(g));
end
begin
string g;
branch.next(g);
$display(" student=%0s s.no=%0d",g,branch.next(g));
end 

if(branch.exists("bob"))
$display("exixts ");
else
$display("not exists");

end
endmodule
