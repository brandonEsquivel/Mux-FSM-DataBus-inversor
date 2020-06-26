/////////////////////////////////                      .        .
//  Brandon Equivel             //                        .  .
//  brandon.esquivel@ucr.ac.cr   ///////////............///////                               //////////.............//////    .                              //
//  June, 2020                 //                        .    .      .
////////////////////////////////                       .
      ///           ///
    ///               ///
  ///                   ///
////                    /////


// This module can be seen as a small block of memory, to be used with genvar, generate and for loop.

`ifndef REGID
`define REGID

module regid #(
// Parameters
parameter WORD_SIZE = 4
) (
    // INPUTS
    input wire [WORD_SIZE-1:0] data_in,
    input wire clk,
    input wire reset,
    // OUTPUTS
    output reg [WORD_SIZE-1:0] out
);
// INTERNAL NODES
reg [WORD_SIZE-1:0] mem;

    always @ (posedge clk) begin
        if(!reset) begin
            mem <= 0;
            out <= 0;
        end
        else begin
            mem <= data_in;
            out <= mem;
        end
    end

endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif

