class env;

gen g;
driver bfm;
monitor mon;
coverage cov;
check c;

function new();
g=new();
bfm=new();
mon=new();
cov=new();
c=new();
endfunction

task run();
$display("");
$display("///////////ENVIRONMENT////////////////");
$display("");

fork
g.run();
bfm.run();
mon.run();
cov.run();
c.run();
join



endtask

endclass
