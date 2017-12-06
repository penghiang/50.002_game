module ram #(
    parameter SIZE = 8,  // size of each entry
    parameter DEPTH = 64  // number of entries
  )(
    input clk,                         // clock
    input [$clog2(DEPTH)-1:0] address, // address to read or write
    output reg [SIZE-1:0] read_data,   // data read
    input [SIZE-1:0] write_data,       // data to write
    input write_en                     // write enable (1 = write)
  );
 
  reg [SIZE-1:0] ram [DEPTH-1:0];      // memory array
 
  always @(posedge clk) begin
    read_data <= ram[address];         // read the entry
 
    if (write_en)                      // if we need to write
      ram[address] <= write_data;      // update that value
  end
 
endmodule