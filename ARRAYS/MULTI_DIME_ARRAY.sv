//multi dimentional array
module multi;
//1kb with depth 64, each element of size 16 bits
bit [15:0]mem1[63:0];
bit [7:0][9:0]mem2[8][6:0];

initial begin
//randamizing the ele of mem2
foreach(mem2[i,j])begin
mem2[i][j]=$urandom;
end

$display("---------------------------");
$display("memory 2 elements  are %0p",mem2);
$display("------------------------------------------------");
$display("Printing the values of mem by using the for loop");
$display("------------------------------------------------");

foreach (mem2[i,j]) begin
    $display("mem2[%0d][%0d] =", i, j);
    for (int r = 0; r < 8; r++) begin
        $write("  Row %0d: ", r);
        for (int c = 9; c >= 0; c--) begin
            $write("%0b", mem2[i][j][r][c]);
        end
        $write("\n");
    end
    $display("");//next line
end

$display("------------------------------------------------");
$display("elements of mem2[6]: %0p",mem2[6]);
$display("------------------------------------------------");
$display("elements of mem2[6][2]: %0p",mem2[6][2]);
$display("------------------------------------------------");
$display("elements of mem2[6][2][1]: %0p",mem2[6][2][1]);
$display("------------------------------------------------");
$display("elements of mem2[6][2][1][4]: %0p",mem2[6][2][1][4]);

end
endmodule  
