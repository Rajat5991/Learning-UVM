`ifndef MMON
`define MMON

`include "router_packet.sv"

class router_mmon extends uvm_monitor;
  `uvm_component_utils(router_mmon)
  
  uvm_analysis_port #(router_pkt) ap_mmon;
  virtual router_inf.master_mon vif;
  router_pkt pkt;
  
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    ap_mmon = new("ap_mmon",this);
    if(!uvm_config_db #(virtual router_inf.master_mon) :: get(this,"","r_mon_mif",vif))
      `uvm_fatal("MAST_MON_FATAL","CANNOT GET THE INTERFACE HANDLE IN MASTER MONITOR");
  endfunction
  
  
  virtual task run_phase(uvm_phase phase);
    forever
      begin
        @(negedge vif.clk)
        if(vif.master_mon_cb.valid_data) // after complete data is driven
          begin
           pkt = router_pkt :: type_id :: create("pkt");
           pkt.src_addr = vif.master_mon_cb.src_addr;
//         while(!vif.valid_data)
//          begin
//            @(posedge vif.clk);
//          end
           pkt.src_data = vif.master_mon_cb.src_data;
           ap_mmon.write(pkt);
          end
      end
  endtask
  
endclass

`endif

  
  
  
        
    
