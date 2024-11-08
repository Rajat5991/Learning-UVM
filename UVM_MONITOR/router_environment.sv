`ifndef RTR_ENV
`define RTR_ENV

`include "input_agent.sv"
`include "output_agent.sv"

class router_environment extends uvm_env;
  `uvm_component_utils(router_environment)
  
  input_agent agnt_in;
  output_agent agnt_out;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    agnt_in = input_agent :: type_id :: create("agnt_in",this);
    agnt_out = output_agent :: type_id :: create("agnt_out",this);
  endfunction
  
  
  virtual function void end_of_elaboration_phase(input uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
endclass

`endif
