`ifndef MDRV
`define MDRV

`include "router_packet.sv"

class router_mdrv extends uvm_driver#(router_pkt);
  `uvm_component_utils(router_mdrv)
  
  //router_pkt pkt;
  virtual router_inf.master_drv vif;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual router_inf.master_drv) :: get(this,"","r_drv_mif",vif))
       `uvm_fatal("DRIVER FATAL", "CANNOT GET THE VIRTUAL INTERFACE HANDLE IN MASTER DRIVER");
  endfunction
                  
  virtual task run_phase(uvm_phase phase);
    event thread1;
    forever
      begin
        seq_item_port.get_next_item(req);
        `uvm_info("DRIVER_PKT",req.sprint(),UVM_LOW);
        fork 
          begin : first
            drive_packet(req);
            ->thread1;
          end
          begin : second
            wait(req.reset == 1)
            @(negedge vif.clk)
             vif.master_drv_cb.reset <= 1;
            @(negedge vif.clk)
             vif.master_drv_cb.reset <= 0;
          end
          begin : Third
                @(thread1);
                  disable second;
          end
        join_none
        seq_item_port.item_done();
      end
  endtask
                  
  task drive_packet(router_pkt pkt);
    @(negedge vif.clk)
     vif.master_drv_cb.src_addr <= pkt.src_addr;
   repeat(6)
    @(negedge vif.clk);
     vif.master_drv_cb.valid_data <= 1; 
     vif.master_drv_cb.src_data <= pkt.src_data;
    @(negedge vif.clk)
     vif.master_drv_cb.src_addr <= 0;
     vif.master_drv_cb.src_data <= 0;
     vif.master_drv_cb.valid_data <= 0; 
  endtask

 endclass
                  
`endif
                  

 
        
