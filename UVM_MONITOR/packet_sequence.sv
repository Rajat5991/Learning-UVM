`ifndef PKT_SEQ
`define PKT_SEQ

`include "packet.sv"

class packet_sequence extends uvm_sequence#(packet);
  `uvm_object_utils(packet_sequence)
  
  int num_pkt;
  
  function new(input string name = "packet_sequence");
    super.new(name);
  endfunction
  
  virtual task pre_start();
    `uvm_info("PKT_SEQ",$sformatf("WE ARE IN SEQ PRE START"),UVM_MEDIUM);
    if(!uvm_config_db #(int) :: get(null,"","num_pkt",num_pkt))
      `uvm_fatal("SEQ_ERROR","CANNOT GET THE NUM PKT");
  endtask
  
  virtual task body();
    repeat(num_pkt)
    `uvm_do(req);
  endtask
  
endclass

`endif
    
  
  
