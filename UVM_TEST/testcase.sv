class hello_world extends uvm_test;
  `uvm_component_utils(hello_world)
  
  function new(input string name, input uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void start_of_simulation_phase(input uvm_phase phase);
    uvm_top.print_topology();
    //factory.print();
  endfunction
  
  virtual task run_phase(input uvm_phase phase);
    $display("============HELLO WORLD============");
    `uvm_info("TEST","=====HELLO WORLD FROM UVM TEST======",UVM_MEDIUM);
  endtask
  
 endclass
