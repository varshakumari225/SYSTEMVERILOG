// Prime number generation
class prime_c;

  rand int num;
  // Function: prime check with early exit
  function bit is_prime(int n);
    int i;
    if (n <= 1)
      return 0;
    for (i = 2; i < n; i++) begin
      if (n % i == 0)
        return 0; // stop immediately if divisor found
    end
    return 1;
  endfunction
  
  constraint c_range {
    num inside {[2:100]};
  }
  function void post_randomize();
    if (is_prime(num))
      $display("Prime number: %0d", num);
  endfunction

endclass
module top;
  prime_c prime;

  initial begin
    prime = new();

    repeat (100) begin
      assert(prime.randomize());
    end
  end

endmodule
