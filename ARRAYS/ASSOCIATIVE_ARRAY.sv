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

//ANOTHER WAY OF ASSOSIACTE ARRAY

module associate_array;
int asa[int];
int a,b,key,h;
int q[$:9];
initial begin

for(int i=0;i<=9;i++)begin
 a=$urandom_range(0,80);
 b=$urandom_range(0,80);
asa[a]=b;
$display("ass[%0d]=%0d",a,b);
end

/*
$display("The number of entries in associate array is : %0d",asa.num());

asa.last(key);
for(int i=1;i<=asa.num;i++)begin
$display("asa[%0d]=%0d",key,asa[key]);
asa.prev(key);
end

$display("%0d",asa);
asa.delete(50);
$display("%0d",asa);
*/


foreach(asa[p])begin
q.push_back(asa[p]);
end
$display("%0p",q);

q.rsort();//descending order
$display("%0p",q);

q.sort();//ascending order
$display("%0p",q);
end
endmodule
