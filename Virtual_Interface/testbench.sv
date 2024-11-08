// Code your testbench here
// or browse Examples
`ifndef TB
`define TB
 `include "testcase.sv"
 `include "interface.sv"
//`include "design.sv"
module switch_tb();
  
  import uvm_pkg::*;
 
  
  bit clk;
  
  always
     begin
        #5 clk = ~clk;
     end
  
  switch_interface inf(clk);
  
  initial 
     begin
       run_test("test_base");
      
     end
    
    switch switch_dut(.clk(inf.clk),
                      .src_addr(inf.src_addr),
                      .src_data(inf.src_data),
                      .dst_addr(inf.dst_addr),
                      .dst_data(inf.dst_data));
    
  
endmodule
`endif
  
