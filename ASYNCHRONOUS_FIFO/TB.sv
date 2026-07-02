module asyn_fifo_tb;
    localparam DATA_WIDTH = 8;
    localparam DEPTH = 8;

    reg wr_clk, rd_clk, rst;
    reg [DATA_WIDTH - 1:0] data_i;
    reg wr_valid, rd_valid;
    wire [DATA_WIDTH - 1:0] data_o;
    wire fifo_full, fifo_empty, error;

    asyn_fifo #(DATA_WIDTH, DEPTH) dut (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rst(rst),
        .data_i(data_i),
        .wr_valid(wr_valid),
        .rd_valid(rd_valid),
        .data_o(data_o),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty),
        .error(error)
    );

    initial wr_clk = 0;
    always #5 wr_clk = ~wr_clk;
    initial rd_clk = 0;
    always #10 rd_clk = ~rd_clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        rst = 1; wr_valid = 0; rd_valid = 0; data_i = 0;
        #20 rst = 0;

        // Write 10 values to FIFO
        repeat(10) begin
            @(posedge wr_clk);
            if (!fifo_full) begin
                wr_valid = 1;
                data_i = $random;
            end else begin
                wr_valid = 0;
            end
        end
        wr_valid = 0;
        #10;

        // Read 10 values from FIFO
        repeat(10) begin
            @(posedge rd_clk);
            if (!fifo_empty) rd_valid = 1;
            else rd_valid = 0;
        end
        rd_valid = 0;

        // Alternate write and read for demonstration
        write_data(8'hA5);
        read_data;
        write_data(8'h5A);
        read_data;

        #20; $finish;
    end

    task write_data(input [DATA_WIDTH-1:0] value);
        begin
            @(posedge wr_clk);
            while (fifo_full) @(posedge wr_clk);
            wr_valid = 1; data_i = value;
            @(posedge wr_clk);
            wr_valid = 0;
        end
    endtask

    task read_data;
        begin
            @(posedge rd_clk);
            while (fifo_empty) @(posedge rd_clk);
            rd_valid = 1;
            @(posedge rd_clk);
            rd_valid = 0;
        end
    endtask
endmodule

