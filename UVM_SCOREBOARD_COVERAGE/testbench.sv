// Code your testbench here
// or browse Examples
`ifndef TB_TOP
`define TB_TOP

`include "router_common.sv"
`include "router_test.sv"
`include "router_interface.sv"

module tb_top();
  
  import uvm_pkg::*;
  
  bit clk,reset;
  
  initial
    begin
      forever
      #5 clk = ~clk;
    end
  
  initial
    begin
      @(posedge clk)
       reset = 1;
      reset_design_inputs();
     repeat(2)
      @(posedge clk)
      reset = 0;
    end
  
  task reset_design_inputs();
    rinf.valid_data = 0;
  endtask
      
  
  router_inf rinf(clk);
  
  router router_DUT(.clk(clk),
                    .reset(reset),
                    .valid_data(rinf.valid_data),
                    .src_addr(rinf.src_addr),
                    .src_data(rinf.src_data),
                    .dst_addr(rinf.dst_addr),
                    .dst_data(rinf.dst_data));
  
  initial
    begin
      uvm_config_db #(virtual router_inf.master_drv) :: set(null,"*","r_drv_mif",rinf.master_drv);
      uvm_config_db #(virtual router_inf.master_mon) :: set(null,"*","r_mon_mif",rinf.master_mon);
      uvm_config_db #(virtual router_inf.slave_mon) :: set(null,"*","r_slv_sif",rinf.slave_mon);
    end
  
  initial
    begin
      run_test("router_test");
    end
  
  initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #1000;
      $finish;
     end 
  
endmodule

`endif
  
