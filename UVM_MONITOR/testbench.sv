// Code your testbench here
// or browse Examples
`ifndef TB_TOP
`define TB_TOP

`include "testcase.sv"
`include "router_interface.sv"

module tb_top();
  
  import uvm_pkg::*;
 
  
  bit clk;
  
  always
    begin
      #5 clk = ~clk;
    end
  
  
  router_interface riff(clk);
  
  router router_dut(.clk(riff.clk),
                    .src_addr(riff.src_addr),
                    .src_data(riff.src_data),
                    .dst_addr(riff.dst_addr),
                    .dst_data(riff.dst_data));
  
  initial 
     begin
       run_test("test_base");
     end
 
endmodule

`endif

  
  
