/////////////////////////////////                      .        .
//  Brandon Equivel             //                        .  .
//  brandon.esquivel@ucr.ac.cr   ///////////............///////                               //////////.............//////    .                              //
//  June, 2020                 //                        .    .      .
////////////////////////////////                       .
      ///           ///
    ///               ///
  ///                   ///
////                    /////

// Tester for 
`ifndef T_FSM_MUX
`define T_FSM_MUX

module t_fsm_par_mux #(
// Parameters
parameter BUS_SIZE = 16,               // una vez sintetizado no se puede modificar, por eso hay que dejarlos tal cual
parameter WORD_SIZE = 4,
parameter WORD_NUM = BUS_SIZE / WORD_SIZE
)(
  // Outputs
  output reg  clk,
  output reg [BUS_SIZE-1:0] bus_data_in,
  output reg reset,
  // Inputs
  input wire [BUS_SIZE-1:0] bus_data_out,
  input wire error,
  input wire [4:0] state,
  input wire [BUS_SIZE-1:0] bus_data_out_s,
  input wire error_s,
  input wire [4:0] state_s

  );


initial begin
		$dumpfile("fsm_mux.vcd");
		$dumpvars;
  {bus_data_in} = 'h0;
  #4 reset = 0;

  // Begin test
  repeat (10) begin
  @(posedge clk);
  reset <= 0;
  end

 
// DATA IN MUST HAVE F IN UPPER WORD AND #1,2,3...WORD_NUM-1 AT LOWER WORD

  @(posedge clk) begin
    {bus_data_in} = 'hFFF0;
    reset <= 1;
    end
  
  @(posedge clk) begin
    {bus_data_in} = 'hFCB1;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hFF92;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hFCD3;
    end

  @(posedge clk) begin        
    {bus_data_in} = 'hFAB0;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hF881;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hF772;
    end


  @(posedge clk) begin
    {bus_data_in} = 'hF743;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hF570;
    end


  @(posedge clk) begin
    {bus_data_in} = 'hF711;
    end


  @(posedge clk) begin
    {bus_data_in} = 'hF7F2;
    end

 
  @(posedge clk) begin   //PKG ERROR, --> F 
    {bus_data_in} = 'h9993;
    end

 
  @(posedge clk) begin   
    {bus_data_in} = 'hF990;
    end

     
  @(posedge clk) begin    
    {bus_data_in} = 'hF9F1;
    end


  @(posedge clk) begin   //PKG ERROR, --> F 
    {bus_data_in} = 'hA9F2;
    end


  @(posedge clk) begin
    {bus_data_in} = 'hFFF0;
    reset <= 1;
    end
  
  @(posedge clk) begin
    {bus_data_in} = 'hFCB1;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hFF92;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hFCD3;
    end

  @(posedge clk) begin        
    {bus_data_in} = 'hFAB0;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hF881;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hF772;
    end


  @(posedge clk) begin
    {bus_data_in} = 'hF743;
    end

  @(posedge clk) begin
    {bus_data_in} = 'hF570;
    end


  @(posedge clk) begin          //SEQ ERROR
     {bus_data_in} = 'hF772;
    end
  
  @(posedge clk) begin
  end
   
  @(posedge clk) begin 
      #4 reset = 0;
  end
#40 $finish;
end // end initial

// clock logic
initial	clk	 		     	<= 0;			// Initial value to avoid indeterminations
always	#10 clk				<= ~clk;		// toggle every 10ns



endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
