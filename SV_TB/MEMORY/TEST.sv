program test();
env e;

initial begin
$display("");
$display("////////////Test////////////////");
$display("");
e=new();
e.run();

#10280;
$display("Simulationfinished at time %0t ",$time);

end

endprogram
