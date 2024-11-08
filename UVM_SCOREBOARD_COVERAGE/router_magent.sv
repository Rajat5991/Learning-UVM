`ifndef MAGNT
`define MAGNT

`include "router_mmonitor.sv"
`include "router_mdriver.sv"

typedef uvm_sequencer#(router_pkt) router_seqr;

class router_magent extends uvm_agent;
  `uvm_component_utils(router_magent)
  
  router_mmon rmmon;
  router_mdrv rmdrv;
  router_seqr rseqr;
  uvm_active_passive_enum is_active = UVM_ACTIVE;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    rmmon = router_mmon :: type_id :: create("rmmon",this);
    if(is_active == UVM_ACTIVE)
     begin
       rmdrv = router_mdrv :: type_id :: create("rmdrv",this);
       rseqr = router_seqr :: type_id :: create("rseqr",this);
     end
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    rmdrv.seq_item_port.connect(rseqr.seq_item_export);
  endfunction
  
endclass

`endif

    
    
  
