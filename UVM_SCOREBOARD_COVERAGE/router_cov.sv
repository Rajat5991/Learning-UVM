`ifndef COV
`define COV

class router_cov extends uvm_subscriber#(router_pkt);
  `uvm_component_utils(router_cov)
  
  router_pkt pkt;
  
  
  covergroup rou_cov;
    CP_ADDR: coverpoint pkt.src_addr{
                 option.auto_bin_max = 8;
    }
    CP_DATA : coverpoint pkt.src_data {
                  option.auto_bin_max = 8;
    }
    X_ADDR_DATA : cross CP_ADDR, CP_DATA;
  endgroup
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
    rou_cov = new();
  endfunction
  
  function void write(router_pkt trans);
    $cast(pkt,trans);
    rou_cov.sample();
  endfunction
  
endclass

`endif
    
  
  
  
              
