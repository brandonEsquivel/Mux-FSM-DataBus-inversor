/////////////////////////////////                      .        .
//  Brandon Equivel             //                        .  .
//  brandon.esquivel@ucr.ac.cr   ///////////............///////                               //////////.............//////    .                              //
//  June, 2020                 //                        .    .      .
////////////////////////////////                       .
      ///           ///
    ///               ///
  ///                   ///
////                    /////

// Implementation of FSM to control dataflux.

// Revision version: 0.3

`ifndef FSM
`define FSM

module msf #(
    parameter WORD_SIZE = 4

)

(
    input wire clk,
    input wire reset,
    input wire [WORD_SIZE -1:0] MSW,
    input wire [WORD_SIZE -1:0] LSW,
    
    output reg Error_out,
    output reg [4:0] active_state
    );

    /// registers or flip flop
    reg [4:0] state;
    reg [4:0] next_state;
    reg [4:0] error;
    reg       next_error;
    reg [1:0] iterator;
  
    //states
    parameter RESET     =   'b00000;    // 00    RESET CODE
    parameter FIRST_PKT =   'b00001;    // 01    First pkt code
    parameter REG_PKT   =   'b11010;    // 1A    Reg code
    parameter F_ERROR   =   'b01111;    // 0F    error F code
    parameter SEQ_ERROR =   'b01100;    // 0C    seq error code



    always @(posedge clk)begin
        if (!reset) begin
            state                <= RESET;
            error                <= 0;
            active_state         <= 0;
            iterator             <= 0;
        end else begin        
            state                <= next_state;
            iterator             <= {iterator} + 1;
            Error_out            <= next_error; 

    //always @(*)begin
    //////////////////////////////////////////////////////////////.....
            case (state)
                RESET: begin
                    error                   <= 0;
                    active_state            <= state;
                end

                FIRST_PKT: begin
                    error                   <= 0;
                    active_state            <= state;
                    end


                REG_PKT : begin
                    error                   <= 0;
                    active_state            <= state;
                    end 

                F_ERROR: begin
                    error                   <= F_ERROR;
                    active_state            <= state;
                    iterator                <= 0;

                end

                SEQ_ERROR: begin
                    error                   <= SEQ_ERROR;
                    active_state            <= state;
                    iterator                <= 0;
                end

                default: begin
                    error                   <= 0;
                    Error_out               <= 0;
                    active_state            <= RESET;
                    iterator                <= 0;
                end

            endcase
        end 
    end

    always @(*) begin
        if (!reset) begin
            next_error        =  0;
            next_state        = RESET;
        end else begin

        case (state)
            RESET: begin
                next_state              = FIRST_PKT;
                next_error              = 0;
            
            end
            FIRST_PKT: begin
                if (LSW != 4'hF) begin
                    next_state              = F_ERROR;
                    next_error              = 1;
                end else begin
                if (MSW != iterator ) begin
                    next_state              = SEQ_ERROR;
                    next_error              = 1;
                end else begin
                    next_state              = REG_PKT;
                    next_error              = 0;
                    end
                end
            end    

            REG_PKT : begin
                if (LSW != 'hF) begin
                    next_state              = F_ERROR;
                    next_error              = 1;
                end else begin
                if (MSW != iterator ) begin
                    next_state              = SEQ_ERROR;
                    next_error              = 1;
                end else begin
                    next_state              = REG_PKT;
                    next_error              = 0;
                    end
                end
            end
            
            F_ERROR: begin
                next_state                  = FIRST_PKT;
                next_error                  = 0;
            end
            
            
            SEQ_ERROR: begin
                next_state              = FIRST_PKT;
                next_error              = 0;
             end

            default: begin
                next_state              = REG_PKT;
                next_error              = 0;
            end

        endcase
        end
    end

endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
