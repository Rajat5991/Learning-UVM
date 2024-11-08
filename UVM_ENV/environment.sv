`ifndef ENV_SV
`define ENV_SV

//typedef uvm_sequencer#(packet) packet_sequencer;

class test_environment extends uvm_env;
  `uvm_component_utils(test_environment)
  
  //packet_sequencer pkt_seqr;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
  //  pkt_seqr = packet_squencer::type_id::create("pkt_seqr",this);
  endfunction
 
  
endclass

`endif

  
  
