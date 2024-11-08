`ifndef ENV
`define ENV

`include "router_packet.sv"
`include "router_scoreboard.sv"
`include "router_magent.sv"
`include "router_sagent.sv"
//`include "router_ref.sv"
`include "router_cov.sv"

class router_env extends uvm_env;
  `uvm_component_utils(router_env)
  
  router_sbd sbd;
  router_magent magent;
  router_sagent sagent;
  //router_ref rrefn;
  router_cov rcov;
 
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    sbd = router_sbd :: type_id :: create("sbd",this);
    magent = router_magent :: type_id :: create("magent", this);
    sagent = router_sagent :: type_id :: create("sagent", this);
    //rrefn = router_ref :: type_id :: create("rrefn", this);
    rcov = router_cov :: type_id :: create("rcov", this);
  endfunction
  
  
  virtual function void connect_phase(input uvm_phase phase);
    super.connect_phase(phase);
    magent.rmmon.ap_mmon.connect(sbd.aport_mmon);
    sagent.rsmon.ap_smon.connect(sbd.aport_smon);
    magent.rmmon.ap_mmon.connect(rcov.analysis_export); // uvm_subscriber have a built in analysis_export
  endfunction
  
   virtual function void start_of_simulation_phase(input uvm_phase phase);
    super.start_of_simulation_phase(phase);
     `uvm_info("ROUTER_ENV_DEBUG","READY TO START THE ROUTER TEST ENVIRONMENT SIMULATION",UVM_LOW);
  endfunction
  

endclass

`endif

    
  
