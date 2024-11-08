`ifndef DRIVER_SV
`define DRIVER_SV

`include "packet.sv"

class driver extends uvm_driver#(packet);
  `uvm_component_utils(driver)
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
   forever
    begin
      seq_item_port.get_next_item(req);
      `uvm_info("DRIVER_TEST", req.sprint(),UVM_LOW);
      seq_item_port.item_done();
    end
  endtask
  
endclass

`endif
