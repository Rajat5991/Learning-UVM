`ifndef PKT_SV
`define PKT_SV
class packet extends uvm_sequence_item;
  //`uvm_object_utils(packet)
  
  function new(input string name = "packet");
    super.new(name);
  endfunction
  
  `uvm_object_utils_begin(packet)
   `uvm_field_int(data_load,UVM_ALL_ON)
   `uvm_field_array_int(pay_load,UVM_ALL_ON)
  `uvm_object_utils_end
  
  rand bit [7:0] data_load;
  rand bit [7:0] pay_load[];
  
  constraint size_payload{ pay_load.size inside {[1:256]}; }
  
endclass

`endif
