`ifndef TEST
`define TEST

//`include "router_common.sv"
`include "router_sequence.sv"
`include "router_environment.sv"

class router_test extends uvm_test;
  `uvm_component_utils(router_test)
  
   router_env env;
   router_sequence seq;
  
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    env = router_env :: type_id :: create("env",this);
  endfunction
  
  virtual function void end_of_elaboration_phase(input uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
  virtual function void start_of_simulation_phase(input uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("ROUTER_TEST_DEBUG","READY TO START THE ROUTER TEST SIMULATION",UVM_LOW);
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
   // `uvm_info("ROUTER_TEST_DEBUG","Entered the router_test run_phase",UVM_LOW);
    seq = router_sequence :: type_id :: create("seq");
    phase.raise_objection(this);
    seq.start(env.magent.rseqr);
    phase.drop_objection(this);
   // `uvm_info("ROUTER_TEST_DEBUG","Exited the router_test run_phase",UVM_LOW);
  endtask
  
  virtual function void report_phase(input uvm_phase phase);
    if(router_common :: num_mismatches > 0 && router_common :: num_packets != router_common :: num_matches)
     begin
      `uvm_info("MISMATCH","#################################",UVM_LOW);
    `uvm_error("FAILED", $sformatf("Number of mismatches = %d, Number of packet count = %d and Number of matches = %d", router_common::num_mismatches, router_common::num_packets, router_common::num_matches))
      `uvm_info("MISMATCH","#################################",UVM_LOW);
     end
    else
      begin
      `uvm_info("PASSED","#########################################",UVM_LOW);
      `uvm_info("SUCCESS","############### PASSED ##################",UVM_LOW);
      `uvm_info("PASSED","#########################################",UVM_LOW);
      end
  endfunction
  
  
endclass
  

class router_test_case extends router_test;
  `uvm_component_utils(router_test_case)
  
  router_interupt_sequence int_seq;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    int_seq = router_interupt_sequence :: type_id :: create("int_seq");
    phase.raise_objection(this);
    int_seq.start(env.magent.rseqr);
    phase.drop_objection(this);
  endtask
 
endclass
  
`endif
    
