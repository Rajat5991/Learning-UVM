// Code your testbench here
// or browse Examples
module TB();
  
  import uvm_pkg::*;
  `include "testclass.sv"
  
  initial
    begin
      run_test("packet_test");
    end
  
endmodule