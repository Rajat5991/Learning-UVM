`ifndef OUT_AGNT
`define OUT_AGNT

`include "output_monitor.sv"


class output_agent extends uvm_agent;
  `uvm_component_utils(output_agent)
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  output_monitor mon;
  
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = output_monitor :: type_id :: create("mon",this);
  endfunction
  
endclass

`endif

