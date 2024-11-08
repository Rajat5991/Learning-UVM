`ifndef PKT
`define PKT

class router_pkt extends uvm_sequence_item;
  
  rand bit [7:0] src_addr;
  rand bit [7:0] src_data;
  bit [7:0] dst_addr;
  bit [7:0] dst_data;
  rand bit reset;
  
  `uvm_object_utils_begin(router_pkt)
     `uvm_field_int(src_addr,UVM_ALL_ON)
     `uvm_field_int(src_data,UVM_ALL_ON)
     `uvm_field_int(dst_addr,UVM_ALL_ON)
     `uvm_field_int(dst_data,UVM_ALL_ON)
     `uvm_field_int(reset,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(input string name = "router_pkt");
    super.new(name);
  endfunction
  
endclass

`endif

  
