`ifndef PKT_SEQ_SV
`define PKT_SEQ_SV

`include "packet.sv"


class packet_sequence extends uvm_sequence#(packet);
  `uvm_object_utils(packet_sequence)
  
  function new(input string name = "packet_sequence");
    super.new(name);
  endfunction
  
  virtual task pre_start();
    uvm_phase starting_phase = get_starting_phase(); // required for uvm 1.2
    `uvm_info("PACKET_SEQ","PRE START PKT SEQUENCE", UVM_LOW);
    starting_phase.raise_objection(this, get_type_name()); // raise an objection
  endtask: pre_start
  
  virtual task body();
    repeat(2)
      `uvm_do(req);
  endtask
  
  virtual task post_start();
    uvm_phase starting_phase = get_starting_phase(); // required for uvm 1.2
    starting_phase.drop_objection(this, get_type_name()); // drop an objection
  endtask: post_start
  
endclass

`endif
  
    
