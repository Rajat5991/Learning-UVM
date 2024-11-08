`ifndef DRV
`define DRV
`include "packet.sv"
class packet_driver extends uvm_driver#(packet);
  `uvm_component_utils(packet_driver)
  
  virtual switch_interface.testcase_port vi;
  //packet pkt;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual switch_interface.testcase_port)::get(this,"","vif",vi))
      `uvm_fatal("DRIVER_FATAL","could not get the interface handle");
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    forever
       begin
         seq_item_port.get_next_item(req);
         `uvm_info("DRIVER_RUN",req.sprint(),UVM_LOW);
         @(posedge vi.clk)
          vi.cb.src_addr <= req.src_addr;
         repeat(6)
           @(posedge vi.clk)
          vi.cb.src_data <= req.src_data;
         seq_item_port.item_done();
       end
  endtask
  
endclass
`endif
         
          
  
  
