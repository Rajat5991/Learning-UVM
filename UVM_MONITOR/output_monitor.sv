`ifndef OUT_MON
`define OUT_MON

`include "packet.sv"


class output_monitor extends uvm_monitor;
  `uvm_component_utils(output_monitor)
  
  uvm_analysis_port #(packet) ap;
  virtual router_interface.testcase_port mif;
  
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual router_interface.testcase_port) :: get(this,"","vif",mif))
       `uvm_fatal("MON_ERROR","CANNPT GET THE INTERFACE HANDLE");
    ap =new("ap",this);
  endfunction
       
  virtual task run_phase(input uvm_phase phase);
    packet pkt;
   // @(negedge mif.clk)
    forever
      begin
        pkt = packet :: type_id :: create("pkt");
        @(posedge mif.clk)
         pkt.dst_addr = mif.cb.dst_addr;
        repeat(6)
          @(posedge mif.clk)
        pkt.dst_data = mif.cb.dst_data;   
        `uvm_info("MON_RUN_INF",pkt.sprint(),UVM_MEDIUM);
        ap.write(pkt);
      end
   endtask
       
endclass
         
`endif
  
  
