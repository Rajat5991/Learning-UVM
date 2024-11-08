`ifndef SAGNT
`define SAGNT

`include "router_smonitor.sv"

class router_sagent extends uvm_agent;
  `uvm_component_utils(router_sagent)
  
  router_smon rsmon;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    rsmon = router_smon :: type_id :: create("rsmon",this);
  endfunction
  
  
  
endclass

`endif

     
  
  
