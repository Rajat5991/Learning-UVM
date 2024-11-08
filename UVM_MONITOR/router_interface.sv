`ifndef INF
`define INF

interface router_interface(input bit clk);
  
  logic [47:0] src_addr;
  logic [31:0] src_data;
  logic [47:0] dst_addr;
  logic [31:0] dst_data;
 
  clocking cb @(posedge clk);
    default input #2 output #1;
    output src_addr, src_data;
    input dst_addr, dst_data;
  endclocking
  
  modport testcase_port(input clk, clocking cb);

endinterface
    
`endif

