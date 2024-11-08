`ifndef TEST
`define TEST
`include "router_environment.sv"
`include "packet_sequence.sv"

class test_base extends uvm_test;
  `uvm_component_utils(test_base)
  
  packet_sequence pkt_seq;
  router_environment rtr_env;
  int num_pkt = 2;
  uvm_active_passive_enum is_active = UVM_ACTIVE;
 
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    rtr_env = router_environment :: type_id :: create("rtr_env", this);
    uvm_config_db #(virtual router_interface.testcase_port)::set(this,"rtr_env.agnt_in.drv","vif",tb_top.riff.testcase_port);
    uvm_config_db #(virtual router_interface.testcase_port)::set(this,"rtr_env.agnt_out.mon","vif",tb_top.riff.testcase_port);
    uvm_config_db #(int) :: set(null,"*","num_pkt",num_pkt);
    uvm_config_db #(uvm_active_passive_enum) :: set(this,"rtr_env.agnt_in","is_active",is_active);
    
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    pkt_seq = packet_sequence :: type_id :: create("pkt_seq");
    phase.raise_objection(this);
    pkt_seq.start(rtr_env.agnt_in.pkt_seqr);
    phase.drop_objection(this);
  endtask

endclass

`endif
                                                 
    
