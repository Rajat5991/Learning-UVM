`ifndef PKT_SEQ
`define PKT_SEQ

`include "packet.sv"

class packet_sequence extends uvm_sequence#(packet);
  `uvm_object_utils(packet_sequence)
  
  int num_packets;
  
  function new(input string name = "packet_sequence");
    super.new(name);
  endfunction
  
  task pre_start();
    if(!uvm_config_db #(int)::get(null,"get_full_name()","num_pkts",num_packets))
       `uvm_fatal("PKT_SEQ","Failed to get the num_packets");
  endtask

  
  task body();
    repeat(num_packets)
      `uvm_do(req);
  endtask
  
endclass
`endif
    
  
  
