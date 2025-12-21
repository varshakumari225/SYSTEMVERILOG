module diff_pack_unpack_array;
int a[4:0];//4,3,2,1,0
int b[4:0];
int c[4:0];
int d[1:0];
int e[1:5];//1,2,3,4,5
initial begin
$display("---------------------------------------------");
$display("          ASSIGN VALUE TO ARRAY A           ");
$display("---------------------------------------------");


	a[0]=10;
	a[1]=11;
	a[2]=77;
	a[3]=98;
	a[4]=89;
$display("array values %p",a[4:0]);
/*	a[3:1]={50,60,80};	
$display("array values %p",a[4:0]);*/
$display("---------------------------------------------");
$display("          ASSIGN VALUE TO ARRAY B           ");
$display("---------------------------------------------");


b[4:0]='{20,30,40,50,60};
$display("array values %p",b);
$display("---------------------------------------------");
$display("               AND operation                 ");
$display("---------------------------------------------");
foreach(a[i])begin
c[i]=a[i]&b[i];
end
$display("c=%0p",c);
$display("---------------------------------------------");
$display("                OR operation                 ");
$display("---------------------------------------------");
foreach(a[i])begin
c[i]=a[i]|b[i];
end
$display("c=%0p",c);
$display("---------------------------------------------");
$display("              EXOR operation                 ");
$display("---------------------------------------------");
foreach(a[i])begin
c[i]=a[i]^b[i];
end
$display("c=%0p",c);
$display("---------------------------------------------");
$display("      assigning value to another array       ");
$display("---------------------------------------------");

foreach(a[i])begin
e[i]=a[i];
end
$display("e=%0p",e);
$display("---------------------------------------------");
$display("                  Bit slice                  ");
$display("---------------------------------------------");
foreach(b[i])begin
d[i]=b[i];
end
$display("d=%0p",d);
$display("---------------------------------------------");
$display("       Array randamisastion with range       ");
$display("---------------------------------------------");
foreach(e[i])begin
e[i]=$urandom_range(0,100);
end
$display("e=%0p",e);
$display("---------------------------------------------");
end
endmodule
