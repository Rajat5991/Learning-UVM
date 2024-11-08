class packet extends uvm_sequence_item;
  `uvm_object_utils(packet)
  
  function new(input string name = "parent");
    super.new(name);
  endfunction
  
endclass
