class transaction;
rand bit [7:0]addr;
rand bit [7:0]wr_data;
rand bit wr_rd;
     bit [7:0]rd_data;
constraint c_addr{unique {addr};}
endclass
