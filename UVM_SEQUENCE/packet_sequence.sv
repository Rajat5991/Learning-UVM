`include "packet.sv"

class packet_sequence extends uvm_sequence #(packet);
  `uvm_object_utils(packet_sequence)
  
  function new(input string name = "packet_sequence");
    super.new(name);
  endfunction
  
endclass
