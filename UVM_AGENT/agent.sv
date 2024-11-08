`ifndef AGENT_SV
`define AGENT_SV


`include "driver.sv"
`include "packet.sv"
typedef uvm_sequencer#(packet) packet_sequencer;

class agent_input extends uvm_agent;
  `uvm_component_utils(agent_input)
  
  packet_sequencer pkt_seqr;
  driver drv;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    pkt_seqr = packet_sequencer :: type_id :: create("pkt_seqr",this);
    drv = driver :: type_id :: create("drv",this);
  endfunction
  
  virtual function void connect_phase(input uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(pkt_seqr.seq_item_export);
  endfunction
  
endclass

`endif
  
  
  
  
  
  
