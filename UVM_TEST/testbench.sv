// Code your testbench here
// or browse Examples
//import uvm_pkg::*;

program testbench();
  
 import uvm_pkg::*;
`include "testcase.sv";
  
  initial
     begin     
       run_test("hello_world");
     end
  
endprogram

