`ifndef INF
`define INF

interface router_inf(input bit clk);
  
  logic [7:0] src_addr;
  logic reset;
  logic valid_data;
  logic [7:0] src_data;
  logic [7:0] dst_addr;
  logic [7:0] dst_data;
  
  clocking master_drv_cb@(negedge clk);
    default output #1;
    
    output src_addr;
    output src_data;
    output valid_data;
    output reset;
    
  endclocking
  
  clocking master_mon_cb@(negedge clk);
    
    default input #1;
    
    input src_addr;
    input src_data;
    input valid_data;
    
  endclocking
  
  clocking slave_mon_cb@(negedge clk);
    default input #1;
    
    input src_addr;
    input src_data;
    input dst_addr;
    input dst_data;
    input valid_data;
    
  endclocking
  
  
  modport master_drv(input clk, clocking master_drv_cb);
  modport master_mon(input clk, clocking master_mon_cb);
  modport slave_mon(input clk, clocking slave_mon_cb);
      
 endinterface
  
 `endif
