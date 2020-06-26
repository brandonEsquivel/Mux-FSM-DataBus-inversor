/////////////////////////////////                      .        .
//  Brandon Equivel             //                        .  .
//  brandon.esquivel@ucr.ac.cr   ///////////............///////                               //////////.............//////    .                              //
//  June, 2020                 //                        .    .      .
////////////////////////////////                       .
      ///           ///
    ///               ///
  ///                   ///
////                    /////


`ifndef FSM_MUX
`define FSM_MUX
 
`include "./src/register.v"
`include "./src/fsm.v"

module fsm_par_mux #(
// Parameters
parameter BUS_SIZE = 16,
parameter WORD_SIZE = 4,
parameter WORD_NUM = BUS_SIZE / WORD_SIZE
)(
  // Inputs
  input clk,
  input [BUS_SIZE-1:0] bus_data_in,
  input reset,
  output reg [BUS_SIZE-1:0] bus_data_out,
  output reg error,
  output reg [4:0] state
);
wire [BUS_SIZE-1:0] data_out;
wire nerror;
wire [4:0] nstate;


genvar i;
generate
for (i=0; i < WORD_NUM; i=i+1) begin : MEMBLOCK      // TAG / LABEL
  
  regid #(	  .WORD_SIZE	(WORD_SIZE)	                    // OVERWRITING INTERNAL PARAMETER 
        )
    control (   
						.clk	  	  (clk),
						.reset  		(reset),
						// Indexing by parts of an array in Verilog with [start +: width]
            // [8+: 8] equals [8:15], [0+: 8] equals [0: 7]
            // Syntax widely used in combination of to generate.
          	.data_in	  (bus_data_in	[(i*WORD_SIZE)+: WORD_SIZE]), 
						.out	  (data_out	[ (BUS_SIZE - 1 - i*WORD_SIZE) : (BUS_SIZE - (i+1)*WORD_SIZE)])   // inverse order
					);
	end
endgenerate

msf  #(	  .WORD_SIZE	(WORD_SIZE)	                    // OVERWRITING INTERNAL PARAMETER 
) FSMcontrol (   // inpyuts
      .clk   (clk),
      .reset (reset),
      .LSW   ( bus_data_in [ (BUS_SIZE-1) :  (BUS_SIZE-WORD_SIZE)   ] ),
      .MSW   ( bus_data_in [  (WORD_SIZE-1) : 0 ]      ),
      //outputs
      .Error_out      ( nerror ),
      .active_state   ( nstate )

);




always @( * ) begin
  bus_data_out = data_out;
  error = nerror;
  state = nstate;
end

endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
