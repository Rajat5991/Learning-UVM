`ifndef TEST_SEQ_SV
`define TEST_SEQ_SV

`include "packet_sequence.sv"
`include "environment.sv"
`include "packet.sv"

class packet_test extends uvm_test;
  `uvm_component_utils(packet_test)
  
  test_environment env_com;
  packet_sequence pkt_seq;
  packet pkt;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    env_com = test_environment::type_id::create("env_com",this);
  endfunction
  
  virtual function void end_of_elaboration_phase(input uvm_phase phase);
     super.end_of_elaboration_phase(phase);
     uvm_top.print_topology();
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    
    pkt = packet :: type_id :: create("pkt");
    pkt.randomize();
    
    
    `uvm_info("TEST_INFO",pkt.sprint(),UVM_LOW);
    `uvm_info("TEST_INFO_PATH",$sformatf("%m"),UVM_LOW);
    
    /*pkt_seq = packet_sequence :: type_id :: create("pkt_seq");
    
    phase.raise_objection(this);        // Not a correct way to start the sequence for this TB setup because this start method will trigger the handshake between the driver, sequencer and sequence.Since we haven't                                                   implemented the driver for this setup. The sequencer won't able to receive the request and will result in the fatal time out error.
    pkt_seq.start(env_com.pkt_seqr);
    phase.raise_objection(this); */ 
  endtask
  
endclass

`endif

  
  
