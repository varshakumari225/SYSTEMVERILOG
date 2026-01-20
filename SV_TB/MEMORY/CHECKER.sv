class check;
  virtual intf c_intf;
  transaction c_tx;
  int data[$];
  int temp;

  task run();
    $display("////////////// CHECKER /////////////");
 

    forever begin
	
      cfg::mon2che.get(c_tx);

      if(c_tx.wr_rd==1) begin
        data.push_back(c_tx.wr_data);
        $display("[%0t] [CHECKER] Pushed: %0d | Queue: %0p",$time, c_tx.wr_data, data);
      end
      else if(c_tx.wr_rd==0)begin
   
        if(data.size() > 0) begin
          temp = data.pop_back(); 
          //$display("[TEMP] : %0d",temp);
          if(temp == c_tx.rd_data) begin
            $display("[%0t] [MATCHED] Expected: %0d, Got: %0d",$time, temp, c_tx.rd_data);
          end
          else begin
            $display("[%0t] [MIS-MATCH] Expected: %0d, Got: %0d",$time, temp, c_tx.rd_data);
          end
        end
        else begin
         $display("[ERROR] Read attempted but Queue is empty!");
        end
      end
    end
  endtask
endclass
