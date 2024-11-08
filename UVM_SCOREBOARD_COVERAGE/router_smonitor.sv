`ifndef SMON
`define SMON

class router_smon extends uvm_monitor;
  `uvm_component_utils(router_smon)
  
  uvm_analysis_port #(router_pkt) ap_smon;
  virtual router_inf.slave_mon vif;
  router_pkt pkt;
  
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap_smon = new("ap_smon",this);
    if(!uvm_config_db #(virtual router_inf.slave_mon) :: get(this,"","r_slv_sif",vif))
      `uvm_fatal("SLAVE_MON","CANNOT GET THE HANDLE IN THE SLAVE MONITOR");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever
      begin
        @(negedge vif.clk)
        if(vif.slave_mon_cb.valid_data)
          begin
            pkt = router_pkt :: type_id :: create("pkt");
            pkt.src_addr = vif.slave_mon_cb.src_addr;
            pkt.src_data = vif.slave_mon_cb.src_data;
            pkt.dst_addr = vif.slave_mon_cb.dst_addr;
            pkt.dst_data = vif.slave_mon_cb.dst_data;
            ap_smon.write(pkt);
          end
      end
  endtask
  
endclass

`endif

          
        

    
