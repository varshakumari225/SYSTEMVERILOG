class transaction;
randc bit [7:0]addr;
rand bit [7:0]wr_data;
rand bit wr_rd;
     bit[7:0]rd_data;
constraint c_wr_data{wr_data inside{[0:255]};}
constraint c_rd_data{rd_data inside{[0:255]};}

constraint c_wr_rd{wr_rd inside {0,1};}
endclass

