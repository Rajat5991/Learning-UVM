`ifndef INP_AGNT
`define INP_AGNT

`include "packet.sv"
`include "packet_driver.sv"


typedef uvm_sequencer#(packet) packet_sequencer;

class input_agent extends uvm_agent;
  `uvm_component_utils(input_agent)
  
  uvm_active_passive_enum is_active;
  packet_driver drv ;
  packet_sequencer pkt_seqr;
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(uvm_active_passive_enum) :: get(this,"","is_active",is_active))
    `uvm_fatal("INPUT_AGNT_ERROR","CANNOT GET THE IS_ACTIVE");
    if(is_active)
     begin
      drv = packet_driver :: type_id :: create("drv",this);
      pkt_seqr = packet_sequencer :: type_id :: create("pkt_seqr",this);
     end
   // in_mon = input_monitor :: type_id :: create("in_mon",this);
  endfunction
  
  virtual function void connect_phase(input uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(pkt_seqr.seq_item_export);
  endfunction
  
endclass

`endif

    
  
  
