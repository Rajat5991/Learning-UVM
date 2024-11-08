`ifndef PKT
`define PKT

class packet extends uvm_sequence_item;
  
  rand bit [47:0] src_addr;
  rand bit [31:0] src_data;
  bit [47:0] dst_addr;
  bit [31:0] dst_data;
  
  `uvm_object_utils_begin(packet)
    `uvm_field_int(src_addr,UVM_ALL_ON)
    `uvm_field_int(src_data,UVM_ALL_ON)
    `uvm_field_int(dst_addr,UVM_ALL_ON)
    `uvm_field_int(dst_data,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(input string name = "packet");
    super.new(name);
  endfunction
  
endclass

`endif
  
  
     
