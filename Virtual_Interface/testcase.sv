`ifndef TEST
`define TEST
`include "environment.sv"
`include "packet_sequence.sv"
class test_base extends uvm_test;
  `uvm_component_utils(test_base)
  
  test_environment env;
  packet_sequence seq;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    env = test_environment::type_id::create("env",this);
    uvm_config_db #(virtual switch_interface.testcase_port)::set(null,"*","vif",switch_tb.inf.testcase_port);
  endfunction
  
  virtual function void end_of_elaboration_phase(input uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
    
  
  virtual task run_phase(input uvm_phase phase);
    seq = packet_sequence :: type_id :: create("seq");
    phase.raise_objection(this);
    seq.start(env.pkt_seqr);
    phase.drop_objection(this);
  endtask
  
endclass  
`endif
   
  
