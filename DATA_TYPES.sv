//4 state data types
//For Logic data type we can assign value throungh procedural block or by using assign statement
/*module logic_data_type;
logic [3:0]data;
logic my_data;
initial begin
	$display("data=%b my_data=%b",data,my_data);//The default value of logic data type is "x"
	#1;
	data=4'b1010;
	$display("data=%b my_data=%b",data,my_data);
	#5;
	$display("data=%b my_data=%b",data,my_data);
	#5;
end
assign my_data=1'b1;
endmodule*/
//2 State data types it can only store 0 or 1;
/*module two_state;
bit a;//1 
byte b;//8bits
shortint si;//16bit
int i;//32 bit
longint li;//64bit
initial begin
$display($time,"bit=%0b ",a);//0
a=1'b1;
#1;   
$display($time,"bit=%0b ",a);//1
a=1'bx;
#1;            
$display($time,"bit=%0b ",a);//0
a=1'bz;
#1;
$display($time,"bit=%0b ",a);//0
//assigning value to the byte data type
$display($time," byte=%0d ",b);//0  
#1;
$display($time," byte=%0d ",b);//127
b=2**8;
#1;
$display($time," byte=%0d ",b);//256
b=(2**8)-1;
#1;
$display($time," byte=%0d ",b);//255 the signed value is 255-256=-1
b=8'haa;
#1;
$display($time," byte=%0d ",b);//170-256=-86
b=8'bxz;
#1;
$display($time," byte=%0d ",b);//0
//Assigning value to the shortint data type
$display($time," short int=%0d",si);
si=16'b11xz;
#1;
$display($time," short int=%0d",si);//last two bits 00 means 12(1100)
si=-5;
#1;
$display($time," short int=%0d",si);//-5
si=(2**15)-1;
#1;
$display($time," short int=%0d",si);//32767
si=(2**16)l;
#1;
$display($time," short int=%0d",si);//0
si=(2**16)-1;#1;
$display($time," short int=%0d",si);//-1
//Assigning values to the int data type
$display($time,"int=%0d ",i);
i=32'b11xz;
#1;
$display($time,"int=%0d ",i);// last two bit 00
i=(2**31)-1;
#1;
$display($time,"int=%0d ",i);//2147483647
i=2**32;
#1;
$display($time,"int=%0d ",i);//0
i=(2**32)-1;#1;
$display($time,"int=%0d ",i);//-1
//Assigning values to the long int data type
li=64'b11xz;
#1;
$display($time,"long int=%0d",li);//last two bits 00
li=-(2**61)-1;
#1;
$display($time,"long int=%0d",li);//-2.3058E18
li=2**62;
#1;
$display($time,"long int=%0d",li);//4.6116E18
li=(2**62)-1;
$display($time,"long int=%0d",li);//4.611686E18
end
/*initial begin
$monitor("[%0t] bit=%b byte=%d short int=%d int=%d long int=%d",$time,a,b,si,i,li);
end
endmodule*/

//struct data type
/*
module strct_dt;
struct{
string name;
int age;
}std_details,std_details1;
initial begin
$monitor("name=%s age=%0d name=%s age=%0d",std_details.name,std_details.age,std_details1.name,std_details1.age);
std_details.name="varsha";
std_details.age=21;
std_details1.name="varshi";
std_details1.age=22;
end
endmodule

//typedef datatype

module typedef_dt;
typedef struct{
string name;
int age;
}std_detail;
std_detail std1;
std_detail std2;
initial begin
$monitor("name=%s age=%0d name=%s age=%0d",std1.name,std1.age,std2.name,std2.age); 
std1.name="vennu";
std1.age=8;
std2.name="venuhya";
std2.age=10;
end
endmodule
*/
//enumeratorated data type

module enum_dt;
enum{idle=3,run,stop} state;
initial begin
state=idle;#5;
$display("state name=%d ",state);
state=run;#5;
$display("state name=%d ",state);
state=stop;#5;
$display("state name=%d ",state);
state=state.first;
$display("state name=%d ",state);
end
endmodule
