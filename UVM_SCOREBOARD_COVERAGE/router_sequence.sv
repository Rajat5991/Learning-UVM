`ifndef SEQ
`define SEQ

`include "router_packet.sv"

class router_sequence extends uvm_sequence#(router_pkt);
  `uvm_object_utils(router_sequence)
  
  
  function new(input string name = "router_sequence");
    super.new(name);
  endfunction
  
  
  virtual task pre_start();
    `uvm_info("ROUTER_SEQUENCE","Running the router_sequence",UVM_LOW);
  endtask
  
  virtual task body();
    repeat(router_common::num_packets)
      begin
       `uvm_do(req);
        //`uvm_info("SEQ_PKTS",req.sprint(),UVM_LOW);
      end
  endtask
    
endclass

class router_interupt_sequence extends router_sequence;
  `uvm_object_utils(router_interupt_sequence)
  
  function new(input string name = "router_interupt_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    //super.body();
    fork
       `uvm_do(req);
      begin
         #30;
         req.reset = 1;
      end
    join
  endtask

endclass
  

`endif
  
    
