`ifndef TEST_ENV_SV
`define TEST_ENV_SV

`include "environment.sv"

class base_test extends uvm_test;
  `uvm_component_utils(base_test)
  
  test_environment env_com;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    env_com = test_environment :: type_id::create("env_com",this);
  endfunction
  
  virtual function void end_of_elaboration_phase(input uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    `uvm_info("TEST_BASE","THIS IS THE BASE TEST CLASS", UVM_MEDIUM);
  endtask
  
endclass

`endif
  
