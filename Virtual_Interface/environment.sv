`ifndef ENV
`define ENV
`include "driver.sv"

typedef uvm_sequencer#(packet) packet_sequencer;

class test_environment extends uvm_env;
  `uvm_component_utils(test_environment)
  
  packet_sequencer  pkt_seqr;
  packet_driver pkt_drv;
  int num_packets = 4;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    pkt_drv = packet_driver :: type_id :: create("pkt_drv",this);
    pkt_seqr = packet_sequencer :: type_id :: create("pkt_seqr",this);
    uvm_config_db #(int)::set(null,"*","num_pkts",num_packets); 
  endfunction
  
  virtual function void connect_phase(input uvm_phase phase);
    super.connect_phase(phase);
    pkt_drv.seq_item_port.connect(pkt_seqr.seq_item_export);
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    
    `uvm_info("TEST_ENV","WE ARE IN ENVIRONMENT",UVM_MEDIUM);
  endtask
  
endclass

`endif

