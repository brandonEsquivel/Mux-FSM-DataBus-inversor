/////////////////////////////////                      .        .
//  Brandon Equivel             //                        .  .
//  brandon.esquivel@ucr.ac.cr   ///////////............///////
//                               //////////.............//////    .
//                              //
//  June, 2020                 //                        .    .      .
////////////////////////////////                       .
      ///           ///
    ///               ///
  ///                   ///
////                    /////

// TOP MODULE OF THE PROJECT 

`ifndef TB_FSM_MUX
`define TB_FSM_MUX

// scale time unit (value of one) / precision
`timescale 	1ns		/ 1ps
// includes verilog files
// Can be omitted and called from the testbench
// Cmos
`include "./lib/cmos_cells.v"
`include "./src/fsm_mux.v"
`include "./syn/fsm_mux_syn.v"
`include "./testers/t_fsm_mux.v"

module TestBench #(
// Parameters
parameter BUS_SIZE = 16
)(); // Testbench

// Once synthesized, the parameters cannot be changed, so they are left as is in this testbench and must be modified as needed

/*AUTOWIRE*/
wire  clk, reset;
wire [BUS_SIZE-1:0] bus_data_in_TB;

wire error_BTB;
wire [4:0] state_BTB;
wire error_STB;
wire [4:0] state_STB;



wire [BUS_SIZE-1:0] bus_data_out_BTB;
wire [BUS_SIZE-1:0] bus_data_out_STB;


/// BEHAV  ///

fsm_par_mux fsm_mux_TB(/*AUTOINST*/
  // Outputs
  .bus_data_out (bus_data_out_BTB),
  .error (error_BTB),
  .state (state_BTB),
  // Inputs
  .clk (clk),
  .bus_data_in (bus_data_in_TB),
  .reset (reset)
);



//SYN

fsm_par_mux_syn fsm_mux_syn_TB(/*AUTOINST*/
  //outputs
  .bus_data_out (bus_data_out_STB),
  .error (error_STB),
  .state (state_STB),
  // Inputs
  .clk (clk),
  .bus_data_in (bus_data_in_TB),
  .reset (reset)
);



///  TESTER  ////

t_fsm_par_mux t_fsm_parame_mux_TB(/*AUTOINST*/
  // Outputs
  .bus_data_out (bus_data_out_BTB),
  .error (error_BTB),
  .state (state_BTB),
  .bus_data_out_s (bus_data_out_STB),
  .error_s (error_STB),
  .state_s (state_STB),
  // Inputs
  .clk (clk),
  .bus_data_in (bus_data_in_TB),
  .reset (reset)
);



endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
