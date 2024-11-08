// Code your design here
module router(
  input wire clk, 
  input wire [47:0] src_addr,
  input wire [31:0] src_data,
  output reg [47:0] dst_addr,
  output reg [31:0] dst_data);
  
  always@(posedge clk)
     begin
        dst_addr <= src_addr+1;
        dst_data <= src_data+1;
     end

endmodule
  
