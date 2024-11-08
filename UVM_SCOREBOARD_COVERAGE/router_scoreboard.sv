`ifndef SCBD
`define SCBD



`uvm_analysis_imp_decl(_mmon)
`uvm_analysis_imp_decl(_smon)

class router_sbd extends uvm_scoreboard;
  `uvm_component_utils(router_sbd)
  
  uvm_analysis_imp_mmon #(router_pkt,router_sbd) aport_mmon;
  uvm_analysis_imp_smon #(router_pkt,router_sbd) aport_smon;
  
  router_pkt m_pkt[$];
  router_pkt s_pkt[$];
  
  router_pkt mast;
  router_pkt slav;
  
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    aport_mmon = new("aport_mmon",this);
    aport_smon = new("aport_smon",this);
  endfunction
  
  virtual function void write_mmon(router_pkt pkt);
    pkt.dst_addr = pkt.src_addr + 1;
    pkt.dst_data = pkt.src_data + 1;
    m_pkt.push_back(pkt);
  endfunction
  
  virtual function void write_smon(router_pkt pkt);
    s_pkt.push_back(pkt);
  endfunction

  virtual task run_phase(input uvm_phase phase);
   // `uvm_info("ROUTER_SCOREBOARD_DEBUG","Entered Router Scoreboard Run Phase",UVM_LOW);
    forever
      begin
        wait((m_pkt.size && s_pkt.size )!= 0)
          begin
            mast = router_pkt :: type_id :: create("mast");
            slav = router_pkt :: type_id ::create("slav");
            mast = m_pkt.pop_front();
            slav = s_pkt.pop_front();
            if(mast.compare(slav))
              begin
                router_common :: num_matches ++;
              end
            else
              begin
                router_common :: num_mismatches ++;
                `uvm_info("MASTER",mast.sprint(),UVM_LOW);
                `uvm_info("SLAVE",slav.sprint(),UVM_LOW);
              end
          end            
      end
  endtask
  
endclass

`endif
    
  
  
