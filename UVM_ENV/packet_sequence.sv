`ifndef PKT_SEQ_SV
`define PKT_SEQ_SV
`include "packet.sv"

class packet_sequence extends uvm_sequence#(packet);
   `uvm_object_utils(packet_sequence)
  
function new(input string name = "packet_sequence");
  super.new(name);
endfunction

virtual task body();
 // req = packet :: type_id :: create("req");
  repeat(16)
    `uvm_do(req);
    //req.randomize();
    
  `uvm_info("TEST_INFO",$sformatf("req.sprint()"),UVM_LOW);
  `uvm_info("TEST_INFO",$sformatf("%m"),UVM_LOW);
endtask


endclass

`endif

