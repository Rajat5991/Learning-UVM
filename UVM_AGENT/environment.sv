`ifndef ENV_SV
`define ENV_SV

`include "agent.sv"
`include "packet_sequence.sv"

class test_environment extends uvm_env;
  `uvm_component_utils(test_environment)
  
  agent_input agnt;
  packet_sequence seq;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    agnt = agent_input :: type_id::create("agnt",this);
    
    uvm_config_db #(uvm_object_wrapper)::set(this,"agnt.pkt_seqr","default_sequence",packet_sequence::get_type());
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    seq = packet_sequence :: type_id :: create("seq");
   // phase.raise_objection(this);
   // seq.start(agnt.pkt_seqr);
    //phase.drop_objection(this);
  endtask
  
endclass

`endif

